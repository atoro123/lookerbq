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

  dimension: reactivate {
    type: number
    sql: ${TABLE}.reactivate ;;
  }

  measure: Total_Reactivations{
    type: sum
    sql: ${reactivate} ;;
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
      year,
      day_of_month
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

  measure: active_end {
    type:  sum
    sql:  cast(${active} as signed) ;;
  }

  measure: Total_Cancels {
    type: sum
    sql: ${cancel} ;;
  }

  measure: Total_Adds {
    type: sum
    sql: ${new} ;;
  }

  measure: Beginning_Active_Base{
    type: number
    sql: ${active}-${Total_Adds}+${Total_Cancels};;
  }

  measure: Churn {
    type: number
    sql: ${Total_Cancels}/((${active}+${Beginning_Active_Base})/2) ;;
    value_format: "0.0%"
  }
}
