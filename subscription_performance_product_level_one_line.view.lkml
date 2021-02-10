view: subscription_performance_product_level_one_line {
  sql_table_name: `production-202017.looker_scratch.subscription_performance_product_level_one_line`
    ;;

  dimension: ab_grp {
    type: string
    sql: ${TABLE}.AB_grp ;;
  }

  dimension: avg_freq_active {
    type: number
    sql: ${TABLE}.avg_freq_active ;;
  }

  dimension: avg_sps_all {
    type: number
    sql: ${TABLE}.avg_sps_all ;;
  }

  dimension: avg_sps_finished {
    type: number
    sql: ${TABLE}.avg_sps_finished ;;
  }

  dimension: avg_sps_finished_nobounce {
    type: number
    sql: ${TABLE}.avg_sps_finished_nobounce ;;
  }

  dimension: cancelled {
    type: number
    sql: ${TABLE}.cancelled ;;
  }

  dimension: cancelled_change {
    type: number
    sql: ${TABLE}.cancelled_change ;;
  }

  dimension: changed {
    type: number
    sql: ${TABLE}.changed ;;
  }

  dimension: changed_change {
    type: number
    sql: ${TABLE}.changed_change ;;
  }

  dimension: delivered {
    type: number
    sql: ${TABLE}.delivered ;;
  }

  dimension: holdout_cancelled {
    type: number
    sql: ${TABLE}.holdout_cancelled ;;
  }

  dimension: holdout_changed {
    type: number
    sql: ${TABLE}.holdout_changed ;;
  }

  dimension: holdout_overstock_cancelled {
    type: number
    sql: ${TABLE}.holdout_overstock_cancelled ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: overstock_cancelled {
    type: number
    sql: ${TABLE}.overstock_cancelled ;;
  }

  dimension: overstock_cancelled_change {
    type: number
    sql: ${TABLE}.overstock_cancelled_change ;;
  }

  dimension: product_count {
    type: number
    sql: ${TABLE}.product_count ;;
  }

  dimension: sub_count {
    type: number
    sql: ${TABLE}.sub_count ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
