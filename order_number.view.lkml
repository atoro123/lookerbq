view: order_number {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select order_order.id, order_order.place, row_number() OVER(Partition By order_order.customer_id ORDER BY order_order.place) as running_count_orders
      from ogv2_production.order_order
      left join ogv2_production.order_item on order_order.id = order_item.order_id
      where order_order.merchant_id = 216;;
  }


  dimension: order_id {
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }


  dimension: running_count_orders {
    type: number
    sql: ${TABLE}.running_count_orders ;;
  }

}
