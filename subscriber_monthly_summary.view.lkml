view: subscriber_monthly_summary {
#   derived_table: {
#     sql: select *
#       from subscriber_monthly_summary
#        ;;
#   }

  sql_table_name: subscriber_monthly_summary ;;

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: new {
    type: number
    sql: ${TABLE}.new ;;
  }

  dimension: active {
    type: number
    sql: ${TABLE}.active ;;
  }

  dimension: cancel {
    type: number
    sql: ${TABLE}.cancel ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [
      id,
      date,
      merchant_id,
      new,
      active,
      cancel,
      count
    ]
  }
}
