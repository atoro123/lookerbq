view: external_source_merchant_mapping {
  sql_table_name: `production-202017.ogv2_consumerinsight.external_source_merchant_mapping`
    ;;

  dimension: csd_name {
    type: string
    sql: ${TABLE}.CSD_Name ;;
  }

  dimension: harvest_name {
    type: string
    sql: ${TABLE}.Harvest_Name ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.Merchant_ID ;;
  }

  dimension: sfcc_name {
    type: string
    sql: ${TABLE}.SFCC_Name ;;
  }

  dimension: zendesk_name {
    type: string
    sql: ${TABLE}.Zendesk_Name ;;
  }

  measure: count {
    type: count
    drill_fields: [harvest_name, csd_name, zendesk_name, sfcc_name]
  }
}
