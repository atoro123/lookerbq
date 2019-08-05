view: acv {
  sql_table_name: ogv2_consumerinsight.ACV ;;

  dimension: acv {
    type: number
    sql: ${TABLE}.acv ;;
  }

  dimension: cs_owner {
    type: string
    sql: ${TABLE}.cs_owner ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
