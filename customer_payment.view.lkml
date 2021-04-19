view: customer_payment {
  sql_table_name: ogv2_production.customer_payment ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: billing_address_id {
    type: number
    sql: ${TABLE}.billing_address_id ;;
  }

  dimension: cc_exp_date {
    type: string
    sql: ${TABLE}.cc_exp_date ;;
  }

  dimension: cc_holder {
    type: string
    sql: ${TABLE}.cc_holder ;;
  }

  dimension: cc_number {
    type: string
    sql: ${TABLE}.cc_number ;;
  }

  dimension: cc_type {
    type: number
    sql: ${TABLE}.cc_type ;;
  }

  dimension: credit_card {
    type: string
    sql:case when ${cc_type} = 1 then "VISA"
          when ${cc_type} = 2 then "MasterCard"
          when ${cc_type} = 3 then "American Express"
          when ${cc_type} = 4 then "Discover"
          when ${cc_type} = 5 then "Diners"
          when ${cc_type} = 6 then "JCB"
          else "No Assigned Type" end;;
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

  dimension: cycle {
    type: number
    sql: ${TABLE}.cycle ;;
  }

  dimension: cycle_status {
    type: number
    sql: ${TABLE}.cycle_status ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
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

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: token_id {
    type: string
    sql: ${TABLE}.token_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
