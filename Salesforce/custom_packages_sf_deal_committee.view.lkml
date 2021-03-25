view: custom_packages_sf_deal_committee {
    derived_table: {
      sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
      sql: SELECT  id, review_items__c
              FROM `stitch-poc-306316.salesforce.Deal_Committee__c`,UNNEST(SPLIT(review_items__c, ';')) review_items__c
              UNION ALL
              SELECT id, review_items__c
              FROM `stitch-poc-306316.salesforce.Deal_Committee__c`
              where review_items__c is null and id is not null
                  ;;
    }

    dimension: id {
      hidden: yes
      type: string
      sql: ${TABLE}.id ;;
    }

    dimension: review_items__c {
      type: string
      sql: ${TABLE}.review_items__c ;;
    }

    measure: review_items__c_count {
      type: count_distinct
      sql: ${TABLE}.review_items__c ;;
    }
  }
