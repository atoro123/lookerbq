view: order_rejection {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select customer_id,
    left(right(rejected_message,5),3) as 'Rejection',
    min(place) as 'Min',
    merchant_id
    from order_order
    where status = 3
    group by 1;;
    #indexes: ["customer_id"]
  }

  dimension_group: min {
    type: time
    timeframes: [
      raw,
      time,
      date,
       week,
      month,
      month_name,
      quarter,
      year
    ]
    label: "1st Customer Rejection"
    description: "first date a customer received an order rejection"
    sql: ${TABLE}.Min ;;
  }

  dimension: Rejection {
    type: string
    description: "rejection code"
    sql: ${TABLE}.Rejection ;;
  }

  dimension: customer_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  measure: Customer_Count {
    type: count_distinct
    sql: ${TABLE}.customer_id ;;
  }


  }
