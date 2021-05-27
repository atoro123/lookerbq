view: contact {
  sql_table_name: `stitch-poc-306316.salesforce.Contact`
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

  dimension: accountid {
    type: string
    sql: ${TABLE}.accountid ;;
  }

  dimension: active_contact_14_days__c {
    type: number
    sql: ${TABLE}.active_contact_14_days__c ;;
  }

  dimension: add_to_campaign__c {
    type: yesno
    sql: ${TABLE}.add_to_campaign__c ;;
  }

  dimension: campaign_name__c {
    type: string
    sql: ${TABLE}.campaign_name__c ;;
  }

  dimension: company_lead__c {
    type: yesno
    sql: ${TABLE}.company_lead__c ;;
  }

  dimension: count__c {
    type: number
    sql: ${TABLE}.count__c ;;
  }

  dimension: created_from_lead__c {
    type: yesno
    sql: ${TABLE}.created_from_lead__c ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: lead_source_detail__c {
    type: string
    sql: ${TABLE}.lead_source_detail__c ;;
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}.leadsource ;;
  }

  dimension: partner_account__c {
    type: string
    sql: ${TABLE}.partner_account__c ;;
  }

  dimension: recordtypeid {
    type: string
    sql: ${TABLE}.recordtypeid ;;
  }

  dimension: role_type__c {
    type: string
    sql: ${TABLE}.role_type__c ;;
  }

  dimension: success_owner__c {
    type: string
    sql: ${TABLE}.success_owner__c ;;
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

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
