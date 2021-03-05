view: coupon_onetimecoupon {
  sql_table_name: `production-202017.ogv2_production.coupon_onetimecoupon`
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

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: external_code {
    type: string
    sql: ${TABLE}.external_code ;;
  }

  dimension: incentive_id {
    type: number
    sql: ${TABLE}.incentive_id ;;
  }

  dimension_group: last_updated {
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
    sql: ${TABLE}.last_updated ;;
  }

  dimension: merchant_public_id {
    type: string
    sql: ${TABLE}.merchant_public_id ;;
  }

  dimension: order_public_id {
    type: string
    sql: ${TABLE}.order_public_id ;;
  }

  dimension: premises {
    type: string
    sql: ${TABLE}.premises ;;
  }

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: distinct_orders {
    type: count_distinct
    sql: ${order_public_id} ;;
  }
}
