view: lovelyskin_brands {
  sql_table_name: `production-202017.ogv2_consumerinsight.lovelyskin_brands`
    ;;

  dimension: brand_id {
    type: number
    sql: ${TABLE}.BrandId ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.BrandName ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [brand_name, name]
  }
}
