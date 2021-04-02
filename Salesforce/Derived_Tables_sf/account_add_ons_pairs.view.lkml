view: account_add_ons_pairs {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql:   Select a.merchant_id__c, a.add_ons as add_on_component_1, b.add_ons as add_on_component_2
      from(
      SELECT  merchant_id__c, add_ons
      FROM `stitch-poc-306316.salesforce.Account`,UNNEST(SPLIT(add_ons__c, ';')) add_ons
      UNION ALL
      SELECT merchant_id__c, add_ons__c
      FROM `stitch-poc-306316.salesforce.Account`
      where add_ons__c is null and merchant_id__c is not null) a
      join
      (SELECT  merchant_id__c, add_ons
      FROM `stitch-poc-306316.salesforce.Account`,UNNEST(SPLIT(add_ons__c, ';')) add_ons
      UNION ALL
      SELECT merchant_id__c, add_ons__c
      FROM `stitch-poc-306316.salesforce.Account`
      where add_ons__c is null and merchant_id__c is not null) b on a.merchant_id__c = b.merchant_id__c
      where a.add_ons < b.add_ons
      order by 1;;
  }

  dimension: merchant_id {
    hidden: yes
    type: string
    sql: ${TABLE}.merchant_id__c ;;
  }

  dimension: add_on_component_1 {
    type: string
    sql: ${TABLE}. add_on_component_1 ;;
  }

  dimension: add_on_component_2 {
    type: string
    sql: ${TABLE}. add_on_component_2 ;;
  }

  measure: Distinct_merchant_pair_count {
    type: count_distinct
    sql: ${merchant_id} ;;
  }


}
