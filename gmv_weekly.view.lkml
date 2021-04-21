

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
  }

  dimension: 2nd_Month_Forecast {
    type: number
    sql: ${TABLE}.Month_2 ;;
  }

  dimension: 3rd_Month_Forecast {
    type: number
    sql: ${TABLE}.Month_3 ;;
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
  }

  measure: Total_Month_2_Forecast {
    type: sum
    sql: ${2nd_Month_Forecast};;
  }

  measure: Total_Month_3_Forecast {
    type: sum
    sql: ${3rd_Month_Forecast} ;;
  }

  dimension: Jan_2021_Forecast {
    type: number
    sql: ${TABLE}.Jan_2021 ;;
  }

  dimension: Dec_2020_Forecast {
    type: number
    sql: ${TABLE}.Dec_2020 ;;
  }

  dimension: Nov_2020_Forecast {
    type: number
    sql: ${TABLE}.Nov_2020 ;;
  }

  dimension: Oct_2020_Forecast {
    type: number
    sql: ${TABLE}.Oct_2020 ;;
  }

  dimension: Sep_2020_Forecast {
    type: number
    sql: ${TABLE}.Sep_2020 ;;
  }

  dimension: Aug_2020_Forecast {
    type: number
    sql: ${TABLE}.Sep_2020 ;;
  }

  measure: Total_Jan_2021_Forecast {
    type: sum
    sql: ${Jan_2021_Forecast};;
  }

  measure: Total_Dec_2020_Forecast {
    type: sum
    sql: ${Dec_2020_Forecast};;
  }

  measure: Total_Nov_2020_Forecast {
    type: sum
    sql: ${Nov_2020_Forecast};;
  }

  measure: Total_Oct_2020_Forecast {
    type: sum
    sql: ${Oct_2020_Forecast};;
  }

  measure: Total_Sep_2020_Forecast {
    type: sum
    sql: ${Sep_2020_Forecast};;
  }

  measure: Total_Aug_2020_Forecast {
    type: sum
    sql: ${Aug_2020_Forecast};;
  }
}
