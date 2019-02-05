view: customer_address {
  sql_table_name: ogv2_production.customer_address ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
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

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: first_name_lowercase {
    type: string
    sql: ${TABLE}.first_name_lowercase ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: last_name_lowercase {
    type: string
    sql: ${TABLE}.last_name_lowercase ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: price_code {
    type: string
    sql: ${TABLE}.price_code ;;
  }

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: state_province_code {
    type: string
    sql: ${TABLE}.state_province_code ;;
  }

  dimension: store_public_id {
    type: string
    sql: ${TABLE}.store_public_id ;;
  }

  dimension: token_id {
    type: string
    sql: ${TABLE}.token_id ;;
  }

  dimension: zip_postal_code {
    type: string
    sql: ${TABLE}.zip_postal_code ;;
  }

  dimension: bopus {
    type: yesno
    sql: ${TABLE}.id = ${order_order.shipping_address_id};;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, company_name]
  }
}
