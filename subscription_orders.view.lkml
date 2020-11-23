view: subscription_orders {
    derived_table: {
      sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
      sql: select
      oi.order_id as order_id,
      oi.subscription_id as subscription_id,
      oo.place as place,
      oo.status as status,
      oo.merchant_id as merchant_id,
      (CASE WHEN status in (1,5) then row_number() OVER(Partition By oi.subscription_id, case when status in (1,5) then 1 else 0 end ORDER BY oo.place) end) as completed_subscription_orders
from ogv2_production.order_order oo
left join ogv2_production.order_item oi
on oi.order_id = oo.id
where oo.status in (1,5)
               ;;
             # indexes: ["subscription_id"]
      }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: subscription_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.subscription_id ;;
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

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: completed_subscription_orders {
    type: number
    sql: ${TABLE}.completed_subscription_orders ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  measure: Count_Orders {
    type: count
    sql: ${order_id}r ;;
  }
  }
