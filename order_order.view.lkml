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

  dimension: last_date {
    type: string
    sql: case when ${status}=5 then ${place_date} end ;;
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
    sql: TIMESTAMP(${TABLE}.cancelled) ;;
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
    sql: TIMESTAMP(${TABLE}.place) ;;
  }

  dimension_group: GMT_place {
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
    sql: TIMESTAMP_ADD(TIMESTAMP(${TABLE}.place), INTERVAL 5 HOUR) ;;
  }

  dimension: Is_CC_Recycle_Order {
    description: "Order went into CC Recycling Process"
    type: yesno
    sql: ${recycle_ccexpirationdatelog.order_id} is not null ;;
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
    when (${rejected_message} like '%could not be submitted' and ${merchant_id} = 150) then 'Order Could not be Submitted'
    when ${rejected_message} like '%KOUNT%' then 'KOUNT Technical Issue'
    when ${rejected_message} like '%020%' then 'Technical Issue'
    when ${rejected_message} like '%998%' then 'Order Failed Data Validation'
    when ${rejected_message} like '%500%' then 'Payment Expired'
    when ${rejected_message} like '%520%' then 'Generic Error Code'
    when ${rejected_message} like '%140%' then 'Payment was declined'
    when ${rejected_message} like '%130%' then 'Invalid Billing or Shipping Address'
    when ${rejected_message} like '%120%' then 'Invalid Payment'
    when ${rejected_message} like '%110%' then 'Invalid Credit Card Number'
    when ${rejected_message} like '%100%' then 'Could not obtain a Customer Payment record'
    when ${status} = 14 then 'Response Processing Error'
    when ${rejected_message} like '{}' then 'No Response'
    when ${rejected_message} is NULL then NULL
    else 'Other' end;;
    }

  dimension: GNC_Rejection_Code {
    sql: case when ${rejected_message} like '%170%' then '170 No Aurus Token or No Payment in Customer Wallet'
          when ${rejected_message} like '%140%'  then '140 Payment Declined'
          when ${rejected_message} like '%020%' then '020 Create Order Failed'
          when ${rejected_message} like '%500%' then '500 Error Credit Card Expired'
          when ${rejected_message} like '%160%' then '160 Fraud Do Not Retry'
          when ${rejected_message} like '%130%' then '130 Invalid Billing Address'
          when ${rejected_message} like '%{}%' then '140 Payment Declined'
          when ${rejected_message} like '%998%' then 'Generic Error'
          when ${rejected_message} like '%110%' then '110 Error Invalid Card Number'
          else 'other' end;;
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
    sql: FORMAT_DATETIME('%b %Y', ${TABLE}.place);;
  }

  dimension: Contains_IU {
    type:  yesno
    sql: (${order_item.subscription_id} is not NULL and (
    ${order_item.one_time} is True
    or ${subscription_offer.offer_name} LIKE '%IU%'
    or ${subscription_offer.offer_name} LIKE '%Impulse Upsell%'
    or ${subscription_offer.offer_type} IN (12,13,14,19,20,23)
    or ${subscription_subscription.subscription_type} = 'IU Replenishment'
    or ${order_offer.offer_name} like '%IU%'
    or ${order_offer.offer_name} like '%Impulse Upsell%')) or (${order_item.one_time} is True and ${order_item.subscription_id} is NULL);;}

  dimension: Contains_Honest_GWP {
    type:  yesno
    sql: ${order_item.offer_id} = 6081;;
    }

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

  measure: skipped_orders_revenue {
    type: sum
    sql:  ${sub_total} ;;
    filters: {
      field: status
      value: "4"
    }
    value_format_name: usd
  }

  measure: skipped_orders {
    type: count
    filters: {
      field: status
      value: "4"
    }
    drill_fields: [order_details*]
  }

  measure: order_processing {
    type: number
    sql: ${completed_orders}/if(${attempted_orders}=0,null,${attempted_orders});;
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
    when ${order_placementfailure.count} = 2 then 6
    when ${order_placementfailure.count} = 3 and ${status} = 3 then 6
    when ${order_placementfailure.count} = 3 and ${status} = 5 then 9
    else 9 end;;
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
    sql: TIMESTAMP(DATE_SUB(DATE(${place_date}),INTERVAL ${subtracted_days_for_original} DAY)) ;;

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
      value: "1,2,3,4"
    }
    drill_fields: [order_details*]}

  measure: rejected_retry_orders {
    group_label: "Retry"
    type: count
    filters: {
      field: status
      value: "3"
    }
    filters: {
      field: order_placementfailure.count
      value: "1,2,3,4"
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
      value: "1,2,3"
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
      value: "3,4"
    }
    sql: ${sub_total} ;;
    drill_fields: [order_details*]
  }

  measure: Average_Order_Value {
    type: average
    sql: ${total} ;;
    value_format: "$00.00"
  }

  measure: days {
  label: "Days into Fiscal Year"
  type: number
  sql: DATEDIFF(current_date(),'2019-02-01');;
  }

  dimension: 140_error {
    type: yesno
    hidden: yes
    sql: ${rejected_message} like '%140%';;
  }

  measure: rejected_orders {
    hidden: yes
    type: count
    filters: {
      field: status
      value: "3,14"}
    drill_fields: [id,order_merchant_id,customer_id,customer_customer.merchant_user_id,status,sub_total,rejected_reason,rejected_message,place_date]
  }

  measure: 140_errors {
    type: count
    filters: {field:140_error
              value: "yes"
  }}

  measure: Rejected_eligible_for_Retry{
    type: number
    sql: ${140_errors}/${rejected_orders} ;;
    value_format: "0.0%"
  }

  measure: Order_Product_Count {
    type: count_distinct
    sql: ${order_item.id} ;;
  }

  measure: Max_Order_Date {
    type: date
    sql: max(${place_date});;
  }

    measure: Min_Order_Date {
      type: date
      sql: min(${place_date});;
    }

    measure: Max_Completed__Order_Date {
      type: date
      sql: MAX(CASE WHEN (${status}  = 5) THEN (DATE(${place_date})) ELSE NULL END);;
    }

    measure: Max_Failed__Order_Date {
      type: date
      sql: MAX(CASE WHEN (${status}  = 3) THEN (DATE(${place_date})) ELSE NULL END);;
    }

    measure: Min_Completed__Order_Date {
      type: date
      sql: MIN(CASE WHEN (${status}  = 5) THEN (DATE(${place_date})) ELSE NULL END);;
    }

    measure: Distinct_Subscription {
      type: count_distinct
      sql: ${order_item.subscription_id} ;;
    }


  dimension: Rejected_Reason_Code {
    label: "Rejected Reason Code"
    type: number
    sql: left(right(${rejected_message}, 5),3) ;;
  }

  dimension: Order_Status_Name {
    type: string
    sql: case when ${status} = 5 then "Successful"
          when ${status} = 4 then "Cancelled"
          when ${status} = 3 then "Rejected"
          when ${status} = 18 then "Retry"
          when ${status} = 17 then "Merged"
          when ${status} = 1 then "Pending"
          when ${status} = 6 then "Send Now"
          else "Other" end;;
  }

    dimension_group: retry_original_place_3rd_retry {
      description: "Calculates original place date for retry. Assumes 3 days between attempts"
      label: "3rd Retry Original Place Date"
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
      sql: DATE_SUB(${place_date},INTERVAL ${subtracted_days_for_original_3rd} DAY) ;;
      }

      dimension: subtracted_days_for_original_3rd {
        type: number
        hidden: yes
        sql: case when ${order_placementfailure.count} = 1 then 3
        when ${order_placementfailure.count} in (2,3) then 6
          else 9 end;;
      }

      dimension: BOPUS_Order {
        type: yesno
        sql: ${shipping_address_id} = ${customer_address.id} ;;
      }

      dimension: VSI_Email_BOPUS {
        type: yesno
        sql: ${vsi_email_bopus.order_id} is not null ;;
      }

      measure: Distinct_Customers {
        type: count_distinct
        sql: ${customer_id} ;;
      }

      dimension: in_cart_log {
        type: yesno
        sql: ${order_merchant_id} = ${cart_log.merchant_order_id} ;;
      }

      measure: Total_Fullfillment_Count  {
        type: count
        description: "counts up Successful, Cancelled, and Rejected Orders"
        sql: ${id} ;;
        filters: {
          field: status
          value: "3,4,5,13"
        }
      }

    dimension: Brand {
      type: string
      sql: case when ${merchant_id} in (37,43,60,61,202,97,65) then 'Loreal'
            when ${merchant_id} in (179,77,199,166,194,193,239) then 'Unilever'
            when ${merchant_id} in (108,131,236) then 'Newell'
            else 'other' end;;
    }

      measure: Order_Fullfillment {
        type: number
        description: "% of Orders slated for placement that were sucessful. Includes Cancelled"
        sql: if(${completed_orders} is null, 0, ${completed_orders})/if(${Total_Fullfillment_Count} is null, 0, ${Total_Fullfillment_Count}) ;;
        value_format: "0.00%"
      }

  measure:  distinct_products {
    type: count_distinct
    sql: ${order_item.product_id} ;;
  }

    dimension_group: 2nd_retry_attempt_date {
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
      sql:  TIMESTAMP(DATE_SUB(${place_date},INTERVAL (case when ${order_placementfailure.count} = 2 then 3
        when ${order_placementfailure.count} = 3 then 6 end) DAY)) ;;
    }

    dimension_group: 3rd_retry_attempt_date {
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
      sql:  TIMESTAMP(DATE_SUB(${place_date},INTERVAL (case when ${order_placementfailure.count} = 3 then 3 end) DAY)) ;;
    }

    dimension_group: 1st_retry_attempt_date {
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
      sql:  TIMESTAMP(DATE_SUB(${place_date},INTERVAL (case when ${order_placementfailure.count} = 1 then 3
              when ${order_placementfailure.count} = 2 then 6
              when ${order_placementfailure.count} = 3 then 9 end) DAY)) ;;
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
