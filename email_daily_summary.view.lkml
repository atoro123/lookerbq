view: email_daily_summary {
  sql_table_name: `production-202017.ogv2_consumerinsight.email_daily_summary`
    ;;

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension_group: email_created {
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
    sql: ${TABLE}.email_created ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: event_type_id {
    type: string
    sql: ${TABLE}.event_type_id ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: opens {
    type: number
    sql: ${TABLE}.opens ;;
  }

  dimension: sent {
    type: number
    sql: ${TABLE}.sent ;;
  }

  measure: count {
    type: count
    drill_fields: [event_name]
  }

  measure: sent_sum {
    type: sum
    sql: ${sent} ;;
  }

  measure: opens_sum {
    type: sum
    sql: ${opens} ;;
  }

  measure: clicks_sum {
    type: sum
    sql: ${clicks} ;;
  }
}
