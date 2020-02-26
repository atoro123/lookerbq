view: subscription_order {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select
      subscription_subscription.id as sub_id
      , subscription_subscription.merchant_id
      , subscription_subscription.customer_id
      , max(case when order_order.status = 3 then order_order.place else null end) as max_rejection
      , max(case when order_order.status = 5 then order_order.place else null end) as max_successful
      , count(case when order_order.status = 5 then order_item.order_id else null end) as complete_orders
      , max(case when order_order.status = 1 then order_order.place else null end) as max_upcoming
      from ogv2_production.subscription_subscription
      left join ogv2_production.order_item on subscription_subscription.id = order_item.subscription_id
      left join ogv2_production.order_order on order_order.id = order_item.order_id
      group by 1,2,3

       ;;
    indexes: ["sub_id"]
  }

  dimension: subscription_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.sub_id ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension_group: max_upcoming {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      month_name,
      quarter,
      year,
      day_of_month,
      month_num
    ]
    label: "Max Upcoming Order Date"
    description: "Next Upcoming Order Date for the Subscription"
    sql: ${TABLE}.max_upcoming;;
  }

  dimension_group: max_successful {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      month_name,
      quarter,
      year,
      day_of_month,
      month_num
    ]
    label: "Max Successful Order Date"
    description: "last date subscription had a successful order"
    sql: ${TABLE}.max_successful;;
  }

  dimension_group: max_rejection {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      month_name,
      quarter,
      year,
      day_of_month,
      month_num
    ]
    label: "Max Rejected Order Date"
    description: "last date subscription had a rejected order"
    sql: ${TABLE}.max_rejection;;
  }

  dimension: Total_Successful_Orders {
    type: number
    label: "Total Sucecssful Orders"
    sql: ${TABLE}.complete_orders ;;
  }
}
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
