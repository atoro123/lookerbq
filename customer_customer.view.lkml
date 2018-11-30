view: customer_customer {
  sql_table_name: ogv2_production.customer_customer ;;

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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_lowercase {
    type: string
    sql: ${TABLE}.email_lowercase ;;
  }

  dimension: extra_data {
    type: string
    sql: ${TABLE}.extra_data ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: full_name {
    type: string
    sql: concat(${first_name} , ' ' ,  ${last_name}) ;;
  }
  dimension: first_name_lowercase {
    type: string
    sql: ${TABLE}.first_name_lowercase ;;
  }

  dimension: last_ip {
    type: string
    sql: ${TABLE}.last_ip ;;
  }

  dimension_group: last_login {
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
    sql: ${TABLE}.last_login ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: last_name_lowercase {
    type: string
    sql: ${TABLE}.last_name_lowercase ;;
  }

  dimension_group: last_updated {
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
    sql: ${TABLE}.last_updated ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: locale {
    type: number
    sql: ${TABLE}.locale ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: merchant_user_id {
    type: string
    sql: ${TABLE}.merchant_user_id ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: phone_type {
    type: number
    sql: ${TABLE}.phone_type ;;
  }

  dimension: price_code {
    type: string
    sql: ${TABLE}.price_code ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: user_token_id {
    type: string
    sql: ${TABLE}.user_token_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name]
  }
}
