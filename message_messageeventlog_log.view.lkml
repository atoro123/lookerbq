view: message_messageeventlog_log {
  sql_table_name: `production-202017.sms.message_messageeventlog_log`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
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

  dimension: _metadata_type {
    type: string
    sql: ${TABLE}._metadata_type ;;
  }

  dimension: created_base_date {
    type: date
    sql: TIMESTAMP(${TABLE}.created) ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created ;;
  }

  dimension: external_resource_id {
    type: string
    sql: ${TABLE}.external_resource_id ;;
  }

  dimension: message_id {
    type: string
    sql: ${TABLE}.message_id ;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider ;;
  }

  dimension: sender {
    type: string
    sql: ${TABLE}.sender ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }




  measure: attempt_count {
    type: sum
    sql: if(${status} = "attempted", 1, 0) ;;
    value_format_name: decimal_2
  }

  measure: delivered_count {
    type: sum
    sql: if(${status} = "delivered", 1, 0) ;;
    value_format_name: decimal_2
  }


  measure: open_count {
    type: sum
    sql: if(${status} = "open", 1, 0) ;;
    value_format_name: decimal_2
  }

  measure: click_count {
    type: sum
    sql: if(${status} = "click", 1, 0) ;;
    value_format_name: decimal_2
  }

  dimension: merchant_name {
    type: string
    sql: SPLIT(${TABLE}.sender , '@')[OFFSET(0)]  ;;
  }

}
