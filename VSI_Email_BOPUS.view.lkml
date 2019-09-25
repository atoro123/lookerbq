view: vsi_email_bopus {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24)) ;;
    sql: select distinct o.id as order_id, o.sub_total as sub_total, o.customer_id as customer_id, o.place as place
from ogv2_production.order_order o
join ogv2_production.customer_address ca
on o.shipping_address_id = ca.id
and ca.store_public_id is not null
left join ogv2_production.event_log el
on o.customer_id = el.customer_id
and o.id = el.object_id
and o.status = 5
and el.type_id = 4
where o.merchant_id = 113
and el.id is not NULL
group by 1,2,3,4 ;;
}

dimension: order_id {
  primary_key: yes
  type: number
  sql: ${TABLE}.order_id ;;
  value_format: "0"
}

dimension: customer_id {
  type: number
  sql: ${TABLE}.customer_id ;;
  value_format: "0"
}

dimension: sub_total {
  type: number
  sql: ${TABLE}.sub_total ;;
}

dimension_group: place {
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
  sql: TIMESTAMP(${TABLE}.place)  ;;
}

measure: Distinct_Customer{
  label: "Distinct Customer Count"
  type: count_distinct
  sql: ${customer_id} ;;
}

measure: Order_Revenue {
  type: sum
  sql: ${sub_total} ;;
}
}
