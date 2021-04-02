view: account_custom_packages_pairs {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql:   Select a.merchant_id__c, a.custom_packages as custom_package_component_1, b.custom_packages as custom_package_component_2
      from(
      SELECT  merchant_id__c, custom_packages
      FROM `stitch-poc-306316.salesforce.Account`,UNNEST(SPLIT(custom_packages__c, ';')) custom_packages
      UNION ALL
      SELECT merchant_id__c, custom_packages__c
      FROM `stitch-poc-306316.salesforce.Account`
      where custom_packages__c is null and merchant_id__c is not null) a
      join
      (SELECT  merchant_id__c, custom_packages
      FROM `stitch-poc-306316.salesforce.Account`,UNNEST(SPLIT(custom_packages__c, ';')) custom_packages
      UNION ALL
      SELECT merchant_id__c, custom_packages__c
      FROM `stitch-poc-306316.salesforce.Account`
      where custom_packages__c is null and merchant_id__c is not null) b on a.merchant_id__c = b.merchant_id__c
      where a.custom_packages < b.custom_packages
      order by 1;;
}

  dimension: merchant_id {
    hidden: yes
    type: string
    sql: ${TABLE}.merchant_id__c ;;
  }

  dimension: custom_package_component_1 {
    type: string
    sql: ${TABLE}.custom_package_component_1 ;;
  }

  dimension: custom_package_component_2 {
    type: string
    sql: ${TABLE}.custom_package_component_2 ;;
  }

  measure: Distinct_merchant_pair_count {
    type: count_distinct
    sql: ${merchant_id} ;;
  }


}
