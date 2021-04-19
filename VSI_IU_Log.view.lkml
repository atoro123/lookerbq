view: vsi_iu_log {
  derived_table: {
    sql_trigger_value: select FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24))  ;;
    sql: select a.key as key, (a.count + b.count) as total
      from
      (select concat(customer_id, "-", order_id, "-", product_id, "-", date(logged)) as key, count(id) as count
      from og_transactions.order_item_log
      where merchant_id = 113
      and event_id = 12
      group by 1) a
      left join
      (select concat(customer_id, "-", order_id, "-", product_id, "-", date(logged)) as key, count(id) as count
      from og_transactions.order_item_log
      where merchant_id = 113
      and event_id = 2
      group by 1) b
      on a.key = b.key
      group by 1,2
      having total > 1  ;;
  }

  dimension: key {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.key ;;
  }
}
