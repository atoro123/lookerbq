view: downsell_record__c {
  sql_table_name: `stitch-poc-306316.salesforce.Downsell_Record__c`
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

  dimension: account__c {
    type: string
    sql: ${TABLE}.account__c ;;
  }

  dimension: downsell_amount__c {
    type: number
    sql: abs(${TABLE}.downsell_amount__c) ;;
  }

  dimension_group: downsell_date__c {
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
    sql: ${TABLE}.downsell_date__c ;;
  }

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
    default_value: "Quarter"
  }

  dimension: dynamic_created_timeframe {
    label: "Dynamic Launch Date"
    type: string
    sql:
    case when {% parameter timeframe_picker %} = 'Date' then date(${downsell_date__c_date})
    when {% parameter timeframe_picker %} = 'Week' then date(${downsell_date__c_date})
    when {% parameter timeframe_picker %} = 'Month' then date(FORMAT_TIMESTAMP('%Y-%m-01', ${downsell_date__c_date}))
    when {% parameter timeframe_picker %} = 'Quarter' then DATE_ADD(date((FORMAT_TIMESTAMP('%Y-%m-01', TIMESTAMP_TRUNC(CAST(CAST(DATETIME_ADD(CAST(TIMESTAMP_TRUNC(CAST(${downsell_date__c_date} AS TIMESTAMP), MONTH) AS DATETIME), INTERVAL -1 MONTH) AS TIMESTAMP) AS TIMESTAMP), QUARTER)))), INTERVAL 1 MONTH)
    when {% parameter timeframe_picker %} = 'Year' then date(FORMAT_TIMESTAMP('%Y-01-01', ${downsell_date__c_date}))
    end  ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: new_acv__c {
    type: number
    sql: ${TABLE}.new_acv__c ;;
  }

  dimension: original_acv__c {
    type: number
    sql: ${TABLE}.original_acv__c ;;
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

  measure: downsell_sum {
    type: sum
    sql: ${downsell_amount__c} ;;
    value_format: "$#,##0"
    drill_fields: [id, name, original_acv__c, new_acv__c]
  }
}
