view: custom_deals_pairs {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: Select a.merchant_id, a.custom_packages as custom_package_component_1, b.custom_packages as custom_package_component_2
from(
SELECT  merchant_id, custom_packages
FROM production-202017.ogv2_consumerinsight.harvest_merchant_mapping,UNNEST(SPLIT(custom_packages, '; ')) custom_packages
UNION ALL
SELECT merchant_id, custom_packages
FROM production-202017.ogv2_consumerinsight.harvest_merchant_mapping
where custom_packages is null and merchant_id is not null) a
join
(SELECT  merchant_id, custom_packages
FROM production-202017.ogv2_consumerinsight.harvest_merchant_mapping,UNNEST(SPLIT(custom_packages, '; ')) custom_packages
UNION ALL
SELECT merchant_id, custom_packages
FROM production-202017.ogv2_consumerinsight.harvest_merchant_mapping
where custom_packages is null and merchant_id is not null) b on a.merchant_id = b.merchant_id
where a.custom_packages < b.custom_packages
order by 1
          ;;
  }

  dimension: merchant_id {
    hidden: yes
    type: string
    sql: ${TABLE}.merchant_id ;;
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
