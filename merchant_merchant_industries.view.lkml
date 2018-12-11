view: merchant_merchant_industries {
  sql_table_name: ogv2_production.merchant_merchant_industries ;;

  dimension: industries_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: industry_id {
    hidden: yes
    type: number
    sql: ${TABLE}.industry_id ;;
  }

  dimension: merchant_id {
    type: number
    hidden: yes
    sql: ${TABLE}.merchant_id ;;
  }

  measure: merchant_merchant_industries_count {
    type: count
    hidden: yes
    drill_fields: [industries_id]
  }
}
