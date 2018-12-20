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
#   (oi.one_time = 1
#             OR ss.subscription_type = 'IU Replenishment'OR of.offer_type IN (12, 13, 14, 19, 20, 23)
#             OR of.name LIKE '%IU%'OR of.name LIKE '%Impulse Upsell%')

  dimension: is_IU {
    type: yesno
    description: "Identify an order item as an Impulse Upsell item"
   sql: ${one_time} = 1
    or ${subscription_offer.name} LIKE '%IU%'
    or ${subscription_offer.name} LIKE '%Impulse Upsell%'
    or ${subscription_offer.offer_type} IN (12,13,14,19,20,23)
    or ${subscription_subscription.subscription_type} = 'IU Replenishment';;

  }


  measure: total_IU_recurring_price {
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

#   oi.one_time = 1 AND oi.subscription_id IS NULL AND oo.status = 5 AND oo.place


  measure: total_IU_onetime_price {
    type: sum
    description: "Completed order item revenue for IU One-Time"
    value_format_name: usd
    sql: ${total_price} ;;
    drill_fields: [order_details*]
    filters: {
      field: one_time
      value: "1"
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
      field: reorder
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
    type: sum
    description: "Item quantity for IU One-Time"
    sql: ${quantity};;
    filters: {
      field: one_time
      value: "1"
    }
    filters: {
      field: subscription_id
      value: "NULL"
    }
    drill_fields: [customer_customer.id,customer_customer.merchant_user_id,product_product.name,product_product.sku,order_order.place_date,price]
  }

  measure: sum_IU_Recurring_quantity {
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
    type:  yesno
    description: "Identifies items created from SMS offer"
    sql:  ${order_offer.name} LIKE '%SMS%'
    or ${order_offer.name} LIKE '%Reorder%' ;;
  }

  dimension: quickbuy_item {
    type:  yesno
    description: "Identifies items created from Quickbuy offer"
    sql:  ${order_offer.name} LIKE '%Quickbuy%';;
  }

  dimension: reorder {
    type: yesno
    description: "Identifies SMS and Quickbuy items"
    sql: ${sms_item} = 'yes' or ${quickbuy_item} = 'yes'  ;;
  }

  measure: sms_revenue {
    type: sum
    sql: ${total_price} ;;
    value_format_name: usd
    drill_fields: [order_details*]
    filters: {field: sms_item
      value: "yes"}
  }

  measure: quickbuy_revenue {
    type: sum
    sql: ${total_price} ;;
    value_format_name: usd
    drill_fields: [order_details*]
    filters: {field: quickbuy_item
      value: "yes"}
  }

  measure: sms_orders {
    type: count_distinct
    sql: ${order_id} ;;
    filters: {field: sms_item
      value: "yes"}
  }

  measure: quickbuy_orders {
    type: count
    sql: ${order_id} ;;
    filters: {field: quickbuy_item
      value: "yes"}
  }
}
