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
  }

  measure: customer_creation_count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: created {
    type: time
    label: "Customer Creation"
    description: "first date that a customer subscribed"
    sql: ${TABLE}.Created ;;
  }

  set: detail {
    fields: [customer_id, created_time]
  }

#   dimension: Order_statuses {
#     type: string
#     sql: group_concat(cast(order_order.status as char) order by order_order.place_raw);;
#   }
#
#   dimension: Disengaged {
#     type: yesno
#     sql: ${Order_statuses} LIKE '%3,3,3%' ;;
#   }
#
#   dimension: Currently_Disengaged {
#     type: yesno
#     sql: ${Order_statuses} LIKE '%3,3,3,1%' ;;
#   }

  dimension: Live {
    type: yesno
    sql: ${TABLE}.Live ;;
  }
  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }
  dimension_group: Cancelled {
    type: time
    label: "Customer Cancelled"
    description: "last date that a customer unsubscribed"
    sql: ${TABLE}.Cancelled;;
 }

}
