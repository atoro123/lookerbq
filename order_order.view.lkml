view: order_order {
  sql_table_name: ogv2_production.order_order ;;



  ## custom dimensions / measures

  dimension: months_since_signup {
    type: number
  #  sql: 1.0 * ( DATEDIFF(${created_date} , ${customer_customer.created_date} )) / 30;;
    sql: TIMESTAMPDIFF(MONTH,${customer_customer.created_date}, ${created_date}) ;;

  }
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: cancelled {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.cancelled ;;
  }

  dimension_group: created {
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
    type: string
    sql: ${TABLE}.extra_data ;;
  }

  dimension: generic_error_count {
    type: number
    sql: ${TABLE}.generic_error_count ;;
  }

  dimension: locked {
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
    type: string
    sql: ${TABLE}.order_merchant_id ;;
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension_group: place {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
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
    drill_fields: [id]
  }

  measure: average_sub_total {
    type: average
    value_format_name: usd
    sql: ${sub_total} ;;
  }

  dimension: clean_rejected {
    sql:
    case
    when ${rejected_message} like '%500%' then 'Payment Expired'
    when ${rejected_message} like '%520%' then 'Generic Error Code'
    when ${rejected_message} like '%140%' then 'Payment was declined'
    when ${rejected_message} like '%130%' then 'Invalid Billing or Shipping Address'
    when ${rejected_message} like '%120%' then 'Invalid Payment'
    when ${rejected_message} like '%110%' then 'Invalid Credit Card Number'
    else 'Other' end;;
    }

  measure: completed_orders {
    type: count
    filters: {
      field: status
      value: "5"
    }
  }
}
