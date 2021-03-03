view: zendesk_ticket_mapping {
  sql_table_name: `production-202017.ogv2_consumerinsight.Zendesk_Ticket_Mapping`
    ;;

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.Merchant_ID ;;
  }

  dimension: sf_name {
    type: string
    sql: ${TABLE}.SF_Name ;;
  }

  dimension: zendesk_name {
    type: string
    sql: ${TABLE}.Zendesk_Name ;;
  }

  measure: count {
    type: count
    drill_fields: [zendesk_name, sf_name]
  }
}
