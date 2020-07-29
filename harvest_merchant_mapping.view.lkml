view: harvest_merchant_mapping {
  sql_table_name: `production-202017.ogv2_consumerinsight.harvest_merchant_mapping`
    ;;

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: hours_bought {
    type: number
    sql: ${TABLE}.hours_bought ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: parent_account {
    type: string
    sql: ${TABLE}.parent_account ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
