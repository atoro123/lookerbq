view: subscription_monthly_summary {
  sql_table_name: og_analytics.subscription_monthly_summary ;;

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
  dimension_group: Stagger_Month {
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
    sql: date_sub(${date_raw}, INTERVAL 1 DAY);;
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
    drill_fields: [id]
  }
  measure: active_end {
    type:  sum
    sql: ${active} ;;
filters: {
  field: subscription_type
  value: "NULL"
}
filters: {
  field: frequency_days
  value: "NULL"
}
  }
  measure: month_cancels{
    type: sum
    sql:  ${cancel} ;;
filters: {
  field: subscription_type
  value: "NULL"
}
filters: {
  field: frequency_days
  value: "NULL"
}
  }
  measure: beginning_active {
  type: number
  sql:  ${active_end} - ${month_cancels} + ${month_adds}
  ;;
  }

  measure: month_adds {
    type: sum
    sql: ${new} ;;
    filters: {
      field: subscription_type
      value: "NULL"
    }
    filters: {
      field: frequency_days
      value: "NULL"
  }
  }
measure: average_month_base {
  type: number
  sql:  (${active_end} + ${beginning_active})/2 ;;
}
measure: churn_rate {
  type:  number
  sql:  (${month_cancels}/${average_month_base})*100
  ;;
  value_format: "0.00%"
}
}
