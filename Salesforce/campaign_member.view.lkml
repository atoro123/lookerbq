view: campaign_member {
  sql_table_name: `stitch-poc-306316.salesforce.CampaignMember`
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

  dimension: campaignid {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaignid ;;
  }

  dimension: companyoraccount {
    type: string
    sql: ${TABLE}.companyoraccount ;;
  }

  dimension: contactid {
    type: string
    sql: ${TABLE}.contactid ;;
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

  dimension: donotcall {
    type: yesno
    sql: ${TABLE}.donotcall ;;
  }

  dimension_group: firstrespondeddate {
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
    sql: ${TABLE}.firstrespondeddate ;;
  }

  dimension: ga_campaign__c {
    type: string
    sql: ${TABLE}.ga_campaign__c ;;
  }

  dimension: ga_content__c {
    type: string
    sql: ${TABLE}.ga_content__c ;;
  }

  dimension: ga_medium__c {
    type: string
    sql: ${TABLE}.ga_medium__c ;;
  }

  dimension: ga_source__c {
    type: string
    sql: ${TABLE}.ga_source__c ;;
  }

  dimension: ga_term__c {
    type: string
    sql: ${TABLE}.ga_term__c ;;
  }

  dimension: hasoptedoutofemail {
    type: yesno
    sql: ${TABLE}.hasoptedoutofemail ;;
  }

  dimension: hasoptedoutoffax {
    type: yesno
    sql: ${TABLE}.hasoptedoutoffax ;;
  }

  dimension: hasresponded {
    type: yesno
    sql: ${TABLE}.hasresponded ;;
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

  dimension: leadid {
    type: string
    sql: ${TABLE}.leadid ;;
  }

  dimension: leadorcontactid {
    type: string
    sql: ${TABLE}.leadorcontactid ;;
  }

  dimension: leadorcontactownerid {
    type: string
    sql: ${TABLE}.leadorcontactownerid ;;
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}.leadsource ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, campaign.id, campaign.name]
  }
}
