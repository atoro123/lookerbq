view: addres_change_event_log {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select el.id as 'event_id', cc.merchant_user_id as 'Customer1', cc.id as 'Customer2', el.logged as 'Logged', el.object_metadata as 'Payload',
          el.type_id as 'Type_ID', el.object_id as 'Order'
      from event_log el
      left join customer_customer cc
      on cc.id = el.customer_id
      where cc.merchant_id = 113
      and el.logged between subdate(CURDATE(), INTERVAL 1 DAY) and curdate()
      and el.type_id in (8,18,27)
      group by 1 ;;
    indexes: ["event_id"]
  }

  dimension_group: Logged_Date {
    type:  time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_month
    ]
    label: "Logged Date"
    sql: ${TABLE}.Logged ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}.event_id ;;
  }

  dimension: Merchant_User_ID {
    type: number
    sql: ${TABLE}.Customer1 ;;
  }

  dimension: Customer_ID {
    type: number
    sql: ${TABLE}.Customer2 ;;
  }

  dimension: Payload {
    type: string
    sql: ${TABLE}.Payload ;;
  }

  dimension: Type_ID {
    type: number
    sql: ${TABLE}.Type_ID ;;
  }

  dimension: Object_ID {
    type: number
    sql: ${TABLE}.Order ;;
  }

  measure: Action_Count {
    type: count_distinct
    sql: ${TABLE}.event_id ;;
  }
}
