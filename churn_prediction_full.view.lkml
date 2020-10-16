view: churn_prediction_full {
  sql_table_name: `production-202017.looker_scratch.churn_prediction_full`
    ;;

  dimension: accurate {
    type: number
    sql: ${TABLE}.accurate ;;
  }

  dimension: catch_high {
    type: number
    sql: ${TABLE}.catch_high ;;
  }

  dimension: catch_low {
    type: number
    sql: ${TABLE}.catch_low ;;
  }

  dimension: all_high {
    type: number
    sql: ${TABLE}.all_high ;;
  }

  dimension: all_low {
    type: number
    sql: ${TABLE}.all_low ;;
  }


  dimension: cancelled {
    type: number
    sql: ${TABLE}.cancelled ;;
  }

  dimension: changed {
    type: number
    sql: ${TABLE}.changed ;;
  }

  dimension: confidence_value {
    type: number
    sql: ${TABLE}.confidence_value ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: active {
  type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: model_id {
    type: number
    sql: ${TABLE}.model_id ;;
  }

  dimension_group: new_order {
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
    sql: ${TABLE}.new_order_date ;;
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

  measure: sum_changed {
    sql: ${changed} ;;
    type: sum
  }

  measure: sum_accurate {
    sql: ${accurate} ;;
    type: sum
  }


  measure: sum_catch_high {
    sql: ${catch_high} ;;
    type: sum
  }

  measure: sum_catch_low {
    sql: ${catch_low} ;;
    type: sum
  }

  measure: sum_all_high {
    sql: ${all_high} ;;
    type: sum
  }

  measure: sum_all_low {
    sql: ${all_low} ;;
    type: sum
  }
}
