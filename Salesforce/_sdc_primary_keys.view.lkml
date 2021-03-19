view: _sdc_primary_keys {
  sql_table_name: `stitch-poc-306316.salesforce._sdc_primary_keys`
    ;;

  dimension: column_name {
    type: string
    sql: ${TABLE}.column_name ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  measure: count {
    type: count
    drill_fields: [column_name, table_name]
  }
}
