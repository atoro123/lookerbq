view: offer_log {
  sql_table_name: og_transactions.offer_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: displayed {
    type: yesno
    sql: ${TABLE}.displayed ;;
  }

  dimension: extra_data {
    type: string
    sql: ${TABLE}.extra_data ;;
  }

  dimension: log_offer_type {
    type: number
    sql: ${TABLE}.log_offer_type ;;
  }

  dimension_group: logged {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.logged ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: module {
    type: string
    sql: ${TABLE}.module ;;
  }

  dimension: offer_id {
    type: number
    sql: ${TABLE}.offer_id ;;
  }

  dimension: offer_profile_id {
    type: number
    sql: ${TABLE}.offer_profile_id ;;
  }

  dimension: offer_profile_request_specific {
    type: yesno
    sql: ${TABLE}.offer_profile_request_specific ;;
  }

  dimension: offer_profile_specific_products {
    type: yesno
    sql: ${TABLE}.offer_profile_specific_products ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: user_ip {
    type: string
    sql: ${TABLE}.user_ip ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
