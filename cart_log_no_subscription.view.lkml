view: cart_log_no_subscription {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: select distinct session_id as session_id, customer_id
from og_transactions.cart_log
where session_id not in (
select distinct session_id
from og_transactions.cart_log
where subscription_id is not null
and logged >= '2017-08-01 00:00:00')
and subscription_id is null
and logged >= '2017-08-01 00:00:00'
and total != 0;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: non_sub_cart {
    type: yesno
    sql: ${session_id} is not null ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  measure: Distinct_Customers {
    label: "Customer Count"
    type: count_distinct
    sql: ${customer_id} ;;
  }
 }
