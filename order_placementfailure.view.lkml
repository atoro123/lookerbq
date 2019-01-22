view: order_placementfailure {
  sql_table_name: ogv2_production.order_placementfailure ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_date ;;
  }

  dimension: order_public_id {
    type: string
    sql: ${TABLE}.order_public_id ;;
  }

  dimension: placement_response_code {
    type: string
    sql: ${TABLE}.placement_response_code ;;
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
    sql: ${TABLE}.updated_date ;;
  }

  measure: record_count {
    type: count
    drill_fields: [id]
  }
}
