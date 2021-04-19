view: vsi_iu_log {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select a.key as key, (a.count1 + b.count2) as total
from
(select concat(customer_id, "-", order_id, "-", product_id, "-", date(logged)) as key, count(id) as count1
from og_transactions.order_item_log
where merchant_id = 113
and event_id = 12
group by 1) a
left join
(select concat(customer_id, "-", order_id, "-", product_id, "-", date(logged)) as key, count(id) as count2
from og_transactions.order_item_log
where merchant_id = 113
and event_id = 2
group by 1) b
on a.key = b.key
group by 1,2
having total > 1 ;;
    indexes: ["key"]
  }

  dimension: key {
    type: string
    primary_key: yes
    sql: ${TABLE}.key ;;
  }
}
