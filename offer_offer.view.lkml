view: offer_offer {
  sql_table_name: ogv2_production.offer_offer ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    label: "Offer ID"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: offer_created {
    alias: [created]
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
    hidden: yes
    type: string
    sql: ${TABLE}.html ;;
  }

  dimension: ip {
    type: string
    hidden: yes
    sql: ${TABLE}.ip ;;
  }

  dimension: ip_whitelist {
    type: string
    hidden: yes
    sql: ${TABLE}.ip_whitelist ;;
  }

  dimension: js_name {
    type: string
    hidden: yes
    sql: ${TABLE}.js_name ;;
  }

  dimension: offer_live {
    group_label: "Offer"
    type: yesno
    alias: [live]
    sql: ${TABLE}.live ;;
  }

  dimension: merchant_coupon_code {
    group_label: "Offer"
    type: string
    sql: ${TABLE}.merchant_coupon_code ;;
  }

  dimension: merchant_id {
    hidden: yes
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: module_view_id {
    hidden: yes
    type: number
    sql: ${TABLE}.module_view_id ;;
  }

  dimension: offer_name {
    group_label: "Offer"
    type: string
    alias: [name]
    sql: ${TABLE}.name ;;
  }

  dimension: offer_profile_id {
    group_label: "Offer"
    type: number
    sql: ${TABLE}.offer_profile_id ;;
  }

  dimension: offer_type {
    group_label: "Offer"
    type: number
    sql: ${TABLE}.offer_type ;;
  }

  dimension: ongoing_modifiers {
    hidden: yes
    type: string
    sql: ${TABLE}.ongoing_modifiers ;;
  }

  dimension: offer_public_id {
    group_label: "Offer"
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: quantity_threshold {
    hidden: yes
    type: string
    sql: ${TABLE}.quantity_threshold ;;
  }

  dimension: today_modifiers {
    hidden: yes
    type: string
    sql: ${TABLE}.today_modifiers ;;
  }

  dimension: value_threshold {
    hidden: yes
    type: string
    sql: ${TABLE}.value_threshold ;;
  }

  dimension: weight {
    hidden: yes
    type: number
    sql: ${TABLE}.weight ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [id, offer_name]
  }

  dimension: is_IU {
    type: yesno
    description: "Identify an order item as an Impulse Upsell item"
    sql:  ${offer_name} LIKE '%IU%'
          or ${offer_name} LIKE '%Impulse Upsell%'
          or ${offer_type} IN (12,13,14,19,20,23)
          or ${subscription_subscription.subscription_type} = 'IU Replenishment';;

    }
}
