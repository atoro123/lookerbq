view: order_placementfailure {
  sql_table_name: ogv2_production.order_placementfailure ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: count {
    label: "Retried Orders"
    description: "The number of retries attempted on the order"
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension_group: created {
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}.order_public_id ;;
  }

  dimension: placement_response_code {
    hidden: yes
    type: string
    sql: ${TABLE}.placement_response_code ;;
  }

  dimension_group: updated {
    hidden: yes
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
    hidden: yes
    type: count
    drill_fields: [id]
  }

  measure: Retried_Orders{
    type: count_distinct
    description: "Count of unique orders with at least 1 retry on the order"
    sql: ${order_public_id} ;;
    filters: {field:count
      value:">0"}
  }
}
