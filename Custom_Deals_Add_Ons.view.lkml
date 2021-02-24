view: custom_deals_add_ons {
    derived_table: {
      sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
      sql: SELECT  merchant_id, add_ons
        FROM production-202017.ogv2_consumerinsight.new_harvest_merchant_mapping,UNNEST(SPLIT(add_ons, '; ')) add_ons
        UNION ALL
        SELECT merchant_id, add_ons
        FROM production-202017.ogv2_consumerinsight.new_harvest_merchant_mapping
        where add_ons is null and merchant_id is not null
            ;;
    }

    dimension: merchant_id {
      hidden: yes
      type: string
      sql: ${TABLE}.merchant_id ;;
    }

    dimension: add_ons_components {
      type: string
      sql: ${TABLE}.add_ons ;;
    }

    measure: add_ons_merchant_distinct_count {
      type: count_distinct
      description: "Distinct Count of add ons by merchant"
      sql: ${TABLE}.merchant_id ;;
    }

  measure: add_ons_counts {
    description: "Count of add ons"
    type: count
    sql: ${TABLE}.add_ons ;;
  }
  }
