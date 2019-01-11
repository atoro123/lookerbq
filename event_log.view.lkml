view: event_log {
  sql_table_name: ogv2_production.event_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: email_html {
    type: string
    sql: ${TABLE}.email_html ;;
  }

  dimension_group: logged {
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
    sql: ${TABLE}.logged ;;
  }

  dimension: object_id {
    type: number
    sql: ${TABLE}.object_id ;;
  }

  dimension: object_metadata {
    type: string
    sql: ${TABLE}.object_metadata ;;
  }

  dimension_group: sent {
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
    sql: ${TABLE}.sent ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.type_id ;;
  }

  dimension: oos_pid {
    type: number
    sql: replace(right(${object_metadata},8),"}","") ;;
  }

  dimension_group: viewed {
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
    sql: ${TABLE}.viewed ;;
  }

  measure: action_count {
    type: count
    sql: ${object_id} ;;
    drill_fields: [id,object_id, type_id, logged_date]
    filters: {
      field: type_id
      value: "31,32,33,77"
    }
  }
}
