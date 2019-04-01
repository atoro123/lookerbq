view: subscription_subscription {
  sql_table_name: ogv2_production.subscription_subscription ;;

  dimension: id {
    primary_key: yes
    label: "Subscription ID"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension: cancel_reason_code_id {
    hidden: yes
    type: number
    sql: ${TABLE}.cancel_reason_code_id ;;
  }

  dimension_group: cancelled {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month
    ]
    sql: ${TABLE}.cancelled ;;
  }

  dimension: club_id {
    hidden: yes
    type: number
    sql: ${TABLE}.club_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_month,
      hour,
      hour_of_day
    ]
    sql: ${TABLE}.created ;;
  }

  dimension_group: GMT_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_month
    ]
    sql: date_add(${TABLE}.created, INTERVAL 5 HOUR) ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  measure: customer_create{
    alias: [cusotmer_create]
    type: count_distinct
    sql: ${customer_id};;

  }

  dimension: customer_rep_id {
    hidden: yes
    type: number
    sql: ${TABLE}.customer_rep_id ;;
  }

  dimension: every {
    type: number
    sql: ${TABLE}.every ;;
  }

  dimension: every_period {
    type: number
    sql: ${TABLE}.every_period ;;
  }

  dimension: extra_data {
    type: string
    sql: ${TABLE}.extra_data ;;
  }

  dimension: frequency_days {
    type: number
    sql: ${TABLE}.frequency_days ;;
  }

  dimension: iteration {
    type: number
    sql: ${TABLE}.iteration ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: merchant_order_id {
    type: string
    sql: ${TABLE}.merchant_order_id ;;
  }

  dimension: offer_id {
    type: number
    sql: ${TABLE}.offer_id ;;
  }

  dimension: payment_id {
    hidden: yes
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: product_attribute_id {
    hidden: yes
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

  dimension: reminder_days {
    type: number
    sql: ${TABLE}.reminder_days ;;
  }

  dimension: sequence {
    hidden: yes
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: session_id {
    hidden: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: shipping_address_id {
    hidden: yes
    type: number
    sql: ${TABLE}.shipping_address_id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: subscription_type {
    type: string
    sql: ${TABLE}.subscription_type ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_id,customer_customer.merchant_user_id,id,product_product.name,product_product.sku,frequency_days,clean_cancel,cancelled_date,created_date,24hr_Cancel]
  }
  dimension: clean_cancel {
    sql:
    case
    when left(${cancel_reason},2) = '1|' then 'Other'
    when left(${cancel_reason},2) = '2|' then 'Overstocked'
    when left(${cancel_reason},2) = '3|' then 'No Longer Use'
    when left(${cancel_reason},2) = '4|' then 'Product Change'
    when left(${cancel_reason},2) = '5|' then 'Base Unit Change'
    when left(${cancel_reason},2) = '6|' then 'Buying Product Elsewhere'
    when left(${cancel_reason},2) = '7|' then 'General Issue'
    when left(${cancel_reason},2) = '8|' then 'Too Expensive'
    when left(${cancel_reason},2) = '9|' then 'Price Issue'
    when left(${cancel_reason},2) = '10' then 'Limited Shopping Choices'
    when left(${cancel_reason},2) = '11' then 'Shipping Price'
    when left(${cancel_reason},2) = '12' then 'Product Perpetually Out of Stock'
    when left(${cancel_reason},2) = '13' then 'Mistake'
    when left(${cancel_reason},2) = '14' then 'Product different from what ordered'
    when left(${cancel_reason},2) = '15' then "Tried and don't like"
    when left(${cancel_reason},2) = '16' then 'Found a better deal'
    when left(${cancel_reason},2) = '17' then 'Understocked'
    when left(${cancel_reason},2) = '18' then 'Payment Issue'
    when left(${cancel_reason},2) = '19' then 'Not enough choice'
    when left(${cancel_reason},2) = '20' then 'Relocating'
    when left(${cancel_reason},2) = '21' then 'Switching to Electric Shaving'
    when left(${cancel_reason},2) = '22' then 'Product Change'
    when left(${cancel_reason},2) = '23' then 'Pet Passed'
    when left(${cancel_reason},2) = '24' then 'Allergic Reaction to Product'
    when left(${cancel_reason},2) = '25' then 'Online Management Issue'
    when left(${cancel_reason},2) = '26' then 'Issue updating payment'
    when left(${cancel_reason},2) = '27' then 'Reorganizing Subscriptions'
    when left(${cancel_reason},2) = '28' then 'Commitment Subscription period end'
    when left(${cancel_reason},2) = '29' then 'Signed up for the discount'
    when left(${cancel_reason},2) = '30' then 'Signed up for free shipping'
    when left(${cancel_reason},2) = '31' then 'Difficulty managing subscription'
    when left(${cancel_reason},2) = '32' then 'Changed Mind'
    when left(${cancel_reason},2) = '33' then 'No longer want subscription'
    when left(${cancel_reason},2) = '34' then 'Easier to pick up in store'
    ELSE 'Other' END
          ;;
          drill_fields: [clean_cancel,cancel_reason,id, created_date, cancelled_date, frequency_days, product_product.name, product_product.sku]
  }

  dimension: bucket_frequency {
    type: tier
    style: interval
    tiers: [0,7,14,28,30,45,60,90,120,150,180,270,365]
    sql: ${frequency_days};;
    value_format: "0"
  }

  dimension: 24hr_Cancel {
    type: yesno
    sql: case when ${cancelled_raw} < (${created_raw} + INTERVAL 1 DAY) then 1 else 0 end ;;
  }

  dimension: created_logic {
    type: number
    sql:  case when ${created_date} = ${customer_facts.created_date} then 1 else 0 end ;;
    hidden: yes
  }

  dimension: is_min_created {
    type:  yesno
    sql: ${created_logic} = 1 ;;
  }

  measure: distinct_customers {
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: Sups_per_Sub {
    type: number
    value_format: "0.00"
    sql: ${count}/${distinct_customers} ;;
    drill_fields: [customer_id,customer_customer.merchant_user_id,count]
  }

  measure: Total_Quantity {
    type: sum
    sql: ${quantity} ;;
  }

  dimension: Subscription_lifetime {
    type: number
    hidden: yes
    sql:DATEDIFF(${cancelled_date},${created_date}) ;;
  }

  dimension: Bucket_Lifetime {
  type: number
  hidden: yes
  sql:  case when ${Subscription_lifetime} <= 30 then '30'
              when ${Subscription_lifetime} <= 60 then '60'
              when ${Subscription_lifetime} <= 90 then '90'
              when ${Subscription_lifetime} <= 180 then '180'
              when ${Subscription_lifetime} <= 365 then '365'
              when ${Subscription_lifetime} > 365 then '366'
              when ${Subscription_lifetime} IS NULL then 'NULL'
              else 'error' end;;
  }

  dimension: In_Store {
    type: yesno
    sql: ${offer_id} in (2309,2547,1881,1883,1674,1675,1676,1678,1914,1924,1926,1919) ;;
  }

  dimension: Program {
    type: string
    sql: case when ${offer_id} in (2498,2491,2492,2490,2489,2488,3724,2348,3895,2762,2750) then "Coffee"
         when ${offer_id} in (2493,2495,2494,2496,2346,2763,2751,3232,3221) then "Machine"
        when ${offer_id} in (3118,3119,3120,3448,3449) then "Health Box"
        when ${offer_id} in (3444,3445,3446,3447) then "Health Box Plus"
        Else "PDP" end;;
  }

  measure: Average_Frequency {
    type: average
    sql: ${frequency_days} ;;
    value_format: "0.0"
  }

  measure: Average_Lifetime {
    type: average
    sql: ${Subscription_lifetime} ;;
    value_format: "0.0"
  }

  dimension_group: Missed_Order {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
      ]
    sql: date_add(${cancelled_date}, INTERVAL ${frequency_days} DAY) ;;
    drill_fields: [customer_id,customer_customer.merchant_user_id,id,product_product.name,product_product.sku,frequency_days,clean_cancel,cancelled_date,created_date,24hr_Cancel]
  }

  measure: Value {
    type: sum
    sql: (${product_product.price}*${quantity}) ;;
    value_format: "$#,###"
  }

  measure: Orders {
    type: count_distinct
    hidden: yes
    sql:  ${order_order.id} ;;
    filters: {
      field: order_order.status
      value: "5"
    }
    value_format: "0"
  }

  measure: AVG_Orders {
    type: number
    sql: ${Orders}/${count} ;;
    value_format: "0.0"
  }

  dimension: store_id {
    type: number
    sql: case when ${merchant_id} = 76 then convert(left(right(${extra_data},length(${extra_data})-locate("store_id",${extra_data})-11),4), SIGNED)
    when ${merchant_id} = 113 then right(left(${merchant_order_id}, 8 ),4)
    when ${merchant_id} = 127 then right(left(${extra_data}, 23 ),5)
    when ${merchant_id} = 210 then right(left(${extra_data}, 18 ),3) else null end ;;
  }


  dimension: store_associate_id {
    type: number
    sql: case when ${merchant_id} = 76 then convert(left(right(${extra_data},28),6), SIGNED) else null end ;;
  }

  measure: susbcription_price {
    type: sum
    sql: ${price} ;;
    value_format: "$#,##0.00"
  }

  dimension: New_Existing {
    label: "New"
    type: yesno
    sql:${created_date} = ${customer_facts.created_date};;
  }

  dimension: Guest_User {
    type: yesno
    sql: ${customer_customer.merchant_user_id} is null ;;
  }

  measure: days_in_period {
    type: count_distinct
    sql: ${created_date} ;;
  }
#
#   dimension: current_date {
#     type: date_month
#     sql: CURDATE() ;;
#   }

#  measure: order_result_str {
#    type: string
#    sql: group_concat(${order_order.status});;
#  }
}
