view: customer_facts {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select
      customer_id
      , merchant_id
      , min(created) "Created"
      , max(cancelled) "Cancelled"
      , max(live) "Live"

      from subscription_subscription ss

      group by 1

       ;;
      indexes: ["customer_id"]
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
      year
    ]
    label: "Customer Creation"
    description: "first date that a customer subscribed"
    sql: ${TABLE}.Created ;;
  }

  set: detail {
    fields: [customer_id, created_time]
  }

  dimension: Live {
    type: yesno
    sql: ${TABLE}.Live ;;
    hidden: yes
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
      year
    ]
    label: "Customer Cancelled"
    description: "last date that a customer unsubscribed"
    sql: ${TABLE}.Cancelled;;
 }

  dimension: Subscriber_lifetime {
    type: number
    hidden: yes
    sql:DATEDIFF(${Cancelled_date},${created_date}) ;;
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
}
