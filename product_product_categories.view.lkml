view: product_product_categories {
  sql_table_name: ogv2_production.product_product_categories ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: category_id {
    hidden: yes
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: product_id {
    hidden: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }
}
