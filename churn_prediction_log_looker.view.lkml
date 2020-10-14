view: churn_prediction_log_looker {
  sql_table_name: `production-202017.looker_scratch.churn_prediction_log_looker`
    ;;

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: cancelled {
    type: number
    sql: ${TABLE}.cancelled ;;
  }

  dimension: caught {
    type: number
    sql: ${TABLE}.caught ;;
  }

  dimension: confidence_value {
    type: number
    sql: ${TABLE}.confidence_value ;;
  }

  dimension_group: created_dt {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_dt ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: missed {
    type: number
    sql: ${TABLE}.missed ;;
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

  dimension_group: order {
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
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: percentile_value {
    type: number
    sql: ${TABLE}.percentile_value ;;
  }

  dimension: prediction_id {
    type: number
    sql: ${TABLE}.prediction_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  dimension_group: updated_dt {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_dt ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_cancelled {
    sql: ${cancelled} ;;
    type: sum
  }

  measure: sum_missed {
    sql: ${missed} ;;
    type: sum
  }

  measure: sum_caught {
    sql: ${caught} ;;
    type: sum
  }
}
