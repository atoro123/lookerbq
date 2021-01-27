view: acv_tiers {
  sql_table_name: `production-202017.ogv2_consumerinsight.acv_tiers`
    ;;

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}.account_owner ;;
  }

  dimension: SF_Account_ID {
    type: string
    sql: ${TABLE}.Account_ID ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
  }

  dimension: base_acv {
    type: number
    sql: ${TABLE}.base_acv ;;
  }

  dimension: base_gmv {
    type: number
    sql: ${TABLE}.base_gmv ;;
  }

  dimension: calculated_product {
    type: string
    sql: ${TABLE}.calculated_product ;;
  }

  dimension: client_status {
    type: string
    sql: ${TABLE}.client_status ;;
  }

  dimension: current_tier {
    type: string
    sql: ${TABLE}.current_tier ;;
  }

  dimension: ecommerce_platform {
    type: string
    sql: ${TABLE}.ecommerce_platform ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: gmv_end {
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
    sql: ${TABLE}.gmv_end_date ;;
  }

  dimension: Annual_GMV_Days_Left {
    type: number
    sql: date_diff(${gmv_end_date},current_date(), DAY)  ;;
  }

  dimension_group: gmv_start {
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
    sql: ${TABLE}.gmv_start_date ;;
  }

  dimension: implementation_fee {
    type: number
    sql: ${TABLE}.implementation_fee ;;
  }

  dimension: level_of_risk {
    type: string
    sql: ${TABLE}.level_of_risk ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
    primary_key: yes
  }

  dimension: parent_account {
    type: string
    sql: ${TABLE}.parent_account ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: success_owner {
    type: string
    sql: ${TABLE}.success_owner ;;
  }

  dimension: tier_2_bonus {
    type: number
    sql: ${TABLE}.tier_2_bonus ;;
  }

  dimension: tier_2_gmv {
    type: number
    sql: ${TABLE}.tier_2_gmv ;;
  }

  dimension: tier_3_bonus {
    type: number
    sql: ${TABLE}.tier_3_bonus ;;
  }

  dimension: tier_3_gmv {
    type: number
    sql: ${TABLE}.tier_3_gmv ;;
  }

  dimension: tier_4_bonus {
    type: number
    sql: ${TABLE}.tier_4_bonus ;;
  }

  dimension: tier_4_gmv {
    type: number
    sql: ${TABLE}.tier_4_gmv ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name]
  }
}
