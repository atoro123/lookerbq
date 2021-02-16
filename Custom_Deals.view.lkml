view: custom_deals {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: SELECT  merchant_id, custom_packages
FROM production-202017.ogv2_consumerinsight.new_harvest_merchant_mapping,UNNEST(SPLIT(custom_packages, '; ')) custom_packages
UNION ALL
SELECT merchant_id, custom_packages
FROM production-202017.ogv2_consumerinsight.new_harvest_merchant_mapping
where custom_packages is null and merchant_id is not null
    ;;
  }

  dimension: merchant_id {
    hidden: yes
    type: string
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: custom_package_components {
    type: string
    sql: ${TABLE}.custom_packages ;;
  }

  measure: custom_package_component_count {
    type: count_distinct
    sql: ${TABLE}.custom_packages ;;
  }
}
