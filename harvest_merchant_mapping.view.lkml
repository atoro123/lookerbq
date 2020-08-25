view: harvest_merchant_mapping {
  sql_table_name: `production-202017.ogv2_consumerinsight.harvest_merchant_mapping`
    ;;

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: hours_bought {
    type: number
    sql: ${TABLE}.post_live_hours ;;
  }

  dimension: client_status {
    type: string
    sql: ${TABLE}.client_stats ;;
  }

  dimension: product_level {
    type: string
    sql: ${TABLE}.product_level ;;
  }

  dimension: signed_date {
    type: date
    sql: ${TABLE}.signed_date ;;
  }

  dimension: launch_date {
    type: date
    sql: ${TABLE}.launch_date ;;
  }

  dimension: client_stage {
    type: string
    sql: ${TABLE}.client_stage ;;
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

  dimension: annual_target_hours {
    type: number
    sql: ${TABLE}.target_hours ;;
  }

  dimension: integration_hours {
    type: number
    sql: ${TABLE}.intergration_hours ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
}
