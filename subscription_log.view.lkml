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
      day_of_month,
      day_of_week
    ]
    sql: ${TABLE}.logged ;;
  }

  dimension_group: GMT_logged {
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
    sql: date_add(${TABLE}.logged, INTERVAL 4 HOUR) ;;
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
      value:"not 168,
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
3753,
4047,
4098,
4450,
4681,
4683,
4684,
4685,
4686,
4687,
4688,
4689,
4690,
4691,
4692,
4693,
4694,
4695,
4696,
4884,
4885,
4958,
5102,
5173,
5244,
5300,
5395,
5464,
5591,
5594,
5744,
5745,
5746,
5783,
5785,
5864,
2192,
4364,
4514,
5060,
5245,
5288,
5310,
5869,
6013"}
    filters: {
      field: customer_id
      value: "not 25589248, 25654747, 25682404, 25886965"
    }
  }
  measure: Average_subscription_value {
    type: number
    value_format_name: usd
    sql: ${sum_total_price}/${count} ;;
    drill_fields: [logged_date,sum_total_price,count]
  }


 dimension_group: today {
  type: time
  timeframes: [day_of_month, month, month_num, date, raw]
  sql: CURRENT_TIMESTAMP() ;;
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
  value_format_name: usd
  sql: case when ${logged_month} = ${today_month}
         then ((${sum_total_price} / max(${today_day_of_month})) * ${days_in_month}) - ${sum_total_price}
         else null
         end ;;
}

  dimension: In_Store {
    type: yesno
    sql: (${offer_id} in (2309,2547,1881,1883,1674,1675,1676,1678,1914,1924,1926,1919)) or
    (${subscription_subscription.merchant_id} = 393 and ${subscription_subscription.store_id} <> '');;
  }

  dimension: Program {
    type: string
    sql: case when ${offer_id} in (2348,4356,2750,2762) then "illylovers Coffee (Select)"
         when ${offer_id} in (2346,3061,3221,3232,3369,3327,2751,2763) then "illylovers Machine (Select)"
        when ${offer_id} in (3118,3119,3120,3448,3449) then "Health Box"
        when ${offer_id} in (3443,3444,3445,3446,3447) then "Health Box Plus"
        Else "PDP" end;;
  }

  dimension: subscription_value {
    type: number
    sql: ${quantity}*${price} ;;
    value_format_name: usd
    description: "(Price*Quantity) to remove mistaken incentives"
  }

  measure: total_subscription_value {
    type: sum
    sql: ${subscription_value} ;;
    value_format_name: usd
    description: "Only use to remove accidental initial incentives"
  }

  measure: Average_Subscription_Cost {
    type: average
    sql: ${subscription_value} ;;
    value_format_name: usd
    description: "Average Value of price*quantity"
  }

  measure: Total_Quantity {
    type: sum
    sql: ${quantity} ;;
  }

  dimension: bucket_frequency {
    type: tier
    style: interval
    tiers: [0,7,14,28,30,45,60,90,120,150,180,270,365]
    sql: ${frequency_days};;
    value_format: "0"
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
  }

  dimension: source_name {
    type: string
    sql: case when ${source_id} = 12 then 'MSI'
    when ${source_id} = 13 then 'CSA'
    when ${source_id} = 17 then 'Product Feed'
    else 'Other' end;;
  }

  dimension: Brand {
    type: string
    sql: case when ${merchant_id} in (37,43,60,61,202,97,65) then "Loreal"
    when ${merchant_id} in (179,77,199,166,194,193,239) then "Unilever"
    when ${merchant_id} in (108,131,236) then "Newell"
    else ${acv_contract.account_name} end;;
  }
}
