view: customer_IU_tracker {
  derived_table: {
  sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: select customer_id, case when max(case when event_id in (2,12) then 1 else 0 end) = 1 then true else false end as created_IU
      from og_transactions.order_item_log
      group by 1

             ;;
    indexes: ["customer_id"]
  }



  dimension: customer_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.customer_id ;;

  }

  dimension: created_IU {
    type: yesno
    sql: ${TABLE}.created_IU ;;
  }

}
