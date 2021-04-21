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
      month_name,
      year,
      month_num
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
  measure: total_cancels {
    type: sum
    sql: ${cancel} ;;
  }
  measure:total_adds  {
    type: sum
    sql: ${new};;
  }

  measure: count_fields {
    type: count
    drill_fields: [id]
  }
  measure: active_end {
    type:  sum
    sql:  ${active} ;;
    drill_fields: [date_month,beginning_active,total_adds,total_cancels,active_end]

  }
  measure: beginning_active {
    type: number
    sql: ${active_end} + ${total_cancels} - ${total_adds};;
  }

  measure:  average_month_base{
    type: number
    sql: (${active_end}+${beginning_active})/2 ;;
  }
  measure: churn_rate {
    type: number
    sql: case when ${average_month_base} = 0 then 0 else (${total_cancels}/${average_month_base}) end ;;
    value_format: "0.00%"
  }
}
