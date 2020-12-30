view: frequency_scratch {
  sql_table_name: `production-202017.looker_scratch.frequency_scratch`
    ;;

  dimension: frequency_days {
    type: number
    sql: ${TABLE}.frequency_days ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: orders_recieved {
    type: number
    sql: ${TABLE}.orders_recieved ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: sub_age {
    type: number
    sql: ${TABLE}.sub_age ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: average_orders_recieved {
    type: average
    sql: ${orders_recieved} ;;
  }
}
