view: churn_rolling_sum {
  sql_table_name: `production-202017.looker_scratch.churn_rolling_sum`
    ;;


  dimension: Targeted_GMV {
    type: number
    sql: ${TABLE}.A_sum_realized ;;
  }

  dimension: Holdout_GMV_equivalent_b {
    type: number
    sql: ${TABLE}.B_sum_equivalent ;;
  }

  dimension: Holdout_GMV_equivalent {
    type: number
    sql: ${TABLE}.B_sum_equivalent_beta ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension_group: place {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.place_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }


  measure: Churn_Program_GMV {
    type: sum
    sql:  ${Targeted_GMV};;
  }

  measure: Baseline_equivalent_GMV {
    type: sum
    sql: ${Holdout_GMV_equivalent};;
  }

}
