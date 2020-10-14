view: churn_prediction_log {
  sql_table_name: `production-202017.churn_model_tables.churn_prediction_log`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _metadata__timestamp {
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
    sql: ${TABLE}._metadata__timestamp ;;
  }

  dimension: _metadata__uuid {
    type: string
    sql: ${TABLE}._metadata__uuid ;;
  }

  dimension: _metadata_database {
    type: string
    sql: ${TABLE}._metadata_database ;;
  }

  dimension: _metadata_deleted {
    type: yesno
    sql: ${TABLE}._metadata_deleted ;;
  }

  dimension: _metadata_log_file {
    type: string
    sql: ${TABLE}._metadata_log_file ;;
  }

  dimension: _metadata_log_position {
    type: number
    sql: ${TABLE}._metadata_log_position ;;
  }

  dimension_group: _metadata_timestamp {
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
    sql: ${TABLE}._metadata_timestamp ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
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
    drill_fields: [id]
  }
}
