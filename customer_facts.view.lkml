view: customer_facts {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: select
      subscription_subscription.customer_id
      , subscription_subscription.merchant_id
      , min(subscription_subscription.id) as Subscription
      , min(subscription_subscription.created) as Created
      , TIMESTAMP(max(case when subscription_subscription.live is FALSE then subscription_subscription.cancelled else null end)) as Cancelled
      , max(subscription_subscription.live) as Live
      , count(distinct order_order.id) as Total_Orders
      , count(distinct case when order_order.status = 5 then order_order.id else null end) as Completed_Orders
      , count(case when order_order.status = 5 then order_order.sub_total else null end) as Total_Spend


      from ogv2_production.subscription_subscription
      left join ogv2_production.order_order on subscription_subscription.customer_id = order_order.customer_id

      group by 1,2

       ;;
     # indexes: ["customer_id"]
  }

  measure: customer_creation_count {
    type: count
    drill_fields: [customer_customer.merchant_user_id,created_date]
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
      day_of_month,
      week_of_year,
      day_of_week,
      month_num
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
      day_of_month,
      month_num
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

  dimension: subscriber_lifetime_all {
    type: number
    sql: DATE_DIFF(ifnull(${Cancelled_date}, CURRENT_DATE()),${created_date}, DAY)  ;;
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

dimension: Total_Spend {
  hidden: yes
  type: number
  sql: ${TABLE}.Total_Spend ;;
  value_format: "$0.00"
}

dimension: Bucket_LTV {
  type: tier
  style: interval
  tiers: [0,25,50,75,100,150,200,300,400,500]
  sql: ${TABLE}.Total_Spend ;;
  value_format: "$0"
}

  measure: AVG_LTV {
    type: number
    sql:  SAFE_DIVIDE(${LTV},${distinct}) ;;
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

  dimension: Bucket_Orders {
    type: tier
    style: interval
    tiers: [0,1,2,3,4,5,6,7,8,9,10]
    sql: ${Completed_Orders} ;;
    value_format: "0"
  }

  measure: AVG_Orders {
    type: number
    sql:  SAFE_DIVIDE(${Orders},${distinct}) ;;
    value_format: "0.0"
  }

  dimension: First_Subscription_ID {
    type: number
    sql: ${TABLE}.Subscription ;;
  }

  dimension: Total_Orders {
    type: number
    sql: ${TABLE}.total_orders;;
  }


  dimension: Completed_Orders {
    type: number
    sql: ${TABLE}.Completed_Orders;;
  }

  dimension: Completed_Orders_Bucket {
    type: string
    sql: case when ${TABLE}.completed_orders >= 7 then "7+"
          when ${TABLE}.completed_orders is null then '0'
           when ${TABLE}.completed_orders = 6 then "6"
           when ${TABLE}.completed_orders = 5 then "5"
           when ${TABLE}.completed_orders = 4 then "4"
           when ${TABLE}.completed_orders = 3 then "3"
           when ${TABLE}.completed_orders = 2 then "2"
           when ${TABLE}.completed_orders = 1 then "1"
          else '0' end ;;
  }
}
