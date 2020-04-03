view: gmv_forecast {
  sql_table_name: production-202017.ogv2_consumerinsight.GMV_Forecast ;;

  dimension: activation_revenue_forecast {
    type: number
    sql: ${TABLE}.Activation_Revenue_Forecast ;;
  }

  dimension: active_subscriptions {
    type: number
    sql: ${TABLE}.Active_Subscriptions ;;
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
    sql: ${TABLE}.Date ;;
  }

  dimension: gmv {
    type: number
    sql: ${TABLE}.GMV ;;
  }

  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: monthly_ordered_subscription_count {
    type: number
    sql: ${TABLE}.Monthly_Ordered_Subscription_Count ;;
  }

  dimension: new_sub_created {
    type: number
    sql: ${TABLE}.new_sub_created ;;
  }

  dimension: new_subscriptions {
    type: number
    sql: ${TABLE}.New_Subscriptions ;;
  }

  dimension: prev_active {
    type: number
    sql: ${TABLE}.prev_active ;;
  }

  dimension: recurring_revenue_forecast {
    type: number
    sql: ${TABLE}.Recurring_Revenue_Forecast ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: GMV {
    type: max
    sql: ${gmv} ;;
  }
}
