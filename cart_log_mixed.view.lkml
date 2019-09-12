view: cart_log_mixed {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: select a.session as session, a.merchant_id as merchant_id, a.customer_id as customer_id, a.merchant_user_id, a.date as date, a.Sub_Items as Sub_Items, b.Non_Sub_Items as Non_Sub_Items,
          a.Sub_Quantity as Sub_Quantity, b.Non_Sub_Quantity as Non_Sub_Quantity, a.Sub_Total as Sub_Total, b.Non_Sub_Total as Non_Sub_Total, (a.Sub_Items + b.Non_Sub_Items) as Total_Items, (a.Sub_Quantity + b.Non_Sub_Quantity) as Total_Quantity, (a.Sub_Total + b.Non_Sub_Total) as Total_Total
      from
      (select distinct session_id as session, merchant_id, customer_id, merchant_user_id, date(logged) as date, count(id) as Sub_Items, sum(quantity) as Sub_Quantity, sum(total) as Sub_Total
      from og_transactions.cart_log
      where subscription_id is not null
      and total != 0
      group by 1,2,3,4,5) a
      inner join
      (select distinct session_id as session, merchant_id, customer_id, merchant_user_id, date(logged) as date, count(id) as Non_Sub_Items, sum(quantity) as Non_Sub_Quantity, sum(total) Non_Sub_Total
      from og_transactions.cart_log
      where subscription_id is null
      and total != 0
      group by 1,2,3,4,5) b
      on a.session = b.session
      group by 1,2,3,4,5,6,7,8,9,10,11;;
  }

  dimension: session  {
    type: string
    primary_key: yes
    sql: ${TABLE}.session ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: merchant_user_id {
    type: number
    sql: ${TABLE}.merchant_user_id ;;
  }

  dimension_group: Date {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      day_of_week,
      date,
      week,
      month,
      month_num,
      month_name,
      day_of_month,
      quarter,
      year
    ]
    sql: TIMESTAMP(${TABLE}.date) ;;
  }

  dimension: Non_Sub_Items {
    type: number
    sql: ${TABLE}.Non_Sub_Items ;;
  }

  dimension: Sub_Items {
    type: number
    sql: ${TABLE}.Sub_Items ;;
  }

  dimension: Non_Sub_Quantity {
    type: number
    sql: ${TABLE}.Non_Sub_Quantity ;;
  }

  dimension: Sub_Quantity {
    type: number
    sql: ${TABLE}.Sub_Quantity ;;
  }

  dimension: Non_Sub_Total {
    type: number
    sql: ${TABLE}.Non_Sub_Total ;;
    value_format: "$0.00"
  }

  dimension: Sub_Total {
    type: number
    sql: ${TABLE}.Sub_Total ;;
    value_format: "$0.00"
  }

  dimension: Total_Quantity {
    type: number
    sql: ${TABLE}.Total_Quantity ;;
  }

  dimension: Total_Items {
    type: number
    sql: ${TABLE}.Total_Items ;;
  }

  dimension: Total_Total {
    view_label: "Total Session Value"
    type: number
    sql: ${TABLE}.Total_Total ;;
    value_format: "$0.00"
  }

  measure: Session_Count {
    type: count_distinct
    sql: ${session} ;;
  }

  measure: All_Sub_Items {
    type: sum
    sql: ${Sub_Items} ;;
  }

  measure: All_Non_Sub_Items {
    type: sum
    sql: ${Non_Sub_Items} ;;
  }

  measure: All_Items {
    type: sum
    sql: ${Total_Items} ;;
  }

  measure: All_Sub_Quantity {
    type: sum
    sql: ${Sub_Quantity} ;;
  }

  measure: All_Non_Sub_Quantity {
    type: sum
    sql: ${Non_Sub_Quantity} ;;
  }

  measure: All_Quantity {
    type: sum
    sql: ${Total_Quantity} ;;
  }

  measure: Sub_Revenue {
    type: sum
    sql: ${Sub_Total} ;;
    value_format: "$0.00"
  }

  measure: Non_Sub_Revenue {
    type: sum
    sql: ${Non_Sub_Total} ;;
    value_format: "$0.00"
  }

  measure: All_Revenue {
    type: sum
    sql: ${Total_Total} ;;
    value_format: "$0.00"
  }

  measure: Avg_Sub_Quantity {
    type: average
    sql: ${Sub_Quantity} ;;
    value_format: "0.0"
  }

  measure: Avg_Non_Sub_Quantity {
    type: average
    sql: ${Non_Sub_Quantity} ;;
    value_format: "0.0"
  }

  measure: Avg_Sub_Total_Value {
    type: average
    sql: ${Sub_Total} ;;
    value_format: "$0.00"
  }

  measure: Avg_Non_Sub_Total_Value {
    type: average
    sql: ${Non_Sub_Total} ;;
    value_format: "$0.00"
  }

}
