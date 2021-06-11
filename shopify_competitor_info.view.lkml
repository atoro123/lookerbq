view: shopify_competitor_info {
  sql_table_name: `production-202017.ogv2_consumerinsight.Shopify_Competitor_Info`
    ;;

  dimension: avg_checkout_charge {
    type: number
    sql: ${TABLE}.avg_checkout_charge ;;
  }

  dimension: avg_recurring_charge {
    type: number
    sql: ${TABLE}.avg_recurring_charge ;;
  }

  dimension: charge_count {
    type: number
    sql: ${TABLE}.Charge_Count ;;
  }

  dimension: custs_with_active_subscriptions {
    type: number
    sql: ${TABLE}.Custs_with_Active_Subscriptions ;;
  }

  dimension_group: day {
    type: time
    description: "%m/%d/%E4Y"
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
    sql: ${TABLE}.Day ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: new_subscriptions {
    type: number
    sql: ${TABLE}.New_Subscriptions ;;
  }

  dimension: new_unsubscriptions {
    type: number
    sql: ABS(${TABLE}.New_Unsubscriptions) ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.Sessions ;;
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.Total_Revenue ;;
  }

  dimension: total_sales {
    type: number
    sql: ${TABLE}.Total_Sales ;;
  }

  dimension: total_sales_charge {
    type: number
    sql: ${TABLE}.Total_Sales_Charge ;;
  }

  dimension: total_sales_checkout {
    type: number
    sql: ${TABLE}.Total_Sales_Checkout ;;
  }

  dimension: total_sales_recurring {
    type: number
    sql: ${TABLE}.Total_Sales_Recurring ;;
  }

  dimension: visitors {
    type: number
    sql: ${TABLE}.Visitors ;;
  }

  dimension: conversion_rate {
      description: "New Subscribers over Sessions"
      sql: Safe_Divide(${new_subscriptions},${sessions}) ;;
      value_format: "0.0%"
  }

  dimension: Old_Program_live {
  }

  measure: daily_conversion_average {
    type: average
    sql: ${conversion_rate} ;;
    value_format: "0.0%"
  }

  measure: Subscriptions_Created {
    type: sum
    sql: ${new_subscriptions} ;;
  }

  measure: Sum_Sessions {
    type: sum
    sql: ${sessions} ;;
  }

  measure: Sum_cancels {
    type: sum
    sql: ${new_unsubscriptions} ;;
  }


  measure: Sum_activation {
    type: sum
    sql: ${total_sales_checkout} ;;
  }

  measure: Sum_recurring {
    type: sum
    sql: ${total_sales_recurring} ;;
  }

  measure: Sum_Total_GMV {
    type: sum
    sql: ${total_sales_charge} ;;
  }

  measure: Total_Shopify_Orders {
    type: sum
    sql: ${total_sales} ;;
  }

  measure: Total_Shopify_Revenue {
    type: sum
    sql: ${total_revenue} ;;
  }

  measure: conversion {
    description: "New Subscribers over Sessions"
    sql: Safe_Divide(sum(${new_subscriptions}),sum(${sessions})) ;;
    value_format: "0.0%"
  }

  measure: subs_over_order_conversion {
    sql: Safe_Divide(sum(${new_subscriptions}),sum(${total_sales})) ;;
    value_format: "0.0%"
  }

  measure: Average_Subscriptions_per_Day {
    type: average
    sql:  ${new_subscriptions};;
    value_format: "0"
  }

  measure: Max_Base {
    type: max
    sql: ${custs_with_active_subscriptions} ;;
  }

  measure: Avg_Base {
    type: average
    sql: ${custs_with_active_subscriptions} ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
