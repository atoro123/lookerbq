view: _sdc_rejected {
  sql_table_name: `stitch-poc-306316.salesforce._sdc_rejected`
    ;;

  dimension_group: _sdc_rejected {
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
    sql: ${TABLE}._sdc_rejected_at ;;
  }

  dimension: reasons {
    type: string
    sql: ${TABLE}.reasons ;;
  }

  dimension: record {
    type: string
    sql: ${TABLE}.record ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  measure: count {
    type: count
    drill_fields: [table_name]
  }
}
