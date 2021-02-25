view: subscription_performance_product_level {
  sql_table_name: `production-202017.looker_scratch.subscription_performance_product_level`
    ;;

  dimension: ab_grp {
    type: string
    sql: ${TABLE}.AB_grp ;;
  }

  dimension: cancelled {
    type: number
    sql: ${TABLE}.cancelled ;;
  }

  dimension: changed {
    type: number
    sql: ${TABLE}.changed ;;
  }

  dimension: delivered {
    type: number
    sql: ${TABLE}.delivered ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: overstock_cancelled {
    type: number
    sql: ${TABLE}.overstock_cancelled ;;
  }

  dimension: sps {
    type: string
    sql: ${TABLE}.SPS ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: cancelled_quant {
    type: sum
    sql: ${cancelled} ;;
  }
  measure: overstock_cancelled_quant {
    type: sum
    sql: ${overstock_cancelled} ;;
  }
  measure: changed_quant {
    type: sum
    sql: ${changed} ;;
  }
  measure: delivered_quant {
    type: sum
    sql: ${delivered} ;;
  }
}
