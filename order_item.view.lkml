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
    sql:
    (${subscription_id} is NOT NULL
    and
    (${one_time} = 1
    or ${order_offer.name} LIKE '%IU%'
    or ${order_offer.name} LIKE '%Impulse Upsell%'
    or ${order_offer.offer_type} IN (12,13,14,19,20,23)
    or ${subscription_subscription.subscription_type} = 'IU Replenishment'))
    or (${subscription_id} is NULL and ${one_time} = 1)
    ;;
  }


  measure: total_IU_recurring_price {
    type: sum
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
    fields: [id, total_price, product_id]
  }

#   oi.one_time = 1 AND oi.subscription_id IS NULL AND oo.status = 5 AND oo.place


  measure: total_IU_onetime_price {
    type: sum
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
  }

  measure: total_recurring_price {
    type: sum
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
    sql: ${quantity};;
    filters: {
      field: one_time
      value: "1"
    }
    filters: {
      field: subscription_id
      value: "NULL"
    }
  }

  measure: sum_IU_Recurring_quantity {
    type: sum
    sql: ${quantity};;
    filters: {
      field: is_IU
      value: "YES"
    }
    filters: {
      field: subscription_id
      value: "NOT NULL"
    }
  }

  dimension: reorder_item {
    type:  yesno
    sql:  ${order_offer.name} LIKE '%SMS%'
    or ${order_offer.name} LIKE '%Reorder%' ;;
  }
}
