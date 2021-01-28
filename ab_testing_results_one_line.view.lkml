view: ab_testing_results_one_line {
  sql_table_name: `production-202017.looker_scratch.AB_testing_results_one_line`
    ;;

  dimension: ab_grp {
    type: string
    sql: ${TABLE}.AB_grp ;;
  }

  dimension: avg_freq_active {
    type: number
    sql: ${TABLE}.avg_freq_active ;;
    value_format: "0.##"
  }

  dimension: avg_sps_all {
    type: number
    sql: ${TABLE}.avg_sps_all ;;
    value_format: "0.##"
  }

  dimension: avg_sps_finished {
    type: number
    sql: ${TABLE}.avg_sps_finished ;;
    value_format: "0.##"
  }

  dimension: avg_sps_finished_nobounce {
    type: number
    sql: ${TABLE}.avg_sps_finished_nobounce ;;
    value_format: "0.##"
  }

  dimension: cancelled {
    type: number
    sql: ${TABLE}.cancelled ;;
    value_format: "0.##"
  }

  dimension: cancelled_change {
    type: number
    sql: ${TABLE}.cancelled_change ;;
    value_format: "0.###"

  }

  dimension: changed {
    type: number
    sql: ${TABLE}.changed ;;
    value_format: "0.##"
  }

  dimension: changed_change {
    type: number
    sql: ${TABLE}.changed_change ;;
    value_format: "0.###"
  }

  dimension: holdout_cancelled {
    type: number
    sql: ${TABLE}.holdout_cancelled ;;
    value_format: "0.##"
  }

  dimension: holdout_changed {
    type: number
    sql: ${TABLE}.holdout_changed ;;
    value_format: "0.##"
  }

  dimension: holdout_overstock_cancelled {
    type: number
    sql: ${TABLE}.holdout_overstock_cancelled ;;
    value_format: "0.##"
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
    value_format: "0.##"
  }

  dimension: overstock_cancelled_change {
    type: number
    sql: ${TABLE}.overstock_cancelled_change ;;
    value_format: "0.###"
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
