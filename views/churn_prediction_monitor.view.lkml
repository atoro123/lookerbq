view: churn_prediction_monitor {
  sql_table_name: `production-202017.looker_scratch.churn_prediction_monitor`
    ;;

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }


  dimension: confidence_value {
    type: number
    sql: ${TABLE}.confidence_value ;;
  }


  dimension: percentile_value {
    type: number
    sql: ${TABLE}.percentile_value ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }


  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }


  dimension_group: next_order_date {
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
    sql: ${TABLE}.next_order_date ;;
  }



  dimension_group: order_date {
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
    sql: ${TABLE}.order_date ;;
  }



  dimension: next_order_id {
    type: number
    sql: ${TABLE}.next_order_id ;;
  }

  dimension: next_order_item_id {
    type: number
    sql: ${TABLE}.next_order_item_id ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: model_id {
    type: number
    sql: ${TABLE}.model_id ;;
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



  dimension: cancelled {
    type: number
    sql: ${TABLE}.cancelled ;;
  }


  dimension: changed {
    type: number
    sql: ${TABLE}.changed ;;
  }


  dimension_group: sent {
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
    sql: ${TABLE}.sent ;;
  }





  measure: over_caught_70 {
    type: sum
    sql: if(${percentile_value} > 0.7 AND ${cancelled} = 1, 1, 0) ;;
    value_format_name: decimal_2
  }

  measure: sum_cancelled {
    type: sum
    sql: ${cancelled} ;;
    value_format_name: decimal_2
  }

  measure: avg_percentile_value {
    type: average
    sql: ${percentile_value} ;;
    value_format_name: decimal_2
  }

  measure: sum_correct {
    type: sum
    sql: if((${percentile_value} > 0.5 AND ${cancelled} = 1) OR (${percentile_value} < 0.5 AND ${cancelled} = 0), 1, 0) ;;
    value_format_name: decimal_2
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
