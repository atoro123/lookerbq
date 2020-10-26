view: churn_prediction_exclusion {
  sql_table_name: `production-202017.churn_model_tables.churn_prediction_exclusion`
    ;;

  dimension: churn_prediction_id {
    type: number
    sql: ${TABLE}.churn_prediction_id ;;
  }

  dimension: exclusion_code_id {
    type: number
    sql: ${TABLE}.exclusion_code_id ;;
  }

  dimension_group: logged {
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
    sql: ${TABLE}.logged ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
