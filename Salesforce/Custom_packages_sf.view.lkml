view: custom_packages_sf {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: SELECT  merchant_id__c, custom_packages__c
      FROM stitch-poc-306316.salesforce.Account,UNNEST(SPLIT(custom_packages__c, ';')) custom_packages__c
      UNION ALL
      SELECT merchant_id__c, custom_packages__c
      FROM stitch-poc-306316.salesforce.Account
      where custom_packages__c is null and merchant_id__c is not null
          ;;
  }

  dimension: merchant_id__c {
    hidden: yes
    type: string
    sql: ${TABLE}.merchant_id__c ;;
  }

  dimension: custom_package_components {
    type: string
    sql: ${TABLE}.custom_packages__c ;;
  }

  measure: custom_package_component_count {
    type: count_distinct
    sql: ${TABLE}.custom_packages__c ;;
  }
}
