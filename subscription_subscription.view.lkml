view: subscription_subscription {
  sql_table_name: ogv2_production.subscription_subscription ;;

  dimension: id {
    primary_key: yes
    label: "Subscription ID"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension: cancel_reason_code_id {
    hidden: yes
    type: number
    sql: ${TABLE}.cancel_reason_code_id ;;
  }

  dimension_group: cancelled {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month
    ]
    sql: TIMESTAMP(${TABLE}.cancelled) ;;
  }

  dimension: club_id {
    hidden: yes
    type: number
    sql: ${TABLE}.club_id ;;
  }

  dimension_group: created {
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
      day_of_month,
      hour,
      hour_of_day,
      week_of_year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension_group: GMT_created {
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
    sql: date_add(${TABLE}.created, INTERVAL 4 HOUR) ;;
  }

  dimension_group: GMT_cancelled {
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
    sql: date_add(${TABLE}.cancelled, INTERVAL 4 HOUR) ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  measure: customer_create{
    alias: [cusotmer_create]
    type: count_distinct
    sql: ${customer_id};;

  }

  dimension: customer_rep_id {
    hidden: yes
    type: number
    sql: ${TABLE}.customer_rep_id ;;
  }

  dimension: every {
    type: number
    sql: ${TABLE}.every ;;
  }

  dimension: every_period {
    type: number
    sql: ${TABLE}.every_period ;;
  }

  dimension: extra_data {
    type: string
    sql: ${TABLE}.extra_data ;;
  }

  dimension: frequency_days {
    type: number
    sql: ${TABLE}.frequency_days ;;
  }

  dimension: iteration {
    type: number
    sql: ${TABLE}.iteration ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: merchant_order_id {
    type: string
    sql: ${TABLE}.merchant_order_id ;;
  }

  dimension: offer_id {
    type: number
    sql: ${TABLE}.offer_id ;;
  }

  dimension: payment_id {
    hidden: yes
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: product_attribute_id {
    hidden: yes
    type: number
    sql: ${TABLE}.product_attribute_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: reminder_days {
    type: number
    sql: ${TABLE}.reminder_days ;;
  }

  dimension: sequence {
    hidden: yes
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: session_id {
    hidden: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: shipping_address_id {
    hidden: yes
    type: number
    sql: ${TABLE}.shipping_address_id ;;
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
    sql: TIMESTAMP(${TABLE}.start_date) ;;
  }

  dimension: subscription_type {
    type: string
    sql: ${TABLE}.subscription_type ;;
  }

  dimension_group: updated {
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
    sql: TIMESTAMP(${TABLE}.updated) ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_id,customer_customer.merchant_user_id,id,product_product.name,product_product.sku,frequency_days,clean_cancel,cancelled_date,created_date,24hr_Cancel]
  }
  dimension: clean_cancel {
    sql:
    case
    when substr(${cancel_reason},0,2) = '1|' then 'Other'
    when substr(${cancel_reason},0,2) = '2|' then 'Overstocked'
    when substr(${cancel_reason},0,2) = '3|' then 'No Longer Use'
    when substr(${cancel_reason},0,2) = '4|' then 'Product Change'
    when substr(${cancel_reason},0,2) = '5|' then 'Base Unit Change'
    when substr(${cancel_reason},0,2) = '6|' then 'Buying Product Elsewhere'
    when substr(${cancel_reason},0,2) = '7|' then 'General Issue'
    when substr(${cancel_reason},0,2) = '8|' then 'Too Expensive'
    when substr(${cancel_reason},0,2) = '9|' then 'Price Issue'
    when substr(${cancel_reason},2) = '10' then 'Limited Shopping Choices'
    when substr(${cancel_reason},0,2) = '11' then 'Shipping Price'
    when substr(${cancel_reason},0,2) = '12' then 'Product Perpetually Out of Stock'
    when substr(${cancel_reason},0,2) = '13' then 'Mistake'
    when substr(${cancel_reason},0,2) = '14' then 'Product different from what ordered'
    when substr(${cancel_reason},0,2) = '15' then "Tried and don't like"
    when substr(${cancel_reason},0,2) = '16' then 'Found a better deal'
    when substr(${cancel_reason},0,2) = '17' then 'Understocked'
    when substr(${cancel_reason},0,2) = '18' then 'Payment Issue'
    when substr(${cancel_reason},0,2) = '19' then 'Not enough choice'
    when substr(${cancel_reason},0,2) = '20' then 'Relocating'
    when substr(${cancel_reason},0,2) = '21' then 'Switching to Electric Shaving'
    when (substr(${cancel_reason},0,2) = '22' and ${merchant_id} = 144) then 'Product Change to Another Purina Product'
    when (substr(${cancel_reason},0,2) = '22' and ${merchant_id} = 63) then 'Reorganizing'
    when (substr(${cancel_reason},0,2) = '22' and ${merchant_id} = 155) then 'Product Change to Another PerriconeMD Product'
    when substr(${cancel_reason},0,2) = '22' then 'Product Change'
    when substr(${cancel_reason},0,2) = '23' then 'Pet Passed'
    when substr(${cancel_reason},0,2) = '24' then 'Allergic Reaction to Product'
    when substr(${cancel_reason},0,2) = '25' then 'Online Management Issue'
    when substr(${cancel_reason},0,2) = '26' then 'Issue updating payment'
    when substr(${cancel_reason},0,2) = '27' then 'Reorganizing Subscriptions'
    when substr(${cancel_reason},0,2) = '28' then 'Commitment Subscription period end'
    when substr(${cancel_reason},0,2) = '29' then 'Signed up for the discount'
    when substr(${cancel_reason},0,2) = '30' then 'Signed up for free shipping'
    when substr(${cancel_reason},0,2) = '31' then 'Difficulty managing subscription'
    when substr(${cancel_reason},0,2) = '32' then 'Changed Mind'
    when substr(${cancel_reason},0,2) = '33' then 'No longer want subscription'
    when substr(${cancel_reason},0,2) = '34' then 'Easier to pick up in store'
    when substr(${cancel_reason},0,2) = '35' then 'Want more Choice/Variety'
    when substr(${cancel_reason},0,2) = '36' then 'Doctors Orders'
    when substr(${cancel_reason},0,2) = '37' then 'Fraudulent Account'
    when substr(${cancel_reason},0,2) = '38' then 'Duplicate Item'
    when substr(${cancel_reason},0,2) = '39' then 'Discontinuing'
    when substr(${cancel_reason},0,2) = '40' then 'Too Frequent Orders'
    when substr(${cancel_reason},0,2) = '41' then 'Technical Issues'
    when substr(${cancel_reason},0,2) = '42' then 'Temporary Cancel'
    when substr(${cancel_reason},0,2) = '43' then 'Shipping Error'
    when substr(${cancel_reason},0,2) = '44' then 'One Time Order is Cheaper'
    when substr(${cancel_reason},0,2) = '45' then 'Canceling Due To A Death'
    when substr(${cancel_reason},0,2) = '46' then 'No Results'
    when substr(${cancel_reason},0,2) = '47' then 'Item is Restricted in my State'
    when substr(${cancel_reason},0,2) = '48' then 'Switching to Another Brand'
    when substr(${cancel_reason},0,2) = '49' then 'I Miss The Old Bundle'
    when substr(${cancel_reason},0,2) = '50' then 'Bundle doesnt fit my budget'
    when substr(${cancel_reason},0,2) = '51' then 'Bought as a gift'
    when substr(${cancel_reason},0,2) = '52' then 'I only need one subscription'
    when substr(${cancel_reason},0,2) = '53' then 'My child is potty trained!'
    when substr(${cancel_reason},0,2) = '54' then 'Baby hasnt arrived yet'
    when substr(${cancel_reason},0,2) = '55' then 'Didnt take as often as expected'
    when substr(${cancel_reason},0,2) = '56' then 'Im changing items in my commitment'
    when substr(${cancel_reason},0,4) = 'Item' then 'Item Discontinued'
    when substr(${cancel_reason},0,4) = 'Frau' then 'Fraud'
    when ${cancel_reason} = 'I Have Too Many of this Product.' then 'Overstocked'
    when ${cancel_reason} = 'I No Longer Use this Product.' then 'No Longer Use'
    when ${cancel_reason} = 'Did Not Intend to Join Subscription Program.' then 'Mistake'
    when ${cancel_reason} = 'Subscription Program Too Difficult to Manage.' then 'Online Management Issue'
    when ${cancel_reason} = 'Shipping Cost is Too High.' then 'Shipping Price'
    when ${cancel_reason} = 'I Found This Product Elsewhere.' then 'Buying Product Elsewhere'
    when ${cancel_reason} = 'I Do Not See Value in Subscription Program.' then 'No longer want subscription'
    when substr(${cancel_reason},0, 4) = 'Zomb' then 'Zombie Cancellation'
    when ${cancel_reason} = 'This product is out of stock.' then 'Product Perpetually Out of Stock'
    when ${cancel_reason} = 'I accidentally subscribed to this program.' then 'Mistake'
    when ${cancel_reason} ='The shipping costs of this program are too high.' then 'Shipping Price'
    when substr(${cancel_reason},0,4) = 'Dupl' then 'Duplicate'
    when ${cancel_reason} = 'test' then 'Test'
    when substr(${cancel_reason},0, 9) = 'No longer' then 'No Longer Use'
    when ${cancel_reason} = 'I have too much of this product.' then 'Overstocked'
    when ${cancel_reason} = 'I did not intend to join a subscription program.' then 'Mistake'
    when ${cancel_reason} = 'This product is too expensive.' then 'Too Expensive'
    when ${cancel_reason} = "I'm overstocked." then 'Overstocked'
    when ${cancel_reason} = 'I want to switch products.' then 'Product Change'
    when ${cancel_reason} = "I didn't mean to sign up for Auto Replenishment." then 'Mistake'
    when ${cancel_reason} = "I don't use this product." then 'No Longer Use'
    ELSE 'Other' END
          ;;
          drill_fields: [clean_cancel,cancel_reason,id, created_date, cancelled_date, frequency_days, product_product.name, product_product.sku]
  }

  dimension: bucket_frequency {
    type: tier
    style: interval
    tiers: [0,7,14,28,30,45,60,90,120,150,180,270,365]
    sql: ${frequency_days};;
    value_format: "0"
  }

  dimension: 24hr_Cancel {
    type: yesno
    sql: case when ${cancelled_raw} < TIMESTAMP_ADD(${created_raw}, INTERVAL 24 HOUR) then True else False end ;;
  }

  dimension: created_logic {
    type: number
    sql:  case when ${created_date} = ${customer_facts.created_date} then True else False end ;;
    hidden: yes
  }

  dimension: is_min_created {
    type:  yesno
    sql: ${created_logic} is True ;;
  }

  measure: distinct_customers {
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: Sups_per_Sub {
    type: number
    value_format: "0.00"
    sql: ${count}/${distinct_customers} ;;
    drill_fields: [customer_id,customer_customer.merchant_user_id,count]
  }

  measure: Total_Quantity {
    type: sum
    sql: ${quantity} ;;
  }

  dimension: Subscription_lifetime {
    type: number
    hidden: no
    sql:DATE_DIFF(${cancelled_date},${created_date}, DAY) ;;
  }

  dimension: Lifetime {
    description: "Lifetime of All Subscription"
    type: number
    sql:if(${cancelled_date} is null,DATE_DIFF(CURRENT_DATE(),${created_date}, DAY) , DATE_DIFF(${cancelled_date},${created_date}, DAY)) ;;
  }

  dimension: Bucket_Lifetime {
  type: number
  hidden: no
  sql:  case when ${Subscription_lifetime} <= 30 then '30'
              when ${Subscription_lifetime} <= 60 then '60'
              when ${Subscription_lifetime} <= 90 then '90'
              when ${Subscription_lifetime} <= 180 then '180'
              when ${Subscription_lifetime} <= 365 then '365'
              when ${Subscription_lifetime} > 365 then '366'
              when ${Subscription_lifetime} IS NULL then 'NULL'
              else 'error' end;;
  }

  dimension: In_Store {
    type: yesno
    sql: ${offer_id} in (2309,2547,1881,1883,1674,1675,1676,1678,1914,1924,1926,1919,4115) ;;
  }

  dimension: Program {
    type: string
    sql: case when ${offer_id} in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591) then "illylovers Coffee (Select)"
         when ${offer_id} in (2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495) then "illylovers Machine (Select)"
        when ${offer_id} in (3118,3119,3120,3448,3449) then "Health Box"
        when ${offer_id} in (3443,3444,3445,3446,3447) then "Health Box Plus"
        Else "PDP" end;;
  }

  measure: Average_Frequency {
    type: average
    sql: ${frequency_days} ;;
    value_format: "0.0"
  }

  measure: Average_Lifetime {
    type: average
    sql: ${Subscription_lifetime} ;;
    value_format: "0.0"
  }

  dimension_group: Missed_Order {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
      ]
    sql: date_add(${cancelled_date}, INTERVAL ${frequency_days} DAY) ;;
    drill_fields: [customer_id,customer_customer.merchant_user_id,id,product_product.name,product_product.sku,frequency_days,clean_cancel,cancelled_date,created_date,24hr_Cancel]
  }

  measure: Value {
    type: sum
    sql: (${product_product.price}*${quantity}) ;;
    value_format: "$#,###"
  }

  dimension: Subscription_Value {
    type: number
    description: "quantity * price"
    sql: (${product_product.price}*${quantity}) ;;
    value_format: "$#,###"
  }

  dimension: Bucket_Subscription_Value {
    type: tier
    style: interval
    tiers: [0,15,30,45,75,125]
    sql: ${Subscription_Value} ;;
    value_format: "$0"
  }

  measure: Orders {
    type: count_distinct
    hidden: yes
    sql:  ${order_order.id} ;;
    filters: {
      field: order_order.status
      value: "5"
    }
    value_format: "0"
  }

  measure: AVG_Orders {
    type: number
    sql: ${Orders}/${count} ;;
    value_format: "0.0"
  }

  dimension: store_id {
    type: string
    sql: case when ${merchant_id} = 76 then json_extract_scalar(${extra_data}, '$.store_id')
    when ${merchant_id} = 113 then json_extract_scalar(${extra_data}, '$.store_id')
    when ${merchant_id} = 127 then json_extract_scalar(${extra_data}, '$.store_number')
    when ${merchant_id} = 210 then json_extract_scalar(${extra_data}, '$.store_id[0]') else null end ;;
  }


  dimension: store_associate_id {
    type: number
    sql: case when ${merchant_id} = 76 then json_extract_scalar(${extra_data}, '$.associate_id') else null end;;
  }

  measure: susbcription_price {
    type: sum
    sql: ${product_product.price} ;;
    value_format: "$#,##0.00"
  }

  dimension: New_Existing {
    label: "New"
    type: yesno
    sql:${created_date} = ${customer_facts.created_date};;
  }

  dimension: Guest_User {
    type: yesno
    sql: ${customer_customer.merchant_user_id} is null ;;
  }

  measure: days_in_period {
    type: count_distinct
    sql: ${created_date} ;;
  }

  dimension: dead_import {
    type: yesno
    sql: case when ${live} = 0 and ${cancelled_month} is null then 1 else 0 end ;;
  }

  dimension: current_date {
    type: date_month
    sql: CURDATE() ;;
  }

  dimension: current_week {
    type: date_week
    sql: CURDATE() ;;
  }

  measure:  Merchant_Order_IDs{
    type: count_distinct
    sql: ${merchant_order_id} ;;
  }

  measure: 24_Hour_Cancels {
    type: count_distinct
    hidden: yes
    sql:  ${id} ;;
    filters: {
      field: 24hr_Cancel
      value: "yes"
      }
  }

  dimension: Max_Upcoming_Order {
    type: string
    sql: case when ${live} is TRUE and ${order_order.status}=1 then ${order_order.place_date} end ;;
  }

  measure: 24_Hour_Cancel_Percent {
    type: number
    sql: ${24_Hour_Cancels}/${count} ;;
    value_format: "0.0%"
  }

  measure: Average_Quantity {
    label: "Average Quantity"
    type: average
    sql: ${quantity} ;;
    value_format: "0.00"
  }

  dimension: Days_since_Subscriber_Creation {
    type: number
    sql:DATE_DIFF( ${created_date},${customer_facts.created_date},day);;
  }

  measure: Subscriptions_Added_on_Subscriber_Created{
    type: count_distinct
    sql: case when ${is_min_created} = TRUE then ${id} else null end ;;
  }

  dimension: Months_Since_Subscriber_Creation {
    type: number
    hidden: yes
    sql: ${Days_since_Subscriber_Creation}/30.5 ;;
  }

  dimension: Months_Since_Subsc_Creation_Bucket {
    type: tier
    style: interval
    tiers: [0,6,12,18,24]
    sql: ${Months_Since_Subscriber_Creation} ;;
    value_format: "0"
  }

  measure: Subscriptions_Added_after_Subscriber_Created{
    type: count_distinct
    sql: case when ${is_min_created} = false then ${id} else null end ;;
  }

  measure: Avg_Days_Added_after_Subscriber_Created{
    type: average
    sql: case when ${is_min_created} = FALSE then ${Days_since_Subscriber_Creation} else null end ;;
    value_format: "0"
  }

  measure: Live_Subscriptions_Count {
    type: count_distinct
    sql: case when ${live} is TRUE then ${id} else null end ;;
  }

  dimension: marketing_program_name {
    type: number
    sql: case when ${merchant_id} = 94 then 119
    when ${merchant_id} = 76 then 465 else null end;;
    description: "P&G Marketing ID"
    group_label: "P&G Specfic"
  }

  dimension: data_source_number {
    type: string
    sql: case when ${merchant_id} = 94 then 10618
    when ${merchant_id} = 76 then 11679 else null end;;
    description: "P&G Data Source ID"
    group_label: "P&G Specfic"
  }

  measure: distinct_Frequencies{
    type: count_distinct
    sql: ${frequency_days} ;;
  }

  measure: distinct_Created_dates{
    type: count_distinct
    sql: ${created_date} ;;
  }

  measure: distinct_subscriptions{
    type: count_distinct
    sql: ${id} ;;
  }

  measure: Min_created_Date {
    type: date
    sql: min(${created_date});;
  }

#
#   dimension: current_date {
#     type: date_month
#     sql: CURDATE() ;;
#   }

#  measure: order_result_str {
#    type: string
#    sql: group_concat(${order_order.status});;
#  }
}
