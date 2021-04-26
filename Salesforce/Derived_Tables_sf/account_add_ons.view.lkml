view: account_add_ons {
    derived_table: {
      sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
      sql: SELECT  id, add_ons__c
              FROM stitch-poc-306316.salesforce.Account,UNNEST(SPLIT(add_ons__c, ';')) add_ons__c
              UNION ALL
              SELECT id, add_ons__c
              FROM stitch-poc-306316.salesforce.Account
              where add_ons__c is null
                  ;;
    }

    dimension: id {
      hidden: yes
      type: string
      sql: ${TABLE}.id ;;
    }

    dimension: add_ons_components {
      type: string
      sql: ${TABLE}.add_ons__c ;;
    }

    measure: add_ons_component_count {
      type: count_distinct
      sql: ${TABLE}.add_ons__c ;;
    }
 }
