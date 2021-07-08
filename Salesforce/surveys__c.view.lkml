view: surveys__c {
  sql_table_name: `stitch-poc-306316.salesforce.Surveys__c`
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

  dimension: account_name__c {
    type: string
    sql: ${TABLE}.account_name__c ;;
  }

  dimension: channel__c {
    type: string
    sql: ${TABLE}.channel__c ;;
  }

  dimension_group: completion_date__c {
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
    sql: ${TABLE}.completion_date__c ;;
  }

  dimension: contact_name__c {
    type: string
    sql: ${TABLE}.contact_name__c ;;
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

  dimension: csat_score__c {
    type: number
    sql: ${TABLE}.csat_score__c ;;
  }

  dimension_group: date_of_call__c {
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
    sql: ${TABLE}.date_of_call__c ;;
  }

  dimension: ecommerce_platform__c {
    type: string
    sql: ${TABLE}.ecommerce_platform__c ;;
  }

  dimension: experience_of_launch_program__c {
    type: string
    sql: ${TABLE}.experience_of_launch_program__c ;;
  }

  dimension: follow_up_call_notes__c {
    type: string
    sql: ${TABLE}.follow_up_call_notes__c ;;
  }

  dimension: helpfulness_of_support_documentation__c {
    type: string
    sql: ${TABLE}.helpfulness_of_support_documentation__c ;;
  }

  dimension: how_can_we_improve_your_experience__c {
    type: string
    sql: ${TABLE}.how_can_we_improve_your_experience__c ;;
  }

  dimension: interested_in_conversation__c {
    type: string
    sql: ${TABLE}.interested_in_conversation__c ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
  }

  dimension_group: lastmodifieddate {
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
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension: link_to_response__c {
    type: string
    sql: ${TABLE}.link_to_response__c ;;
  }

  dimension: link_to_summary_report__c {
    type: string
    sql: ${TABLE}.link_to_summary_report__c ;;
  }

  dimension: migration_needed__c {
    type: string
    sql: ${TABLE}.migration_needed__c ;;
  }

  dimension: nps__c {
    type: string
    sql: ${TABLE}.nps__c ;;
  }

  measure: Promoter_Count {
    type: count
    sql: ${id} ;;
    filters: [
      nps__c: "Promoter"
    ]
  }

  measure: Detractor_Count {
    type: count
    sql: ${id} ;;
    filters: [
      nps__c: "Detractor"
    ]
  }

  measure: Neutral_Count {
    type: count
    sql: ${id} ;;
    filters: [
      nps__c: "Neutral"
    ]
  }

  dimension: nps_question__c {
    type: number
    sql: ${TABLE}.nps_question__c ;;
  }

  dimension: open_feedback__c {
    type: string
    sql: ${TABLE}.open_feedback__c ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: primary_reason_behind_rating__c {
    type: string
    sql: ${TABLE}.primary_reason_behind_rating__c ;;
  }

  dimension: recordtypeid {
    type: string
    sql: ${TABLE}.recordtypeid ;;
  }

  dimension: relationship_commerce_control_center_rc__c {
    type: string
    sql: ${TABLE}.relationship_commerce_control_center_rc__c ;;
  }

  dimension: role_type__c {
    type: string
    sql: ${TABLE}.role_type__c ;;
  }

  dimension_group: start_date__c {
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
    sql: ${TABLE}.start_date__c ;;
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

  dimension: the_installation_of_the_cartridge_or_app__c {
    type: string
    sql: ${TABLE}.the_installation_of_the_cartridge_or_app__c ;;
  }

  dimension: the_support_tools_for_launch__c {
    type: string
    sql: ${TABLE}.the_support_tools_for_launch__c ;;
  }

  dimension: what_do_you_value_the_most__c {
    type: string
    sql: ${TABLE}.what_do_you_value_the_most__c ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
