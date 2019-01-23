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
    hidden: yes
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

  dimension: Live {
    type: yesno
    sql: ${TABLE}.Live ;;
    hidden: yes
  }
  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
    hidden: yes
  }
  dimension_group: Cancelled {
    type: time
    label: "Customer Cancelled"
    description: "last date that a customer unsubscribed"
    sql: ${TABLE}.Cancelled;;
 }

}
