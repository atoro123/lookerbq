view: customer_info {
  derived_table: {
    sql: SELECT distinct customer_id, min(created)
      FROM ogv2_production.subscription_subscription
      group by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: mincreated {
    type: time
    sql: ${TABLE}.`min(created)` ;;
  }

  set: detail {
    fields: [customer_id, mincreated_time]
  }
}
