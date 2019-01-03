view: merchant_industry {
  sql_table_name: ogv2_production.merchant_industry ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: industry_name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: merchant_industry_count{
    type: count
    drill_fields: [id, industry_name]
    hidden: yes
  }
}
