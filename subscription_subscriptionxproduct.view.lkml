view: subscription_subscriptionxproduct {
  sql_table_name: ogv2_production.subscription_subscriptionxproduct ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: relationship_type_id {
    type: number
    sql: ${TABLE}.relationship_type_id ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
