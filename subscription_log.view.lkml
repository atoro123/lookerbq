view: subscription_log {
  derived_table: {
    sql: select year(logged), month(logged), count(distinct subscription_id) AS Created, sum(total_price) AS Act_Rev
      from subscription_log
      where event_id=2
      and merchant_id = 34
      and subscription_type <> 'IU Replenishment'
      group by 1,2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: yearlogged {
    type: number
    sql: ${TABLE}.`year(logged)` ;;
  }

  dimension: monthlogged {
    type: number
    sql: ${TABLE}.`month(logged)` ;;
  }

  dimension: created {
    type: number
    sql: ${TABLE}.Created ;;
  }

  dimension: act_rev {
    type: number
    sql: ${TABLE}.Act_Rev ;;
  }

  set: detail {
    fields: [yearlogged, monthlogged, created, act_rev]
  }
}
