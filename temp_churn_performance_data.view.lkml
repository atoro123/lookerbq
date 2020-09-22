view: temp_churn_performance_data {
  sql_table_name: `production-202017.ogv2_consumerinsight.temp_churn_performance_data`
    ;;

  dimension: accuracy {
    type: number
    sql: ${TABLE}.accuracy ;;
  }

  dimension: act_cutoff_accuracy {
    type: number
    sql: ${TABLE}.act_cutoff_accuracy ;;
  }

  dimension: auc {
    type: number
    sql: ${TABLE}.auc ;;
  }

  dimension: baseline_accuracy {
    type: number
    sql: ${TABLE}.baseline_accuracy ;;
  }

  dimension: baseline_coverage {
    type: number
    sql: ${TABLE}.baseline_coverage ;;
  }

  dimension: churns_caught {
    type: number
    sql: ${TABLE}.churns_caught ;;
  }

  dimension: churns_missed {
    type: number
    sql: ${TABLE}.churns_missed ;;
  }

  dimension: coverage {
    type: number
    sql: ${TABLE}.coverage ;;
  }

  dimension: cutoff_accuracy {
    type: number
    sql: ${TABLE}.cutoff_accuracy ;;
  }

  dimension: cutoffs {
    type: number
    sql: ${TABLE}.cutoffs ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date ;;
  }

  dimension: fscore {
    type: number
    sql: ${TABLE}.fscore ;;
  }

  dimension: merchant {
    type: string
    sql: ${TABLE}.merchant ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: mid_date {
    type: string
    sql: ${TABLE}.mid_date ;;
  }

  dimension: pre_coverage {
    type: number
    sql: ${TABLE}.pre_coverage ;;
  }

  dimension: precesion {
    type: number
    sql: ${TABLE}.precesion ;;
  }

  dimension: precision_val {
    type: number
    sql: ${TABLE}.precision_val ;;
  }

  dimension: ratio {
    type: number
    sql: ${TABLE}.ratio ;;
  }

  dimension: recall {
    type: number
    sql: ${TABLE}.recall ;;
  }

  dimension: recall_val {
    type: number
    sql: ${TABLE}.recall_val ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  dimension: support {
    type: number
    sql: ${TABLE}.support ;;
  }

  dimension: support_false {
    type: number
    sql: ${TABLE}.support_False ;;
  }

  dimension: support_true {
    type: number
    sql: ${TABLE}.support_true ;;
  }

  dimension: test_set_size {
    type: number
    sql: ${TABLE}.test_set_size ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: train_set_size {
    type: number
    sql: ${TABLE}.train_set_size ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure:  total_churn {
    type: sum
    sql: ${churns_caught} + ${churns_missed} ;;
  }

  measure: avg_precision {
    type: average
    sql: ${precision_val} ;;
    value_format: "0.000"
  }

  measure: avg_recall {
    type: average
    sql: ${recall_val} ;;
    value_format: "0.000"
  }

  measure: avg_cutoff_accuracy {
    type: average
    sql: ${cutoff_accuracy} ;;
    value_format: "0.0%"
  }

  measure:  sum_churns_missed {
    type: sum
    sql: ${churns_missed} ;;
  }

  measure:  sum_churns_caught {
    type: sum
    sql: ${churns_caught} ;;
  }

  measure:  churns_caught_precentage {
    type: number
    sql: ${sum_churns_caught}/${total_churn} ;;
    value_format: "0.0%"
  }

  measure:  churns_missed_precentage {
    type: number
    sql: ${sum_churns_missed}/${total_churn} ;;
    value_format: "0.#%"
  }
}
