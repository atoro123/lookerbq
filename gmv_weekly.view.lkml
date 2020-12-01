

view: gmv_weekly {
  sql_table_name: `production-202017.ogv2_consumerinsight.gmv_weekly`
    ;;

  dimension: july_actuals {
    type: number
    sql: ${TABLE}.Month_Three_Actuals ;;
  }

  dimension: base_gmv_forecast_october {
    type: number
    sql: ${TABLE}.Base_GMV_Forecast_Month_Three ;;
  }

  dimension: base_gmv_forecast_september {
    type: number
    sql: ${TABLE}.Base_GMV_Forecast_Month_Two ;;
  }

  dimension: base_gmv_forecast_august {
    type: number
    sql: ${TABLE}.Base_GMV_Forecast_Month_One ;;
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
    sql: ${TABLE}.Past_Month_One_Actuals ;;
  }

  dimension: growth_october {
    type: number
    sql: ${TABLE}.Growth_Month_Three ;;
  }

  dimension: growth_september {
    type: number
    sql: ${TABLE}.Growth_Month_Two ;;
  }

  dimension: growth_august {
    type: number
    sql: ${TABLE}.Growth_Month_One ;;
  }

  dimension: october_qtr_adjust {
    type: number
    sql: ${TABLE}.Month_Three_Qtr_Adjust ;;
  }

  dimension: september_qtr_adjust {
    type: number
    sql: ${TABLE}.Month_Two_Qtr_Adjust ;;
  }

  dimension: June_actuals {
    type: number
    sql: ${TABLE}.Past_Month_Two_Actuals ;;
  }

  dimension: august_qtr_adjust {
    type: number
    sql: ${TABLE}.Month_One_Qtr_Adjust ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.Merchant_ID ;;
  }

  dimension: total_forecast_october {
    type: number
    sql: ${TABLE}.Total_Forecast_Month_Three ;;
  }

  measure: october_forecast {
    type: sum
    sql: ${TABLE}.Total_Forecast_Month_Three  ;;
  }

  dimension: total_forecast_september {
    type: number
    sql: ${TABLE}.Total_Forecast_Month_Two ;;
  }

  measure: september_forecast {
    type: sum
    sql: ${TABLE}.Total_Forecast_Month_Two  ;;
  }

  dimension: total_forecast_august {
    type: number
    sql: ${TABLE}.Total_Forecast_Month_One ;;
  }

  measure: august_forecast {
    type: sum
    sql: ${TABLE}.Total_Forecast_Month_One  ;;
  }

  dimension: total_q3_forecast {
    type: number
    sql: ${TABLE}.Total_Q_Forecast ;;
  }

  measure: Q3_forecast {
    type: sum
    sql: ${TABLE}.Total_Q_Forecast ;;
  }

  measure: count {
    type: count
    drill_fields: [client_name, cs_name]
  }
}
