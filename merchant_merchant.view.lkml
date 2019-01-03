view: merchant_merchant {
  sql_table_name: ogv2_production.merchant_merchant ;;

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

  dimension: email_tokens {
    type: string
    hidden: yes
    sql: ${TABLE}.email_tokens ;;
  }

  dimension: hash_key {
    type: string
    hidden: yes
    sql: ${TABLE}.hash_key ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: program_name {
    type: string
    sql: ${TABLE}.program_name ;;
  }

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: schema {
    hidden: yes
    type: string
    sql: ${TABLE}.`schema` ;;
  }

  dimension: settings {
    type: string
    hidden: yes
    sql: ${TABLE}.settings ;;
  }

  dimension: settings_version {
    type: number
    hidden: yes
    sql: ${TABLE}.settings_version ;;
  }

  measure: count {
    type: count
    drill_fields: [id, program_name, name]
  }
}
