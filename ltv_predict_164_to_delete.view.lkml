view: ltv_predict_164_to_delete {
  sql_table_name: `production-202017.ogv2_consumerinsight.LTV_Predict_164_to_delete`
    ;;

  dimension: count_ltv_predict_164_to_delete {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: frequency_days {
    type: number
    sql: ${TABLE}.frequency_days ;;
  }

  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: median_lifetime {
    type: number
    sql: ${TABLE}.median_lifetime ;;
  }

  dimension: median_shipments {
    type: number
    sql: ${TABLE}.median_shipments ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
