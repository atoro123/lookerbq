view: acv_contract {
  sql_table_name: ogv2_consumerinsight.acv_contract ;;

  dimension: account_classification {
    type: string
    sql: ${TABLE}.account_classification ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}.arr ;;
  }

  dimension_group: auto_renew {
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
    sql: ${TABLE}.auto_renew_date ;;
  }

  dimension: auto_renews {
    type: yesno
    sql: ${TABLE}.auto_renews ;;
  }

  dimension: client_status {
    type: string
    sql: ${TABLE}.client_status ;;
  }

  dimension: contract_date {
    type: date
    sql: ${TABLE}.contract_commencement_date ;;
  }

  dimension_group: contract_commencement {
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
    sql: ${TABLE}.contract_commencement_date ;;
  }

  dimension: gmv_start_date {
    type: date
    sql: ${TABLE}.contract_gmv_date ;;
  }

  dimension: contract_length_mths {
    type: number
    sql: ${TABLE}.contract_length_mths ;;
  }

  dimension: contract_type {
    type: string
    sql: ${TABLE}.contract_type ;;
  }

  dimension_group: effective {
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
    sql: ${TABLE}.effective_date ;;
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

  dimension: gmv_overage {
    type: string
    sql: ${TABLE}.gmv_overage ;;
  }

  dimension: gmv_reset {
    type: string
    sql: ${TABLE}.gmv_reset ;;
  }

  dimension: implementation_fee {
    type: number
    sql: ${TABLE}.implementation_fee ;;
  }

  dimension: isf_billing_terms {
    type: string
    sql: ${TABLE}.isf_billing_terms ;;
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

  dimension: psf_annual {
    type: number
    sql: ${TABLE}.psf_annual ;;
  }

  dimension_group: psf_billing_start {
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
    sql: ${TABLE}.psf_billing_start_date ;;
  }

  dimension: psf_billing_terms {
    type: string
    sql: ${TABLE}.psf_billing_terms ;;
  }

  dimension: psf_details {
    type: string
    sql: ${TABLE}.psf_details ;;
  }

  dimension: risk_level {
    type: number
    sql: ${TABLE}.risk_level ;;
  }

  dimension_group: signed {
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
    sql: ${TABLE}.signed_date ;;
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

  dimension: success_support {
    type: string
    sql: ${TABLE}.success_support ;;
  }

  dimension: tier_1 {
    type: number
    sql: ${TABLE}.tier_1 ;;
  }

  dimension: tier_2 {
    type: number
    sql: ${TABLE}.tier_2 ;;
  }

  dimension: tier_3 {
    type: number
    sql: ${TABLE}.tier_3 ;;
  }

  dimension: tier_4 {
    type: number
    sql: ${TABLE}.tier_4 ;;
  }

  dimension: tier_5 {
    type: number
    sql: ${TABLE}.tier_5 ;;
  }

  dimension: tier_6 {
    type: number
    sql: ${TABLE}.tier_6 ;;
  }

  measure: total_arr {
    type: sum
    sql: ${TABLE}.arr ;;
  }

  dimension: time_left {
    type: number
    sql: date_diff(date_add(${gmv_start_date}, INTERVAL 1 YEAR), Current_Date(), DAY) ;;
  }

  dimension: gmv_end_date {
    type: date
    sql: date_add(${gmv_start_date}, INTERVAL 1 YEAR) ;;
  }

  dimension: days_elapsed {
    type: number
    sql: date_diff(Current_Date(),${gmv_start_date}, DAY) ;;
  }
}
