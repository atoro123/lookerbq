view: jira_project_types {
  sql_table_name: `stitch-poc-306316.jira_poc.project_types`
    ;;

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

  dimension: color {
    type: string
    sql: ${TABLE}.color ;;
  }

  dimension: descriptioni18nkey {
    type: string
    sql: ${TABLE}.descriptioni18nkey ;;
  }

  dimension: formattedkey {
    type: string
    sql: ${TABLE}.formattedkey ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
