view: delighted_inc__delighted_response__c {
  sql_table_name: `stitch-poc-306316.salesforce.DelightedInc__Delighted_Response__c`
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

  dimension: delightedinc__account__c {
    type: string
    sql: ${TABLE}.delightedinc__account__c ;;
  }

  dimension: delightedinc__contact__c {
    type: string
    sql: ${TABLE}.delightedinc__contact__c ;;
  }

  dimension: delightedinc__delighted_id__c {
    type: string
    sql: ${TABLE}.delightedinc__delighted_id__c ;;
  }

  dimension: delightedinc__permalink__c {
    type: string
    sql: ${TABLE}.delightedinc__permalink__c ;;
  }

  dimension: delightedinc__properties__c {
    type: string
    sql: ${TABLE}.delightedinc__properties__c ;;
  }

  dimension: delightedinc__score__c {
    type: number
    sql: ${TABLE}.delightedinc__score__c ;;
  }

  dimension_group: delightedinc__timestamp__c {
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
    sql: ${TABLE}.delightedinc__timestamp__c ;;
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

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
