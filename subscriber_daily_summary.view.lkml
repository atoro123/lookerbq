view: subscriber_daily_summary {
  sql_table_name: og_analytics.subscriber_daily_summary ;;

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
      year,
      day_of_month
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

  measure: count_daily {
    type: count
    hidden: yes

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

  measure: Ending_Active_Base {
    type: number
    sql: ${active} ;;
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
