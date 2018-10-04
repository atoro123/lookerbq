view: offer_offer {
  sql_table_name: ogv2_production.offer_offer ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created ;;
  }

  dimension: html {
    type: string
    sql: ${TABLE}.html ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: ip_whitelist {
    type: string
    sql: ${TABLE}.ip_whitelist ;;
  }

  dimension: js_name {
    type: string
    sql: ${TABLE}.js_name ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: merchant_coupon_code {
    type: string
    sql: ${TABLE}.merchant_coupon_code ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: module_view_id {
    type: number
    sql: ${TABLE}.module_view_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: offer_profile_id {
    type: number
    sql: ${TABLE}.offer_profile_id ;;
  }

  dimension: offer_type {
    type: number
    sql: ${TABLE}.offer_type ;;
  }

  dimension: ongoing_modifiers {
    type: string
    sql: ${TABLE}.ongoing_modifiers ;;
  }

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: quantity_threshold {
    type: string
    sql: ${TABLE}.quantity_threshold ;;
  }

  dimension: today_modifiers {
    type: string
    sql: ${TABLE}.today_modifiers ;;
  }

  dimension: value_threshold {
    type: string
    sql: ${TABLE}.value_threshold ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, js_name]
  }
}
