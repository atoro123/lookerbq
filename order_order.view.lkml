view: order_order {
  sql_table_name: ogv2_production.order_order ;;



  ## custom dimensions / measures

  dimension: months_since_signup {
    type: number
  #  sql: 1.0 * ( DATEDIFF(${created_date} , ${customer_customer.created_date} )) / 30;;
    sql: TIMESTAMPDIFF(MONTH,${customer_customer.created_date}, ${created_date}) ;;

  }
  dimension: id {
    label: "Order ID"
    description: "Ordergroove internal order id"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: cancelled {
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
    sql: ${TABLE}.cancelled ;;
  }

  dimension_group: created {
    description: "order is created in the system"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      month_num,
      day_of_month,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: discount_total {
    type: number
    sql: ${TABLE}.discount_total ;;
  }

  dimension: extra_data {
    hidden: yes
    type: string
    sql: ${TABLE}.extra_data ;;
  }

  dimension: generic_error_count {
    hidden: yes
    type: number
    sql: ${TABLE}.generic_error_count ;;
  }

  dimension: locked {
    hidden: yes
    type: yesno
    sql: ${TABLE}.locked ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: oos_free_shipping {
    type: yesno
    sql: ${TABLE}.oos_free_shipping ;;
  }

  dimension: order_merchant_id {
    description: "Order id from the merchant"
    type: string
    sql: ${TABLE}.order_merchant_id ;;
  }

  dimension: payment_id {
    hidden: yes
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension_group: place {
    description: "The day that the order processes. Use this to calculate any revenue"
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      week,
      week_of_year,
      month,
      month_num,
      month_name,
      day_of_month,
      quarter,
      year
    ]
    sql: ${TABLE}.place ;;
  }

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: rejected_message {
    type: string
    sql: ${TABLE}.rejected_message ;;
  }

  dimension: shipping_address_id {
    type: number
    sql: ${TABLE}.shipping_address_id ;;
  }

  dimension: shipping_total {
    type: number
    sql: ${TABLE}.shipping_total ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: sub_total {
    type: number
    sql: ${TABLE}.sub_total ;;
    value_format: "$#.00"
  }

  dimension: tax_total {
    type: number
    sql: ${TABLE}.tax_total ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: tries {
    type: number
    sql: ${TABLE}.tries ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [order_details*]
  }

  set: order_details {
    fields: [place_date,id,customer_id,Contains_IU,sub_total]}

  measure: average_sub_total {
    type: average
    value_format_name: usd
    sql: ${sub_total} ;;
    drill_fields: [place_date,order_revenue,completed_orders]
  }

  dimension: rejected_reason {
    sql:
    case
    when ${rejected_message} like '%500%' then 'Payment Expired'
    when ${rejected_message} like '%520%' then 'Generic Error Code'
    when ${rejected_message} like '%140%' then 'Payment was declined'
    when ${rejected_message} like '%130%' then 'Invalid Billing or Shipping Address'
    when ${rejected_message} like '%120%' then 'Invalid Payment'
    when ${rejected_message} like '%110%' then 'Invalid Credit Card Number'
    when ${status} = '14' then 'Response Processing Error'
    when ${rejected_message} is NULL then NULL
    else 'Other' end;;
    }

  measure: completed_orders {
    type: count
    filters: {
      field: status
      value: "5"
    }
    drill_fields: [order_details*]
  }
  measure: attempted_orders {
    type: count
    filters: {
      field: status
      value: "3,5,14"}
    drill_fields: [id,order_merchant_id,customer_id,customer_customer.merchant_user_id,status,sub_total,rejected_reason,rejected_message,place_date]
      }

  dimension: clean_order_place {
    type: string
    sql: Date_format(${TABLE}.place,'%b %Y');;
  }

  dimension: Contains_IU {
    type:  yesno
    sql: (${order_item.subscription_id} is not NULL and (
    ${order_item.one_time} = 1
    or ${subscription_offer.offer_name} LIKE '%IU%'
    or ${subscription_offer.offer_name} LIKE '%Impulse Upsell%'
    or ${subscription_offer.offer_type} IN (12,13,14,19,20,23)
    or ${subscription_subscription.subscription_type} = 'IU Replenishment'
    or ${order_offer.offer_name} like '%IU%'
    or ${order_offer.offer_name} like '%Impulse Upsell%')) or (${order_item.one_time} = 1 and ${order_item.subscription_id} is NULL);;}

  measure: order_revenue {
    type: sum
    value_format_name: usd
    sql:  ${sub_total} ;;
  }

  measure: completed_orders_revenue {
    type: sum
    sql:  ${sub_total} ;;
    filters: {
      field: status
      value: "5"
    }
    value_format_name: usd
  }

  measure: order_processing {
    type: number
    sql: ${completed_orders}/${attempted_orders};;
    value_format: "0.0%"
    drill_fields: [place_date,customer_id,customer_customer.merchant_user_id,sub_total,status,rejected_reason,rejected_message]
  }

  measure: distinct_order_items {
    type: count_distinct
    sql: ${order_item.id} ;;
  }

  dimension: subtracted_days_for_original {
    type: number
    hidden: yes
    sql: case when ${order_placementfailure.count} = 1 then 3
    else 6 end;;
  }

  dimension_group: retry_original_place {
    description: "Calculates original place date for retry. Assumes 3 days between attempts"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      month_num,
      month_name,
      day_of_month,
      quarter,
      year,
      day_of_week
    ]
    sql: DATE_SUB(${place_date},INTERVAL ${subtracted_days_for_original} DAY) ;;

  }

  measure: Pending_Retries{
    group_label: "Retry"
    type: count_distinct
    sql: ${id} ;;
    filters: {field:status
      value:"18"}
  }

  measure: completed_retry_orders {
    group_label: "Retry"
    type: count
    filters: {
      field: status
      value: "5"
    }
    filters: {
      field: order_placementfailure.count
      value: "1,2,3"
    }
    drill_fields: [order_details*]}

  measure: attempted_retry_orders {
    group_label: "Retry"
    type: count
    filters: {
      field: status
      value: "3,5,14"
    }
    filters: {
      field: order_placementfailure.count
      value: "1,2,3"
    }
    drill_fields: [order_details*]}

  measure: successful_retry_revenue {
    group_label: "Retry"
    type: sum
    value_format_name: usd
    filters: {
      field: status
      value: "5"
    }
    filters: {
      field: order_placementfailure.count
      value: "1,2"
    }
    sql: ${sub_total} ;;
    drill_fields: [order_details*]
  }

  measure: rejected_retry_revenue {
    group_label: "Retry"
    type: sum
    value_format_name: usd
    filters: {
      field: status
      value: "3"
    }
    filters: {
      field: order_placementfailure.count
      value: "3"
    }
    sql: ${sub_total} ;;
    drill_fields: [order_details*]
  }
#
#
#   dimension: Last_week {
#     type: yesno
#     hidden: yes
#     sql: case when ${place_week_of_year} = week(DATE_sub(curdate(),interval 7 day))+1 and ${place_date} between DATE_sub(curdate(),interval 50 day) and curdate()  then 1 else 0 end;;
#   }
#
#   measure: completed_orders_last_week{
#     type: count
#     hidden: yes
#     filters: {
#       field: status
#       value: "5"
#     }
#     filters: {
#       field: Last_week
#       value: "yes"
#     }
#   }
#
#   measure: attempted_orders_last_week{
#     type: count
#     hidden: yes
#     filters: {
#       field: status
#       value: "3,5,14"
#     }
#     filters: {
#       field: Last_week
#       value: "yes"
#     }
#   }
#
#   measure: Order_Processing_Last_Week{
#     type: number
#     sql: ${completed_orders_last_week}/${attempted_orders_last_week};;
#     value_format: "0.0%"
#     drill_fields: [place_date,customer_id,customer_customer.merchant_user_id,sub_total,status,rejected_reason,rejected_message]
#   }
#
#   dimension: Previous_3_weeks {
#     type: yesno
#     hidden: yes
#     sql: case when (${place_week_of_year} = week(DATE_sub(curdate(),interval 14 day))+1) and ${place_date} between DATE_sub(curdate(),interval 50 day) and curdate() then 1
#           when ${place_week_of_year} = week(DATE_sub(curdate(),interval 21 day))+1  and ${place_date} between DATE_sub(curdate(),interval 50 day) and curdate()  then 1
#           when ${place_week_of_year} = week(DATE_sub(curdate(),interval 28 day))+1  and ${place_date} between DATE_sub(curdate(),interval 50 day) and curdate()  then 1
#           else 0 end;;
#   }
#
#   measure: completed_orders_last_3_weeks{
#     type: count
#     hidden: yes
#     filters: {
#       field: status
#       value: "5"
#     }
#     filters: {
#       field: Previous_3_weeks
#       value: "yes"
#     }
#   }
#
#   measure: attempted_orders_last_3_weeks{
#     type: count
#     hidden: yes
#     filters: {
#       field: status
#       value: "3,5,14"
#     }
#     filters: {
#       field: Previous_3_weeks
#       value: "yes"
#     }
#   }
#
#   measure: Order_Processing_Last_3_Weeks{
#     type: number
#     sql: ${completed_orders_last_3_weeks}/${attempted_orders_last_3_weeks};;
#     value_format: "0.0%"
#     drill_fields: [place_date,customer_id,customer_customer.merchant_user_id,sub_total,status,rejected_reason,rejected_message]
#   }
}
