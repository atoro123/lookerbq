view: order_item {
  sql_table_name: ogv2_production.order_item ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: extra_cost {
    type: number
    sql: ${TABLE}.extra_cost ;;
  }

  dimension_group: first_placed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_placed ;;
  }

  dimension: frozen {
    type: yesno
    sql: ${TABLE}.frozen ;;
  }

  dimension: offer_id {
    group_label: "Offer"
    type: number
    sql: ${TABLE}.offer_id ;;
  }

  dimension: one_time {
    type: yesno
    sql: ${TABLE}.one_time ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: product_attribute_id {
    type: number
    sql: ${TABLE}.product_attribute_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }


  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  measure: count {
    type: count
    drill_fields: [order_details*]
  }

  ## Custom Dimensions / Measures






#
#   (oi.one_time is True
#             OR ss.subscription_type = 'IU Replenishment'OR of.offer_type IN (12, 13, 14, 19, 20, 23)
#             OR of.name LIKE '%IU%'OR of.name LIKE '%Impulse Upsell%')

  dimension: is_IU {
    type: yesno
    description: "Identify an order item as an Impulse Upsell item"
   sql: ${one_time} is True
    or ${subscription_offer.offer_name} LIKE '%IU%'
    or ${subscription_offer.offer_name} LIKE '%Impulse Upsell%'
    or ${subscription_offer.offer_type} IN (12,13,14,19,20,23)
    or ${subscription_subscription.subscription_type} = 'IU Replenishment';;

  }


  measure: total_IU_recurring_price {
    group_label: "Impulse Upsell"
    type: sum
    description: "Completed order item revenue for IU Recurring"
    sql: ${total_price} ;;
    filters: {
      field: order_order.status
      value: "5"
    }
    filters: {
      field: subscription_id
      value: "NOT NULL"
    }

    filters: {
      field: is_IU
      value: "YES"
    }

    value_format_name: usd
    drill_fields: [order_details*]
  }

  set: order_details {
    fields: [order_order.place_date, order_id, id, subscription_id, subscription_subscription.customer_id,customer_customer.merchant_user_id,total_price, product_product.name,is_IU]
  }

#   oi.one_time is True AND oi.subscription_id IS NULL AND oo.status = 5 AND oo.place


  measure: total_IU_onetime_price {
    group_label: "Impulse Upsell"
    type: sum
    description: "Completed order item revenue for IU One-Time"
    value_format_name: usd
    sql: ${total_price} ;;
    drill_fields: [order_details*]
    filters: {
      field: one_time
      value: "yes"
    }
    filters: {
      field: subscription_id
      value: "NULL"
    }
    filters: {
      field: order_order.status
      value: "5"
    }
    filters: {
      field: sms_item
      value: "no"
    }
    filters: {
      field: quickbuy_item
      value: "no"
    }
  }

  measure: total_recurring_price {
    type: sum
    description: "Completed order item revenue for Recurring Revenue. IU is not included in this total."
    sql: ${total_price} ;;
    filters: {
      field: order_order.status
      value: "5"
    }
    filters: {
      field: subscription_id
      value: "NOT NULL"
    }

    filters: {
      field: is_IU
      value: "NO"
    }
    value_format_name: usd
    drill_fields: [order_details*]
  }
  measure: total_gmv {
    type: sum
    description: "All order item revenue placed in Ordergroove system"
    sql: ${total_price} ;;
    filters: {
      field: order_order.status
      value: "5"
    }

    value_format_name: usd
    drill_fields: [order_details*]
  }
  measure: sum_IU_onetime_quantity {
    group_label: "Impulse Upsell"
    type: sum
    description: "Item quantity for IU One-Time"
    sql: ${quantity};;
    filters: {
      field: one_time
      value: "yes"
    }
    filters: {
      field: subscription_id
      value: "NULL"
    }
    drill_fields: [customer_customer.id,customer_customer.merchant_user_id,product_product.name,product_product.sku,order_order.place_date,price]
  }

  measure: sum_IU_Recurring_quantity {
    group_label: "Impulse Upsell"
    type: sum
    description: "Item quantity for IU Recurring"
    sql: ${quantity};;
    filters: {
      field: is_IU
      value: "YES"
    }
    filters: {
      field: subscription_id
      value: "NOT NULL"
    }
    drill_fields: [subscription_id,customer_customer.id,customer_customer.merchant_user_id,price,product_product.name,product_product.sku,subscription_subscription.frequency,customer_customer.id,customer_customer.merchant_user_id,subscription_subscription.created_date,subscription_subscription.live,order_order.place_date,subscription_subscription.cancelled_date]
  }

  dimension: sms_item {
    group_label: "Reorder"
    type:  yesno
    description: "Identifies items created from SMS offer"
    sql:  (${order_offer.offer_name} LIKE '%SMS%'
    or ${order_offer.offer_name} LIKE '%Reorder%')
    and ${order_offer.offer_name} NOT LIKE '%Impulse Upsell SMS%';;
  }

  dimension: quickbuy_item {
    group_label: "Reorder"
    type:  yesno
    description: "Identifies items created from Quickbuy offer"
    sql:  ${order_offer.offer_name} LIKE '%Quickbuy%' or  ${order_offer.offer_name} LIKE '%Quick Buy%';;
  }

  dimension: reorder {
    group_label: "Reorder"
    type: yesno
    description: "Identifies SMS and Quickbuy items"
    sql: ${sms_item} or ${quickbuy_item};;
  }

  measure: sms_revenue {
    group_label: "Reorder"
    type: sum
    sql: ${total_price} ;;
    value_format_name: usd
    drill_fields: [order_details*]
    filters: {field: sms_item
      value: "yes"}
  }

  measure: quickbuy_revenue {
    group_label: "Reorder"
    type: sum
    sql: ${total_price} ;;
    value_format_name: usd
    drill_fields: [order_details*]
    filters: {field: quickbuy_item
      value: "yes"}
  }

  measure: sms_orders {
    group_label: "Reorder"
    type: count_distinct
    sql: ${order_id} ;;
    filters: {field: sms_item
      value: "yes"}
    drill_fields: [order_details*]
  }

  measure: sms_orders_completed {
    group_label: "Reorder"
    type: count_distinct
    sql: ${order_id} ;;
    filters: {field: sms_item
      value: "yes"}
    filters: {field: order_order.status
      value: "5"}
    drill_fields: [order_details*]
  }

  measure: quickbuy_orders {
    type: count_distinct
    group_label: "Reorder"
    sql: ${order_id} ;;
    filters: {field: quickbuy_item
      value: "yes"}
    drill_fields: [order_details*]
  }

  measure: average_item_value {
    type: average
    sql: ${price} ;;
    value_format:"$#.00"
    drill_fields:[order_order.place_date,order_id,product_product.name,price]}

  measure: Total_Quantity {
    type: sum
    sql: ${quantity} ;;
    group_label: "Quantity"
  }

  measure: Unprocessed_Revenue {
    type: sum
    sql: ${total_price} ;;
    value_format_name: usd
  }

  measure: Pending_Revenue {
    type: sum
    sql: ${total_price} ;;
    value_format_name: usd
    filters: {
      field: order_order.status
      value: "1"
    }
  }

  dimension_group: today {
    type: time
    hidden: yes
    timeframes: [day_of_month, month, month_num, date, raw]
    sql: TIMESTAMP(current_date()) ;;
  }

  dimension: days_in_month {
    hidden: yes
    type: number
    sql:  CASE
          WHEN ${today_month_num} IN (4,6,9,11) THEN 30
          WHEN ${today_month_num} = 2 THEN 28
          ELSE 31
          END ;;
  }

  measure: total_recurring_revenue_forecast_this_month {
    required_fields: [order_order.place_month]
    label: "Sales Forecast This Month"
    type: number
    value_format_name: usd
    sql: case when ${order_order.place_month} = ${today_month}
         then ((sum(${total_price}) / max(${today_day_of_month})) * ${days_in_month}) - sum(${total_price})
         else null
         end ;;
  }
  measure: Average_Quantity {
      type: average
      sql: ${quantity} ;;
      group_label: "Quantity"
      value_format: "0.0"
  }

  dimension: Program {
    type: string
    sql: case when ${offer_id} in (2348,4356,2750,2762) then "illylovers Coffee (Select)"
         when ${offer_id} in (2346,3061,3221,3232,3369,3327,2751,2763) then "illylovers Machine (Select)"
        when ${offer_id} in (2347,3895,3769,3680,3681,3682,3683,3684,3685,3686,3687,3043,3044,3045,3046,3047,3048,3049,3050,3051,3052,3412,3413,3414,3415,3416,3417,3418,3419,3420,3421,
        2345,2344,2343,2333,2335,2336,2337,2338,2339,2340,2341,2342,2334,2295,3211,3212,3213,3214,3215,3216,3217,3218,3219,3220,3222,3223,3224,3225,3226,3227,3228,3229,3230,3231,
        3359,3360,3361,3362,3363,3364,3365,3366,3367,3368,3328,3329,3330,3331,3332,3333,3334,3335,3336,3337,2740,2741,2742,2743,2744,2745,2746,2747,2748,2749,2752,2753,2754,2755,
        2756,2757,2758,2759,2760,2761) then "Coffee Radio Button (PDP)"
        when ${offer_id} in (3118,3119,3120,3448,3449) then "Health Box"
        when ${offer_id} in (3443,3444,3445,3446,3447) then "Health Box Plus"
        Else "PDP" end;;
  }

  measure: distinct_orders {
    type: count_distinct
    sql: ${order_id} ;;
  }
}
