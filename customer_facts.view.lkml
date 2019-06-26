view: customer_facts {
  derived_table: {
    sql_trigger_value: FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24)) ;;
    sql: select
      customer_id
      , merchant_id
      , min(id) as Subscription
      , min(created) as Created
      , TIMESTAMP(max(case when live is FALSE then cancelled else null end)) as Cancelled
      , max(live) as Live

      from ogv2_production.subscription_subscription

      group by 1,2

       ;;
     # indexes: ["customer_id"]
  }

  measure: customer_creation_count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_month
    ]
    label: "Customer Creation"
    description: "first date that a customer subscribed"
    sql: ${TABLE}.Created ;;
  }

  dimension_group: GMT_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_month
    ]
    label: "GMT Customer Creation"
    description: "first date that a customer subscribed"
    sql: date_add(${TABLE}.Created, INTERVAL 4 HOUR) ;;
  }

  set: detail {
    fields: [customer_id, created_time]
  }

  dimension: Customer_Live {
    type: yesno
    sql: ${TABLE}.Live ;;
  }
  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
    hidden: yes
  }
  dimension_group: Cancelled {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_month
    ]
    label: "Customer Cancelled"
    description: "last date that a customer unsubscribed"
    sql: ${TABLE}.Cancelled;;
 }

  dimension_group: GMT_Cancelled {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_month
    ]
    label: "GMT Customer Cancellation"
    description: "last date that a customer unsubscribed"
    sql: date_add(${TABLE}.Cancelled, INTERVAL 4 HOUR) ;;
  }

  dimension: Subscriber_lifetime {
    type: number
    hidden: yes
    sql:DATE_DIFF(${Cancelled_date},${created_date}, DAY) ;;
  }

  dimension: Bucket_Lifetime {
  type: number
  sql:  case when ${Subscriber_lifetime} <= 30 then '30'
              when ${Subscriber_lifetime} <= 60 then '60'
              when ${Subscriber_lifetime} <= 90 then '90'
              when ${Subscriber_lifetime} <= 180 then '180'
              when ${Subscriber_lifetime} <= 365 then '365'
              when ${Subscriber_lifetime} > 365 then '366'
              when ${Subscriber_lifetime} IS NULL then 'NULL'
              else 'error' end;;
}

measure: Average_Subscriber_Lifetime {
  type: average
  sql: ${Subscriber_lifetime} ;;
  value_format: "0.0"
}

measure: distinct {
  hidden: yes
  type: count_distinct
  sql: ${customer_id} ;;
}

measure: LTV {
  hidden: yes
  type: sum
  sql:  ${order_order.sub_total} ;;
  filters: {
    field: order_order.status
    value: "5"
  }
  value_format_name: usd
}

  measure: AVG_LTV {
    type: number
    sql:  ${LTV}/${distinct} ;;
    value_format_name: usd
  }

  measure: Orders {
    type: count_distinct
    hidden:  yes
    sql:  ${order_order.id} ;;
    filters: {
      field: order_order.status
      value: "5"
    }
    value_format: "0"
  }

  measure: AVG_Orders {
    type: number
    sql:  ${Orders}/${distinct} ;;
    value_format: "0.0"
  }

  dimension: First_Subscription_ID {
    type: number
    sql: ${TABLE}.Subscription ;;
  }
}
