view: impulse_upsell_adds {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: select o.id AS log_id, o.order_id AS order_id, o.subscription_id AS subscription_id, o.merchant_id AS merchant_id, o.customer_id AS customer_id, o.logged AS add_date,
    a.place as place, a.logged as reminder, Date_diff((CAST(a.place  AS DATE)), (CAST(o.logged AS DATE)), DAY) as From_Place,
    Date_diff((CAST(a.logged AS DATE)), (CAST(o.logged AS DATE)), DAY) AS From_Reminder
from og_transactions.order_item_log o
left join (select id, order_id AS orders, date(logged) AS logged, date(place) AS place
from og_transactions.order_log
where event_id = 26
) a
on a.orders = o.order_id
where o.event_id = 2
group by 1,2,3,4,5,6,7,8,9,10
 ;;
}

dimension: Log_ID {
  type: number
  sql: ${TABLE}.log_id ;;
  value_format: "0"
}

dimension: order_id {
  type: number
  sql: ${TABLE}.order_id ;;
}

dimension: customer_id {
  type: number
  sql: ${TABLE}.customer_id ;;
}

dimension: merchant_id {
  type: number
  sql: ${TABLE}.merchant_id ;;
}

dimension: subscription_id {
  type: number
  sql: ${TABLE}.subscription_id ;;
}

dimension_group: IU_Add_Date {
   type: time
  timeframes: [
    raw,
    time,
    date,
    week,
    month,
    quarter,
    year,
    day_of_month
  ]
  sql: ${TABLE}.add_date ;;
}

  dimension_group: reminder_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month
    ]
    sql: ${TABLE}.reminder ;;
  }

  dimension_group: place_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month
    ]
    sql: ${TABLE}.place ;;
  }

  dimension: IU_One_Time {
    type: yesno
    sql: ${subscription_id} is null ;;
  }

  dimension: IU_Subscription {
    type: yesno
    sql: ${subscription_id} is not null ;;
  }

  dimension: From_Reminder {
    type: number
    sql:  ${TABLE}.From_Reminder;;
  }

  dimension: From_Place {
    type: number
    sql: ${TABLE}.From_Place ;;
  }

  measure: Average_Day_From_Reminder {
    type: average
    sql: ${From_Reminder} ;;
    value_format: "0.##"
  }

  measure: Average_Day_From_Place {
    type: average
    sql: ${From_Place} ;;
    value_format: "0.##"
  }
}
