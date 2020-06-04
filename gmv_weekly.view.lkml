view: gmv_weekly {
  sql_table_name: `production-202017.ogv2_consumerinsight.gmv_weekly`
    ;;

  dimension: april_actuals {
    type: number
    sql: ${TABLE}.April_Actuals ;;
  }

  dimension: base_gmv_forecast_july {
    type: number
    sql: ${TABLE}.Base_GMV_Forecast___July ;;
  }

  dimension: base_gmv_forecast_june {
    type: number
    sql: ${TABLE}.Base_GMV_Forecast___June ;;
  }

  dimension: base_gmv_forecast_may {
    type: number
    sql: ${TABLE}.Base_GMV_Forecast___May ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.Client_Name ;;
  }

  dimension: cs_name {
    type: string
    sql: ${TABLE}.CS_Name ;;
  }

  dimension: february_actuals {
    type: number
    sql: ${TABLE}.February_Actuals ;;
  }

  dimension: growth_july {
    type: number
    sql: ${TABLE}.Growth___July ;;
  }

  dimension: growth_june {
    type: number
    sql: ${TABLE}.Growth___June ;;
  }

  dimension: growth_may {
    type: number
    sql: ${TABLE}.Growth___May ;;
  }

  dimension: july_qtr_adjust {
    type: number
    sql: ${TABLE}.July_Qtr_Adjust ;;
  }

  dimension: june_qtr_adjust {
    type: number
    sql: ${TABLE}.June_Qtr_Adjust ;;
  }

  dimension: march_actuals {
    type: number
    sql: ${TABLE}.March_Actuals ;;
  }

  dimension: may_qtr_adjust {
    type: number
    sql: ${TABLE}.May_Qtr_Adjust ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.Merchant_ID ;;
  }

  dimension: total_forecast_july {
    type: number
    sql: ${TABLE}.Total_Forecast___July ;;
  }

  measure: july_forecast {
    type: sum
    sql: ${TABLE}.Total_Forecast___July  ;;
    value_format: "$#,##0.00"
  }

  dimension: total_forecast_june {
    type: number
    sql: ${TABLE}.Total_Forecast___June ;;
  }

  measure: june_forecast {
    type: sum
    sql: ${TABLE}.Total_Forecast___June  ;;
    value_format: "$#,##0.00"
  }

  dimension: total_forecast_may {
    type: number
    sql: ${TABLE}.Total_Forecast___May ;;
  }

  measure: May_forecast {
    type: sum
    sql: ${TABLE}.Total_Forecast___May  ;;
    value_format: "$#,##0.00"
  }

  dimension: total_q2_forecast {
    type: number
    sql: ${TABLE}.Total_Q2_Forecast ;;
  }

  measure: Q2_forecast {
    type: sum
    sql: ${TABLE}.Total_Q2_Forecast ;;
    value_format: "$#,##0.00"
  }

  measure: count {
    type: count
    drill_fields: [client_name, cs_name]
  }
}
