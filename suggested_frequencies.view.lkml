view: suggested_frequencies {
  sql_table_name: `production-202017.looker_scratch.suggested_frequencies`
    ;;

  dimension: avg_orders_recieved_most_common_freq {
    type: number
    sql: ${TABLE}.avg_orders_recieved_most_common_freq ;;
  }

  dimension: avg_orders_recieved_second_most_common_freq {
    type: number
    sql: ${TABLE}.avg_orders_recieved_second_most_common_freq ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: most_common_frequency_days {
    type: number
    sql: ${TABLE}.most_common_frequency_days ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ng_avg_orders_recieved_most_common_freq {
    type: number
    sql: ${TABLE}.ng_avg_orders_recieved_most_common_freq ;;
  }

  dimension: ng_avg_orders_recieved_second_most_common_freq {
    type: number
    sql: ${TABLE}.ng_avg_orders_recieved_second_most_common_freq ;;
  }

  dimension: prec_most_common {
    type: number
    sql: ${TABLE}.prec_most_common ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: rec_days {
    type: number
    sql: ${TABLE}.rec_days ;;
  }

  dimension: sec_most_common_frequency_days {
    type: number
    sql: ${TABLE}.sec_most_common_frequency_days ;;
  }

  dimension: sec_prec_most_common {
    type: number
    sql: ${TABLE}.sec_prec_most_common ;;
  }

  dimension: total_subs {
    type: number
    sql: ${TABLE}.total_subs ;;
  }

  dimension: rec_change_strength {
    type: number
    sql: ${TABLE}.rec_change_strength ;;
  }

  dimension: rec_change_reason {
    type: string
    sql: ${TABLE}.rec_change_reason ;;
  }

  dimension: rec_value {
    type: number
    sql: ${TABLE}.rec_value ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
