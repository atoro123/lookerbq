

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
}
