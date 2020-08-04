view: lv_categories {
  sql_table_name: `production-202017.ogv2_consumerinsight.lv_categories`
    ;;

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: sku {
    type: number
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
