view: customer_customer {
  sql_table_name: ogv2_production.customer_customer ;;

  dimension: id {
    primary_key: yes
    label: "Customer ID"
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
    hidden: yes
    sql: ${TABLE}.email ;;
  }

  dimension: email_lowercase {
    type: string
    hidden: yes
    sql: ${TABLE}.email_lowercase ;;
  }

  dimension: extra_data {
    hidden: yes
    type: string
    sql: ${TABLE}.extra_data ;;
  }

  dimension: first_name {
    type: string
    hidden: yes
    sql: ${TABLE}.first_name ;;
  }

  dimension: full_name {
    type: string
    hidden: yes
    sql: concat(${first_name} , ' ' ,  ${last_name}) ;;
  }
  dimension: first_name_lowercase {
    type: string
    hidden: yes
    sql: ${TABLE}.first_name_lowercase ;;
  }

  dimension: last_ip {
    type: string
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.last_name ;;
  }

  dimension: last_name_lowercase {
    type: string
    hidden: yes
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
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.password ;;
  }

  dimension: phone_number {
    type: string
    hidden: yes
    sql: ${TABLE}.phone_number ;;
  }

  dimension: phone_type {
    type: number
    hidden: yes
    sql: ${TABLE}.phone_type ;;
  }

  dimension: price_code {
    type: string
    hidden: yes
    sql: ${TABLE}.price_code ;;
  }

  dimension: session_id {
    hidden: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: user_token_id {
    type: string
    hidden: yes
    sql: ${TABLE}.user_token_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: Active_Subscriptions {
    type: count_distinct
    label: "Active Subscription Count"
    sql: ${subscription_subscription.id} ;;
    filters: {
      field: subscription_subscription.live
      value: "1"
    }
  }

  measure: Inactive_Subscriptions {
    type: count_distinct
    label: "Inactive Subscription Count"
    sql: ${subscription_subscription.id} ;;
    filters: {
      field: subscription_subscription.live
      value: "0"
    }
  }

  measure: Average_Frequency {
    type: average
    sql: ${subscription_subscription.frequency_days} ;;
  }

  dimension: Took_Action {
    type: yesno
    sql: ${event_log.customer_id} is not null ;;
  }

  measure: Orders_completed_before {
    description: "Number of orders in purchase post log that happened before initial subscription date"
    type: count_distinct
    sql:  case when ${cart_log.logged_date} < ${customer_facts.created_date} then ${cart_log.session_id} else null end;;
  }

  measure: Orders_completed_after {
    description: "Number of orders in purchase post log that happened after final subscription cancel date"
    type: count_distinct
    sql:  case when (${cart_log.logged_date} > ${customer_facts.Cancelled_date} and ${customer_facts.Customer_Live} = FALSE) then ${cart_log.session_id} else null end;;
  }

  measure: Orders_completed_during {
    description: "Number of orders in purchase post log that happened after initial subscription date but before final cancel"
    type: count_distinct
    sql:  case when ${cart_log.logged_date} >= ${customer_facts.created_date} and ${cart_log.logged_date} <= ${customer_facts.Cancelled_date} and ${customer_facts.Customer_Live} = FALSE then ${cart_log.session_id} when ${cart_log.logged_date} > ${customer_facts.created_date} and ${customer_facts.Customer_Live} = TRUE then ${cart_log.session_id} else null end;;
  }

  measure: Orders_completed_before_revenue {
    description: "Total Price of orders in purchase post log that happened before initial subscription date"
    type: sum
    sql:  case when ${cart_log.logged_date} < ${customer_facts.created_date} then ${cart_log.total} else 0 end;;
    value_format: "$0.00"
  }

  measure: Orders_completed_after_revenue {
    description: "Total Price of orders in purchase post log that happened after final subscription cancel date"
    type: sum
    sql:  case when ${cart_log.logged_date} > ${customer_facts.Cancelled_date} and ${customer_facts.Customer_Live} = FALSE then ${cart_log.total} else 0 end;;
    value_format: "$0.00"
  }

  measure: Orders_completed_during_revenue {
    description: "Total Price of orders in purchase post log that happened after initial subscription date but before final cancel"
    type: sum
    sql:  case  when ${cart_log.logged_date} >= ${customer_facts.created_date} and ${cart_log.logged_date} <= ${customer_facts.Cancelled_date} and ${customer_facts.Customer_Live} = FALSE then ${cart_log.total}
                when ${cart_log.logged_date} >= ${customer_facts.created_date} and ${customer_facts.Customer_Live} = TRUE then ${cart_log.total}
                else 0
              end;;
    value_format: "$#,##0.00"
  }

  dimension: time_to_subscribe {
    type: number
    sql:DATE_DIFF(${customer_facts.created_date},${created_date}, DAY) ;;
  }

  measure: average_time_to_subscribe {
    type: average
    sql: ${time_to_subscribe} ;;
    value_format: "0.0"}
}
