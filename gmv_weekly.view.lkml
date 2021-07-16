

view: gmv_weekly {
  sql_table_name: `production-202017.ogv2_consumerinsight.gmv_weekly`
    ;;

  dimension: Client {
    type: string
    sql: ${TABLE}.Account_Name ;;
  }

  dimension: Success_Owner {
    type: string
    sql: ${TABLE}.Success_Owner ;;
  }

  dimension: GMV_Type {
    type: string
    sql: ${TABLE}.GMV_Type ;;
  }

  dimension: 1st_Month_Forecast {
    type: number
    sql: ${TABLE}.Month_1 ;;
    value_format: "$#,##0.00"
  }

  dimension: 2nd_Month_Forecast {
    type: number
    sql: ${TABLE}.Month_2 ;;
    value_format: "$#,##0.00"
  }

  dimension: 3rd_Month_Forecast {
    type: number
    sql: ${TABLE}.Month_3 ;;
    value_format: "$#,##0.00"
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.Merchant_ID ;;
    primary_key: yes
  }

  measure: count {
    type: count
    drill_fields: [Client, Success_Owner]
  }

  measure: Total_Month_1_Forecast {
    type: sum
    sql: ${1st_Month_Forecast} ;;
    value_format: "$#,##0.00"
  }

  measure: Total_Month_2_Forecast {
    type: sum
    sql: ${2nd_Month_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_Month_3_Forecast {
    type: sum
    sql: ${3rd_Month_Forecast} ;;
    value_format: "$#,##0.00"
  }

  dimension: Jan_2021_Forecast {
    type: number
    sql: ${TABLE}.Jan_2021 ;;
    value_format: "$#,##0.00"
  }

  dimension: Feb_2021_Forecast {
    type: number
    sql: ${TABLE}.Feb_2021 ;;
    value_format: "$#,##0.00"
  }

  dimension: Mar_2021_Forecast {
    type: number
    sql: ${TABLE}.Mar_2021 ;;
    value_format: "$#,##0.00"
  }

  dimension: Apr_2021_Forecast {
    type: number
    sql: ${TABLE}.Apr_2021 ;;
    value_format: "$#,##0.00"
  }

  dimension: May_2021_Forecast {
    type: number
    sql: ${TABLE}.May_2021 ;;
    value_format: "$#,##0.00"
  }

  dimension: Jun_2021_Forecast {
    type: number
    sql: ${TABLE}.Jun_2021 ;;
    value_format: "$#,##0.00"
  }

  dimension: Jul_2021_Forecast {
    type: number
    sql: ${TABLE}.Jul_2021 ;;
    value_format: "$#,##0.00"
  }

  dimension: Dec_2020_Forecast {
    type: number
    sql: ${TABLE}.Dec_2020 ;;
    value_format: "$#,##0.00"
  }

  dimension: Nov_2020_Forecast {
    type: number
    sql: ${TABLE}.Nov_2020 ;;
    value_format: "$#,##0.000"
  }

  dimension: Oct_2020_Forecast {
    type: number
    sql: ${TABLE}.Oct_2020 ;;
    value_format: "$#,##0.00"
  }

  dimension: Sep_2020_Forecast {
    type: number
    sql: ${TABLE}.Sep_2020 ;;
    value_format: "$#,##0.00"
  }

  dimension: Aug_2020_Forecast {
    type: number
    sql: ${TABLE}.Sep_2020 ;;
    value_format: "$#,##0.00"
  }

  measure: Total_Jan_2021_Forecast {
    type: sum
    sql: ${Jan_2021_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_Dec_2020_Forecast {
    type: sum
    sql: ${Dec_2020_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_Nov_2020_Forecast {
    type: sum
    sql: ${Nov_2020_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_Oct_2020_Forecast {
    type: sum
    sql: ${Oct_2020_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_Sep_2020_Forecast {
    type: sum
    sql: ${Sep_2020_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_Aug_2020_Forecast {
    type: sum
    sql: ${Aug_2020_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_Feb_2021_Forecast {
    type: sum
    sql: ${Feb_2021_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_Mar_2021_Forecast {
    type: sum
    sql: ${Mar_2021_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_Apr_2021_Forecast {
    type: sum
    sql: ${Apr_2021_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_May_2021_Forecast {
    type: sum
    sql: ${May_2021_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_Jun_2021_Forecast {
    type: sum
    sql: ${Jun_2021_Forecast};;
    value_format: "$#,##0.00"
  }

  measure: Total_Jul_2021_Forecast {
    type: sum
    sql: ${Jul_2021_Forecast};;
    value_format: "$#,##0.00"
  }
}
