view: opportunity_field_history {
  sql_table_name: `stitch-poc-306316.salesforce.OpportunityFieldHistory`
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

  dimension: field {
    type: string
    sql: ${TABLE}.field ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: newvalue {
    type: string
    sql: ${TABLE}.newvalue ;;
  }

  dimension: newvalue__bo {
    type: yesno
    sql: ${TABLE}.newvalue__bo ;;
  }

  dimension: newvalue__fl {
    type: number
    sql: ${TABLE}.newvalue__fl ;;
  }

  dimension: oldvalue {
    type: string
    sql: ${TABLE}.oldvalue ;;
  }

  dimension: oldvalue__bo {
    type: yesno
    sql: ${TABLE}.oldvalue__bo ;;
  }

  dimension: oldvalue__fl {
    type: number
    sql: ${TABLE}.oldvalue__fl ;;
  }

  dimension: opportunityid {
    type: string
    # hidden: yes
    sql: ${TABLE}.opportunityid ;;
  }

  measure: count {
    type: count
    drill_fields: [id, opportunity.forecastcategoryname, opportunity.name, opportunity.stagename, opportunity.id]
  }

  dimension: oldvalue_Closedate {
    type: date
    sql: case when ${field} = 'CloseDate' then CAST(${opportunity_field_history.oldvalue} as TIMESTAMP) else null end ;;
  }

  dimension_group: oldvalue_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql:timestamp(${oldvalue_Closedate});;
  }


  dimension: newvalue_Closedate {
    type: date
    sql: case when ${field} = 'CloseDate' then CAST(${opportunity_field_history.newvalue} as TIMESTAMP) else null end ;;
  }

  dimension_group: newvalue_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql:timestamp(${newvalue_Closedate});;
  }
}
