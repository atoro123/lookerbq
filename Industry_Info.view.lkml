view: industry_info {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: SELECT merchant_id, Industry, Sub_Industry
FROM production-202017.ogv2_consumerinsight.new_harvest_merchant_mapping
,UNNEST(SPLIT(Sub_Industry, '; ')) Sub_Industry
UNION ALL
SELECT merchant_id, Industry, Sub_Industry
FROM production-202017.ogv2_consumerinsight.new_harvest_merchant_mapping
where sub_industry is null and merchant_id is not null
       ;;
    }

  dimension: merchant_id {
    type: string
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: Industry {
    type: string
    sql: ${TABLE}.Industry ;;
  }

  dimension: Sub_Industry {
    type: string
    sql: ${TABLE}.Sub_Industry ;;
  }

    }
