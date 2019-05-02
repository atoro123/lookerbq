view: analytics_summary {
  sql_table_name: og_analytics.analytics_summary ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: active_subscription_value {
    type: number
    sql: ${TABLE}.active_subscription_value ;;
  }

  dimension: cancellations {
    type: number
    sql: ${TABLE}.cancellations ;;
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

  dimension: existing_subscriptions {
    type: number
    sql: ${TABLE}.existing_subscriptions ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: new_subscriptions {
    type: number
    sql: ${TABLE}.new_subscriptions ;;
  }

  dimension: orders {
    type: number
    sql: ${TABLE}.orders ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: subscribers {
    type: number
    sql: ${TABLE}.subscribers ;;
  }

  dimension: subscriptions {
    type: number
    sql: ${TABLE}.subscriptions ;;
  }

  dimension: sum_subscription_frequency {
    type: number
    sql: ${TABLE}.sum_subscription_frequency ;;
  }

  dimension: sum_subscription_value {
    type: number
    sql: ${TABLE}.sum_subscription_value ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
