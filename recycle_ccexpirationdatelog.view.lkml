view: recycle_ccexpirationdatelog {
  sql_table_name: `production-202017.ogv2_production.recycle_ccexpirationdatelog`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _metadata__timestamp {
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}._metadata__uuid ;;
  }

  dimension: _metadata_database {
    hidden: yes
    type: string
    sql: ${TABLE}._metadata_database ;;
  }

  dimension: _metadata_deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}._metadata_deleted ;;
  }

  dimension: _metadata_log_file {
    hidden: yes
    type: string
    sql: ${TABLE}._metadata_log_file ;;
  }

  dimension: _metadata_log_position {
    hidden: yes
    type: number
    sql: ${TABLE}._metadata_log_position ;;
  }

  dimension_group: _metadata_timestamp {
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}._metadata_type ;;
  }

  dimension: cycle {
    type: number
    sql: ${TABLE}.cycle ;;
  }

  dimension: cycle_status {
    type: number
    sql: ${TABLE}.cycle_status ;;
  }

  dimension: exp_date_attempted {
    type: string
    sql: ${TABLE}.exp_date_attempted ;;
  }

  dimension: exp_date_old {
    type: string
    sql: ${TABLE}.exp_date_old ;;
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

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: Successful_Recycle_Count {
    type: count_distinct
    sql: ${order_id} ;;
    filters: {
      field: cycle_status
      value: "1"
    }
  }

  measure: Failed_Recycle_Count {
    type: count_distinct
    sql: ${order_id} ;;
    filters: {
      field: cycle_status
      value: "0"
    }
  }

  measure: Recycling_Order_Count{
    type: count_distinct
    sql:  ${order_id};;
  }
}
