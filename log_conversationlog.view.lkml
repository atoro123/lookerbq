view: log_conversationlog {
  sql_table_name: sms.log_conversationlog ;;

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
    sql: CAST(${TABLE}._metadata__timestamp AS TIMESTAMP) ;;
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
    sql: CAST(${TABLE}._metadata_timestamp AS TIMESTAMP) ;;
  }

  dimension: _metadata_type {
    type: string
    sql: ${TABLE}._metadata_type ;;
  }

  dimension: adventure_id {
    type: string
    sql: ${TABLE}.adventure_id ;;
  }

  dimension: content {
    type: string
    sql: ${TABLE}.content ;;
  }

  dimension: conversation_id {
    type: string
    sql: ${TABLE}.conversation_id ;;
  }

  dimension: end_user_id {
    type: string
    sql: ${TABLE}.end_user_id ;;
  }

  dimension_group: logged {
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
    sql: ${TABLE}.logged ;;
  }

  dimension: step_name {
    type: string
    sql: ${TABLE}.step_name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  measure: count {
    type: count
    drill_fields: [step_name]
  }
}
