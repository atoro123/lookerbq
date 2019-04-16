view: subscription_daily_summary {
  sql_table_name: og_analytics.subscription_daily_summary ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: active {
    type: number
    sql: ${TABLE}.active ;;
  }

  dimension: cancel {
    type: number
    sql: ${TABLE}.cancel ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: frequency_days {
    type: number
    sql: ${TABLE}.frequency_days ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: new {
    type: number
    sql: ${TABLE}.new ;;
  }

  dimension: subscription_type {
    type: string
    sql: ${TABLE}.subscription_type ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [id]
  }
}
