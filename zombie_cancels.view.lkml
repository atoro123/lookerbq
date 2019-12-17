view: zombie_cancels {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: select distinct subscription_id as sub
from og_transactions.subscription_log
where event_id = 14
and (cancel_reason like '%zombie%' or cancel_reason like '%Zombie%') ;;

}

dimension: zombie_subscription {
  type: number
  sql: ${TABLE}.sub ;;
}

}
