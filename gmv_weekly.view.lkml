

view: gmv_weekly {
  sql_table_name: `production-202017.ogv2_consumerinsight.gmv_weekly`
    ;;

  dimension: july_actuals {
    type: number
    sql: ${TABLE}.July_Actuals ;;
  }

  dimension: base_gmv_forecast_october {
    type: number
    sql: ${TABLE}.Base_GMV_Forecast_October ;;
  }

  dimension: base_gmv_forecast_september {
    type: number
    sql: ${TABLE}.Base_GMV_Forecast_September ;;
  }

  dimension: base_gmv_forecast_august {
    type: number
    sql: ${TABLE}.Base_GMV_Forecast_August ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.Client_Name ;;
  }

  dimension: cs_name {
    type: string
    sql: ${TABLE}.CS_Name ;;
  }

  dimension: may_actuals {
    type: number
    sql: ${TABLE}.May_Actuals ;;
  }

  dimension: growth_october {
    type: number
    sql: ${TABLE}.Growth_October ;;
  }

  dimension: growth_september {
    type: number
    sql: ${TABLE}.Growth_September ;;
  }

  dimension: growth_august {
    type: number
    sql: ${TABLE}.Growth_August ;;
  }

  dimension: october_qtr_adjust {
    type: number
    sql: ${TABLE}.October_Qtr_Adjust ;;
  }

  dimension: september_qtr_adjust {
    type: number
    sql: ${TABLE}.September_Qtr_Adjust ;;
  }

  dimension: June_actuals {
    type: number
    sql: ${TABLE}.June_Actuals ;;
  }

  dimension: august_qtr_adjust {
    type: number
    sql: ${TABLE}.August_Qtr_Adjust ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.Merchant_ID ;;
  }

  dimension: total_forecast_october {
    type: number
    sql: ${TABLE}.Total_Forecast_October ;;
  }

  measure: october_forecast {
    type: sum
    sql: ${TABLE}.Total_Forecast_October  ;;
  }

  dimension: total_forecast_september {
    type: number
    sql: ${TABLE}.Total_Forecast_September ;;
  }

  measure: september_forecast {
    type: sum
    sql: ${TABLE}.Total_Forecast_September  ;;
  }

  dimension: total_forecast_august {
    type: number
    sql: ${TABLE}.Total_Forecast_August ;;
  }

  measure: august_forecast {
    type: sum
    sql: ${TABLE}.Total_Forecast_august  ;;
  }

  dimension: total_q3_forecast {
    type: number
    sql: ${TABLE}.Total_Q3_Forecast ;;
  }

  measure: Q3_forecast {
    type: sum
    sql: ${TABLE}.Total_Q3_Forecast ;;
  }

  measure: count {
    type: count
    drill_fields: [client_name, cs_name]
  }
}
