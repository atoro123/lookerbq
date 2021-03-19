view: opportunity_line_item {
  sql_table_name: `stitch-poc-306316.salesforce.OpportunityLineItem`
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: gmv_band__c {
    type: string
    sql: ${TABLE}.gmv_band__c ;;
  }

  dimension: hasquantityschedule {
    type: yesno
    sql: ${TABLE}.hasquantityschedule ;;
  }

  dimension: hasrevenueschedule {
    type: yesno
    sql: ${TABLE}.hasrevenueschedule ;;
  }

  dimension: hasschedule {
    type: yesno
    sql: ${TABLE}.hasschedule ;;
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

  dimension: listprice {
    type: number
    sql: ${TABLE}.listprice ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: one_time_fee__c {
    type: number
    sql: ${TABLE}.one_time_fee__c ;;
  }

  dimension: opportunityid {
    type: string
    # hidden: yes
    sql: ${TABLE}.opportunityid ;;
  }

  dimension: pricebookentryid {
    type: string
    sql: ${TABLE}.pricebookentryid ;;
  }

  dimension: product2id {
    type: string
    # hidden: yes
    sql: ${TABLE}.product2id ;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}.productcode ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension_group: servicedate {
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
    sql: ${TABLE}.servicedate ;;
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

  dimension: totalprice {
    type: number
    sql: ${TABLE}.totalprice ;;
  }

  dimension: unitprice {
    type: number
    sql: ${TABLE}.unitprice ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      product2.name,
      product2.id,
      opportunity.forecastcategoryname,
      opportunity.name,
      opportunity.stagename,
      opportunity.id
    ]
  }
}
