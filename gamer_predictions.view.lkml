view: gamer_predictions {
  sql_table_name: ogv2_consumerinsight.Gamer_Predictions ;;

  dimension: gamer_prediction {
    type: yesno
    sql: ${TABLE}.predictions ;;
  }

  dimension: gamer {
    type: yesno
    sql: ${TABLE}.gamer ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: False_Positive {
    type: yesno
    sql: ${gamer_prediction} and not ${gamer} ;;
  }

  dimension: False_Negative {
    type: yesno
    sql: not ${gamer_prediction} and ${gamer} ;;
  }

  dimension: True_Positive{
    type: yesno
    sql: (${gamer_prediction} and ${gamer});;
  }

  dimension: Prediction_Accruacy {
    type: string
    sql: (case when (${gamer_prediction} and ${gamer}) then 'True Positive'
              when (${gamer_prediction} and not ${gamer}) then 'False Positive'
              when (not ${gamer_prediction} and ${gamer}) then 'False Negative'
              else 'True Negative' end);;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
