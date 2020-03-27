view: churn_diagnostics_view {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: looker_scratch.churn_model ;;

  measure: avg_baseline_coverage {
    type: average
    sql: ${baseline_coverage} ;;
    value_format_name: decimal_2
  }

  measure: avg_baseline_accuracy {
    type: average
    sql: ${baseline_accuracy} ;;
    value_format_name: decimal_2
  }

  measure: avg_act_coverage {
    type: average
    sql: ${coverage} ;;
    value_format_name: decimal_2
  }

  measure: avg_precision {
    type: average
    sql: ${precision} ;;
    value_format_name: decimal_2
  }

  measure: avg_recall {
    type: average
    sql: ${recall} ;;
    value_format_name: decimal_2
  }

  measure: avg_act_accuracy {
    type: average
    sql: ${TABLE}.act_cutoff_accuracy ;;
    value_format_name: decimal_2
  }


  dimension: start_date {
    type: string
    sql: ${TABLE}.start_date ;;
  }


  dimension: end_date {
    type: string
    sql: ${TABLE}.end_date ;;
  }

  dimension: mid_date {
    type: string
    sql: ${TABLE}.mid_date ;;
  }


  dimension: train_set_size {
    type: number
    sql: ${TABLE}.train_set_size ;;
  }

  dimension: test_set_size {
    type: number
    sql: ${TABLE}.test_set_size ;;
  }

  dimension: id {
    type: number
    primary_key: yes
  }

  dimension: merchant {
    type: string
    sql: ${TABLE}.merchant ;;
  }

  dimension: precision_val {
    type: number
    sql: ${TABLE}.precision_val ;;
  }

  dimension: fscore {
    type: number
    sql: ${TABLE}.fscore ;;
  }

  dimension: support_False {
    type: number
    sql: ${TABLE}.support_False ;;
  }

  dimension: support {
    type: number
    sql: ${TABLE}.support ;;
  }

  dimension: support_true {
    type: number
    sql: ${TABLE}.support_true ;;
  }

  dimension: auc {
    type: number
    sql: ${TABLE}.auc ;;
  }

  dimension: accuracy {
    type: number
    sql: ${TABLE}.accuracy ;;
  }

  measure: base_precision {
    type: average
    sql: ${ratio} ;;
    value_format_name: decimal_2
  }

  measure: base_recall {
    type: average
    sql: ${cutoffs} ;;
    value_format_name: decimal_2
  }

  dimension: cutoffs {
    type: number
    sql: ${TABLE}.cutoffs ;;
  }


  dimension: coverage {
    type: number
    sql: ${TABLE}.coverage ;;
  }

  dimension: baseline_coverage {
    type: number
    sql: ${TABLE}.baseline_coverage ;;
  }


  dimension: pre_coverage {
    type: number
    sql: ${TABLE}.pre_coverage ;;
  }
  dimension: cutoff_accuracy {
    type: number
    sql: ${TABLE}.cutoff_accuracy ;;
  }


  measure: act_cutoff_accuracy {
    type: number
    sql: ${TABLE}.act_cutoff_accuracy ;;
  }

  dimension: baseline_accuracy {
    type: number
    sql: ${TABLE}.baseline_accuracy ;;
  }

  dimension: churns_caught {
    type: number
    sql: ${TABLE}.churns_caught ;;
  }
  dimension: churns_missed {
    type: number
    sql: ${TABLE}.churns_missed ;;
  }

  dimension: ratio {
    type: number
    sql: ${TABLE}.ratio ;;
  }


  dimension: precision {
    type: number
    sql: ${TABLE}.precision ;;
  }

  dimension: recall {
    type: number
    sql: ${TABLE}.recall ;;
  }

  set: detail {
    fields: [
    id,
      avg_baseline_coverage,
      avg_baseline_accuracy,
      avg_act_coverage,
      avg_act_accuracy,
      merchant,
      precision_val,
      fscore,
      support,
      support_true,
      support_False,
      auc,
      accuracy,
      cutoffs,
      coverage,
      baseline_coverage,
      pre_coverage,
      cutoff_accuracy,
      act_cutoff_accuracy,
      baseline_accuracy,
      churns_caught,
      churns_missed,
      ratio,
      recall,
      precision,
      avg_precision,
      avg_recall,
      base_precision,
      base_recall,
      start_date,
      end_date,
      mid_date,
      train_set_size,
      test_set_size
    ]
  }
}
