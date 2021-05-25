view: harvest_merchant_mapping {
  sql_table_name: `stitch-poc-306316.salesforce.Account`
    ;;

  dimension: account {
    type: string
    primary_key: yes
    sql: ${TABLE}.name ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id__c ;;
  }

  dimension: parent_account {
    type: string
    sql: ${TABLE}.parent_account ;;
  }
}
