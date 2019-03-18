view: subscription_log {
  sql_table_name: og_transactions.subscription_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension: cancel_reason_code {
    type: number
    sql: ${TABLE}.cancel_reason_code ;;
  }

  dimension: cancel_reason_detail {
    type: string
    sql: ${TABLE}.cancel_reason_detail ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}.event_id ;;
  }

  dimension: every {
    type: number
    sql: ${TABLE}.every ;;
  }

  dimension: every_period {
    type: number
    sql: ${TABLE}.every_period ;;
  }

  dimension: feature_id {
    type: number
    sql: ${TABLE}.feature_id ;;
  }

  dimension: frequency_days {
    type: number
    sql: ${TABLE}.frequency_days ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension_group: logged {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_month
    ]
    sql: ${TABLE}.logged ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: offer_id {
    type: number
    sql: ${TABLE}.offer_id ;;
  }

  dimension: offer_profile_id {
    type: number
    sql: ${TABLE}.offer_profile_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: product_attribute_id {
    type: number
    sql: ${TABLE}.product_attribute_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: reminder_days {
    type: number
    sql: ${TABLE}.reminder_days ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: subscription_type {
    type: string
    sql: ${TABLE}.subscription_type ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: sum_total_price {
    type: sum
    label: "Total Activation"
    value_format_name: usd
    sql: ${total_price} ;;
    filters: {field:offer_id
      value:"not 3753, 168,
177,
178,
179,
274,
315,
317,
318,
323,
340,
354,
373,
381,
398,
409,
510,
531,
532,
533,
534,
535,
536,
537,
538,
539,
540,
606,
651,
652,
721,
761,
785,
786,
969,
1183,
1188,
1214,
1688,
1991,
2141,
2246,
2300,
2374,
2379,
2498,
2766,
2771,
2909,
3458,
4047"}
  }
  measure: Average_subscription_value {
    type: number
    value_format_name: usd
    sql: ${sum_total_price}/${count} ;;
    drill_fields: [logged_date,sum_total_price,count]
  }


 dimension_group: today {
  type: time
  hidden: yes
  timeframes: [day_of_month, month, month_num, date, raw]
  sql: current_date ;;
}

dimension: days_in_month {
  hidden: yes
  type: number
  sql:  CASE
          WHEN ${today_month_num} IN (4,6,9,11) THEN 30
          WHEN ${today_month_num} = 2 THEN 28
          ELSE 31
          END ;;
}

measure: total_activation_revenue_forecast_this_month {
  required_fields: [logged_month]
  label: "Sales Forecast This Month"
  type: number
  value_format_name: "usd_0"
  sql: case when ${logged_month} = ${today_month}
         then ((sum(${total_price}) / max(${today_day_of_month})) * ${days_in_month}) - sum(${total_price})
         else null
         end ;;
}

  dimension: In_Store {
    type: yesno
    sql: ${offer_id} in (2309,2547,1881,1883,1674,1675,1676,1678,1914,1924,1926,1919) ;;
  }
}
