view: subscription_subscription {
  sql_table_name: ogv2_production.subscription_subscription ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension: cancel_reason_code_id {
    type: number
    sql: ${TABLE}.cancel_reason_code_id ;;
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

  dimension: club_id {
    type: number
    sql: ${TABLE}.club_id ;;
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
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  measure: cusotmer_create{
    type: count_distinct
    sql: ${customer_id};;

  }

  dimension: customer_rep_id {
    type: number
    sql: ${TABLE}.customer_rep_id ;;
  }

  dimension: every {
    type: number
    sql: ${TABLE}.every ;;
  }

  dimension: every_period {
    type: number
    sql: ${TABLE}.every_period ;;
  }

  dimension: extra_data {
    type: string
    sql: ${TABLE}.extra_data ;;
  }

  dimension: frequency_days {
    type: number
    sql: ${TABLE}.frequency_days ;;
  }

  dimension: iteration {
    type: number
    sql: ${TABLE}.iteration ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: merchant_order_id {
    type: string
    sql: ${TABLE}.merchant_order_id ;;
  }

  dimension: offer_id {
    type: number
    sql: ${TABLE}.offer_id ;;
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: product_attribute_id {
    type: number
    sql: ${TABLE}.product_attribute_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: reminder_days {
    type: number
    sql: ${TABLE}.reminder_days ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: shipping_address_id {
    type: number
    sql: ${TABLE}.shipping_address_id ;;
  }

  dimension_group: start {
    type: time
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: subscription_type {
    type: string
    sql: ${TABLE}.subscription_type ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
  dimension: clean_cancel {
    sql: case when left(${cancel_reason},2) = '3|' then 'No Longer Use'
    when left(${cancel_reason},2) = '11' then 'Shipping Price'
    when left(${cancel_reason},2) = '1|' then 'Other'
    when left(${cancel_reason},2) = '25' then 'Online Management Issue'
    when left(${cancel_reason},2) = '2|' then 'Overstocked'
    when left(${cancel_reason},2) = '4|' then 'Product Change'
    when left(${cancel_reason},2) = '6|' then 'Buying Product Elsewhere'
    when left(${cancel_reason},2) = '7|' then 'General Issue'
    when left(${cancel_reason},2) = '8|' then 'Too Expensive'
    ELSE 'Other' END
          ;;
  }
  dimension: VSI_Store_ID {
    type: string
    sql: right(left(${merchant_order_id}, 8 ),4) ;;
  }
}
