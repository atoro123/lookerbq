view: order_over_order {
derived_table: {
  sql_trigger_value: select current_date ;;
    sql: select s.customer_id AS customer_id,
    s.id AS subscription_id,
    group_concat(cast((case when s.live = 1 then status else null end) as char) order by place) AS result_str,
    count(distinct(case when o.status =5 then o.id else NULL end)) AS completed_orders
        from order_item i
        join order_order o on o.id=i.order_id
        join subscription_subscription s on s.id=i.subscription_id
        group by 2

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
    sql: case when ${TABLE}.completed_orders >= 7 then "7+" when ${TABLE}.completed_orders is null then 0 else ${TABLE}.completed_orders end ;;
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
}
