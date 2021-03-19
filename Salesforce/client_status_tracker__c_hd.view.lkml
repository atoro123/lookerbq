view: client_status_tracker__c_hd {
  sql_table_name: `stitch-poc-306316.salesforce.Client_Status_Tracker__c_hd`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._sdc_extracted_at ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: account__c_hpr {
    type: string
    sql: ${TABLE}.account__c_hpr ;;
  }

  dimension: account__c_hst {
    type: string
    sql: ${TABLE}.account__c_hst ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.createdbyid ;;
  }

  dimension_group: createddate {
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
    sql: ${TABLE}.createddate ;;
  }

  dimension_group: current_estimated_launch_date__c_hpr {
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
    sql: ${TABLE}.current_estimated_launch_date__c_hpr ;;
  }

  dimension_group: current_estimated_launch_date__c_hst {
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
    sql: ${TABLE}.current_estimated_launch_date__c_hst ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension_group: original_expected_launch_date__c_hpr {
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
    sql: ${TABLE}.original_expected_launch_date__c_hpr ;;
  }

  dimension_group: original_expected_launch_date__c_hst {
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
    sql: ${TABLE}.original_expected_launch_date__c_hst ;;
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}.parentid ;;
  }

  dimension: remaining_launch_outlook__c_hpr {
    type: string
    sql: ${TABLE}.remaining_launch_outlook__c_hpr ;;
  }

  dimension: remaining_launch_outlook__c_hst {
    type: string
    sql: ${TABLE}.remaining_launch_outlook__c_hst ;;
  }

  dimension: stage__c_hpr {
    type: string
    sql: ${TABLE}.stage__c_hpr ;;
  }

  dimension: stage__c_hst {
    type: string
    sql: ${TABLE}.stage__c_hst ;;
  }

  dimension_group: systemmodstamp {
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
    sql: ${TABLE}.systemmodstamp ;;
  }

  dimension_group: validfromdate {
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
    sql: ${TABLE}.validfromdate ;;
  }

  dimension_group: validtodate {
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
    sql: ${TABLE}.validtodate ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
