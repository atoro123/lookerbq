view: churn_prediction_monitor_actives {
  sql_table_name: `production-202017.looker_scratch.churn_prediction_monitor_actives`
    ;;

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: cancelled {
    type: number
    sql: ${TABLE}.cancelled ;;
  }

  dimension: changed {
    type: number
    sql: ${TABLE}.changed ;;
  }

  dimension: moved {
    type: number
    sql: ${TABLE}.moved ;;
  }

  dimension: completed {
    type: number
    sql: ${TABLE}.completed ;;
  }

  dimension: churn_prediction_id {
    type: number
    sql: ${TABLE}.churn_prediction_id ;;
  }

  dimension: confidence_value {
    type: number
    sql: ${TABLE}.confidence_value ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: model_id {
    type: number
    sql: ${TABLE}.model_id ;;
  }

  dimension_group: next_order {
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
    sql: ${TABLE}.next_order_date ;;
  }

  dimension: next_order_id {
    type: number
    sql: ${TABLE}.next_order_id ;;
  }

  dimension: next_order_item_id {
    type: number
    sql: ${TABLE}.next_order_item_id ;;
  }

  dimension: percentile_value {
    type: number
    sql: ${TABLE}.percentile_value ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }



  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_cancelled {
    type: sum
    sql: ${cancelled} ;;
    value_format_name: decimal_2
  }

  measure: sum_changed {
    type: sum
    sql: ${changed} ;;
    value_format_name: decimal_2
  }

  measure: sum_completed {
    type: sum
    sql: ${completed} ;;
    value_format_name: decimal_2
  }

  measure: sum_moved {
    type: sum
    sql: ${moved} ;;
    value_format_name: decimal_2
  }

}
