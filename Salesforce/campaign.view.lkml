view: campaign {
  sql_table_name: `stitch-poc-306316.salesforce.Campaign`
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

  dimension: amountallopportunities {
    type: number
    sql: ${TABLE}.amountallopportunities ;;
  }

  dimension: amountwonopportunities {
    type: number
    sql: ${TABLE}.amountwonopportunities ;;
  }

  dimension: campaign_type__c {
    type: string
    sql: ${TABLE}.campaign_type__c ;;
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

  dimension: expectedresponse {
    type: number
    sql: ${TABLE}.expectedresponse ;;
  }

  dimension: isactive {
    type: yesno
    sql: ${TABLE}.isactive ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: numberofcontacts {
    type: number
    sql: ${TABLE}.numberofcontacts ;;
  }

  dimension: numberofconvertedleads {
    type: number
    sql: ${TABLE}.numberofconvertedleads ;;
  }

  dimension: numberofleads {
    type: number
    sql: ${TABLE}.numberofleads ;;
  }

  dimension: numberofopportunities {
    type: number
    sql: ${TABLE}.numberofopportunities ;;
  }

  dimension: numberofresponses {
    type: number
    sql: ${TABLE}.numberofresponses ;;
  }

  dimension: numberofwonopportunities {
    type: number
    sql: ${TABLE}.numberofwonopportunities ;;
  }

  dimension: numbersent {
    type: number
    sql: ${TABLE}.numbersent ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}.parentid ;;
  }

  dimension: product__c {
    type: string
    sql: ${TABLE}.product__c ;;
  }

  dimension_group: startdate {
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
    sql: ${TABLE}.startdate ;;
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

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, campaign_member.count, campaign_member_status.count, opportunity.count]
  }
}
