view: industry_info {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: select merchant_id, Industry,split(Sub_Industry,';') as Sub_Industry
    from production-202017.ogv2_consumerinsight.harvest_merchant_mapping
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
