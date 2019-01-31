view: order_over_order {
derived_table: {
  sql_trigger_value: select current_date ;;
  sql: select s.customer_id "customer_id", s.id "subscription_id",
      group_concat(cast(status as char) order by place) "result_str"
      from order_item i
      join order_order o on o.id=i.order_id
      join subscription_subscription s on s.id=i.subscription_id
      where s.live=1
      group by 2

       ;;
      indexes: ["subscription_id"]
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

}
