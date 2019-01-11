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
    type: number
    sql: ${cancel} ;;
  }
  measure:total_adds  {
    type: number
    sql: ${new};;
  }

  measure: count_fields {
    type: count
    drill_fields: [id]
  }
  measure: active_end {
    type:  sum
    sql:  cast(${active} as signed) ;;
    drill_fields: [date_month,beginning_active,total_adds,total_cancels,active_end]

  }
  measure: beginning_active {
    type: number
    sql: cast(${active_end} as signed) + cast(${total_cancels} as signed) - cast(${total_adds} as signed);;
  }

  measure:  average_month_base{
    type: number
    sql: (${active_end}+${beginning_active})/2 ;;
  }
  measure: churn_rate {
    type: number
    sql: (${total_cancels}/${average_month_base}) ;;
    value_format: "0.00%"
  }
}
