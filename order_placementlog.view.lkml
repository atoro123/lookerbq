view: order_placementlog {
  sql_table_name: ogv2_production.order_placementlog ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
    sql: ${TABLE}.created ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: payload {
    type: string
    sql: ${TABLE}.payload ;;
  }

  dimension: placement_config {
    type: string
    sql: ${TABLE}.placement_config ;;
  }

  dimension: placement_type {
    type: number
    sql: ${TABLE}.placement_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: Rejected_Reason {
    type: string
    sql: substring_index(substring(${payload}, 107),"<",1) ;;
  }
}
