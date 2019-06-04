include: "event_log.view.lkml"

view: subscription_event_log {
  extends: [event_log]

dimension: Subscription_ID {
  type: number
  sql: ${TABLE}.object_id ;;
}

dimension: Action {
  type: number
  sql: ${type_id} where ${type_id} in (5,8,10,11,12,13,14,15,16,17,18,19,20,30,71,73);;
}

measure: Distinct_Customers {
  type: count_distinct
  sql: ${customer_id} ;;
}

dimension: SKU_Swap_To_Product_Walmart_CA {
  type: number
  sql:  left(right(${object_metadata},8),7);;
}

  dimension: SKU_Swap_From_Product_Walmart_CA {
    type: number
    sql:  left(right(${object_metadata},25),7);;
  }

}
