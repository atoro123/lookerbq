view: order_over_order {
derived_table: {
  sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24)) ;;
    sql: select s.customer_id AS customer_id,
    s.id AS subscription_id,
   STRING_AGG(CAST((case when s.live = TRUE then status else null end) as STRING), ',' order by o.place) AS result_str,
    count(distinct(case when o.status =5 then o.id else NULL end)) AS completed_orders,
    MAX(CASE WHEN (o.status  = 5) THEN (DATE(o.place)) ELSE NULL END) AS max_success,
    MAX(CASE WHEN (o.status  = 3) THEN (DATE(o.place)) ELSE NULL END) max_rejected,
     count(distinct (case when o.status =3 then o.id else NULL end)) as rejected_orders,
    count(distinct (case when o.status in (3,5,14) then o.id else NULL end)) as attempted_orders,
    count(distinct (case when o.status =4 then o.id else NULL end)) as cancelled_orders
        from order_item i
        join order_order o on o.id=i.order_id
        join subscription_subscription s on s.id=i.subscription_id
        group by 1,2

       ;;
     # indexes: ["subscription_id"]
}

  dimension: subscription_id {
    type:number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.subscription_id ;;
  }

dimension: customer_id {
  type:number
  hidden: yes
  sql: ${TABLE}.customer_id ;;
}

dimension: result_str{
  type: string
  sql: ${TABLE}.result_str ;;
}

  dimension: Disengaged {
    type: yesno
    description: "Live subscription that has had 3 failed orders in a row at some point"
    sql: ${result_str} LIKE '%3,3,3%' ;;
  }

  dimension: Currently_Disengaged {
    type: yesno
    description: "Live subscription with the past 3 orders having failed"
    sql: ${result_str} LIKE '%3,3,3,1' ;;
  }

  dimension: Completed_Orders {
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

  dimension: All_Completed_Orders {
    type: number
    sql: ${TABLE}.completed_orders ;;
  }

  dimension: Last_Successful_Date {
    type: date
    sql: ${TABLE}.max_success ;;
  }

  dimension: Last_Rejected_Date {
    type: date
    sql: ${TABLE}.max_rejected ;;
  }

  dimension: Source_Completed_Orders {
    type: number
    hidden: yes
    sql: ${TABLE}.completed_orders;;
  }

  measure: Average_Completed_Orders {
    type: average
    sql: ${Source_Completed_Orders} ;;
    value_format: "0.0"
  }

  dimension: Cancelled_Orders {
    type: number
    sql: ${TABLE}.cancelled_orders ;;
  }

  dimension: Bucket_Cancelled_Orders {
    type: tier
    style: interval
    tiers: [0,1,2,3,4,5,6,7,8,9,10]
    sql: ${Cancelled_Orders} ;;
    value_format: "0"
  }
}
