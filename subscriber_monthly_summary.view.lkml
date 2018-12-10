view: subscriber_monthly_summary {
  sql_table_name: og_analytics.subscriber_monthly_summary ;;

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

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
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

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: new {
    type: number
    sql: ${TABLE}.new ;;
  }
  measure: total_cancels
  {
    type: sum
    sql: ${cancel} ;;
  }

  measure: count_fields {
    type: count
    drill_fields: [id]
  }
  measure: active_end {
    type:  sum
    sql: ${active} ;;

  }
  measure: beginning_active {
    type: number
    sql: ${active_end} - ${cancel} + ${new} ;;
  }

  measure:  average_month_base{
    type: number
    sql: (${active_end}+${beginning_active})/2 ;;
  }
  measure: churn_rate {
    type: number
    sql: (${cancel}/${average_month_base}) ;;
    value_format: "0.00%"
  }
}
