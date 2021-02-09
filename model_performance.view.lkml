view: model_performance {
  sql_table_name: `production-202017.looker_scratch.model_performance`
    ;;

  dimension: act_cutoff_accuracy {
    type: number
    sql: ${TABLE}.act_cutoff_accuracy ;;
  }

  dimension: active {
    type: number
    sql: ${TABLE}.active ;;
  }

  dimension: baseline_accuracy {
    type: number
    sql: ${TABLE}.baseline_accuracy ;;
  }

  dimension: coverage {
    type: number
    sql: ${TABLE}.coverage ;;
  }

  dimension: insample_logloss {
    type: number
    sql: ${TABLE}.insample_logloss ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: support {
    type: number
    sql: ${TABLE}.support ;;
  }

  dimension: support_false {
    type: number
    sql: ${TABLE}.support_false ;;
  }

  dimension: support_true {
    type: number
    sql: ${TABLE}.support_true ;;
  }

  dimension: val_logloss {
    type: number
    sql: ${TABLE}.val_logloss ;;
  }

  dimension: cutoffs {
    type: number
    sql: ${TABLE}.cutoffs ;;
  }

  measure: avg_cutoffs {
    type: average
    sql: ${cutoffs} ;;
    value_format_name: decimal_2
  }

  measure: avg_coverage {
    type: average
    sql: ${coverage} ;;
    value_format_name: decimal_2
  }

  measure: avg_act_cutoff_accuracy {
    type: average
    sql: ${act_cutoff_accuracy }
    value_format_name: decimal_2
    ;;
  }



  measure: count {
    type: count
    drill_fields: [name]
  }
}
