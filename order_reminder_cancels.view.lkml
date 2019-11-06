view: order_reminder_cancels {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: select b.orderid as orderid, b.merchant_id as merchant_id, a.cancel as cancel, b.remind as reminder, TIMESTAMP_DIFF(a.cancel, b.remind, HOUR) as dif
from
(select el.object_id as orderid, el.logged as remind, cc.merchant_id as merchant_id
from ogv2_production.event_log el
left join ogv2_production.customer_customer cc
on cc.id = el.customer_id
where el.type_id = 4
group by 1,2,3) b
left join
(select el.object_id as orderid, el.logged as cancel, cc.merchant_id as merchant_id
from ogv2_production.event_log el
left join ogv2_production.customer_customer cc
on cc.id = el.customer_id
where el.type_id = 21
group by 1,2,3) a
on b.orderid = a.orderid
group by 1,2,3,4 ;;
}

dimension: order_id {
  type: number
  sql: ${TABLE}.orderid ;;
}

dimension_group: cancel {
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
      week_of_year
  ]
  label: "Cancelled Event Date"
  description: "timefield for the order cancel action"
  sql: ${TABLE}.cancel ;;
}

dimension_group: reminder_date {
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
      week_of_year
  ]
  label: "Remind Event Date"
  description: "timefield for order reminder action"
  sql: ${TABLE}.reminder ;;
}

dimension: merchant_id  {
  type: number
  sql: ${TABLE}.merchant_id ;;
}

dimension: hours_to_cancel {
  type: number
  sql: ${TABLE}.dif ;;
}

measure: cancelled_orders {
  type: count_distinct
  sql: ${TABLE}.orderid ;;
  filters: {
    field: cancel_date
    value: "-NULL"
  }
  }


  measure: reminder_count {
    type: count_distinct
    sql: ${TABLE}.orderid ;;
  }

measure: average_cancel_time {
  type: average
  sql: ${hours_to_cancel} ;;
}
}
