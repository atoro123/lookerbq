view: cart_log {
  sql_table_name: og_transactions.cart_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: autoship_eligible {
    type: yesno
    sql: ${TABLE}.autoship_eligible ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: discounted_price {
    type: number
    sql: ${TABLE}.discounted_price ;;
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

  dimension: external_product_id {
    type: string
    sql: ${TABLE}.external_product_id ;;
  }

  dimension: feature_id {
    type: number
    sql: ${TABLE}.feature_id ;;
  }

  dimension: feed_price {
    type: number
    sql: ${TABLE}.feed_price ;;
  }

  dimension: frequency_days {
    type: number
    sql: ${TABLE}.frequency_days ;;
  }

  dimension: in_stock {
    type: yesno
    sql: ${TABLE}.in_stock ;;
  }

  dimension_group: logged {
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
      quarter,
      year
    ]
    sql: DATE_ADD(TIMESTAMP(${TABLE}.logged), INTERVAL 5 HOUR) ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: merchant_order_id {
    type: string
    sql: ${TABLE}.merchant_order_id ;;
  }

  dimension: merchant_user_id {
    type: string
    sql: ${TABLE}.merchant_user_id ;;
  }

  dimension: merchant_store_id {
    type: string
    sql: ${TABLE}.merchant_store_id ;;
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

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: subscription_count {
    type: count
    drill_fields: [id]
    sql: if(${autoship_eligible} = True and ${offer_id} not NULL and ${subscription_id} NOT NULL and ${total} <> 0, ${id}, NULL) ;;
  }

  measure: subscription_eligible_count {
    type: count
    drill_fields: [id]
    sql: if(${autoship_eligible} = True and ${total} <> 0,${id},NULL) ;;
  }

  measure: Order_Item_Total {
    type: sum
    value_format_name: usd
    sql: ${total} ;;
  }

  measure: average_subscription_value {
    type: number
    value_format_name: usd
    sql: ${Order_Item_Total}/${count} ;;
    drill_fields: [customer_id,subscription_id, offer_id,logged_date,external_product_id,quantity,price, total,]
  }

  measure: total_merchant_revenue {
    type: sum
    sql: ${total} ;;
    value_format: "$#,##0.00"
  }

  measure: Average_Item_Total {
    type: average
    sql: ${total} ;;
    value_format: "$0.00"
  }

  measure: Session_Count {
    type: count_distinct
    sql: ${session_id} ;;
  }

  dimension: mixed_cart {
    type: yesno
    sql: ${cart_log_mixed.session} is not null ;;
  }

  dimension: non_subscription_cart {
    type: yesno
    sql: ${cart_log_no_subscription.session_id} is not null ;;
  }

  dimension: Ever_A_Subscriber {
    label: "Is/Was a Subscriber"
    type: yesno
    sql: ${Customer_Subscription.customer_id} is not null;;
  }

  measure: Average_Cart_Total {
    type: number
    value_format_name: usd
    sql: ${total_merchant_revenue}/${Session_Count} ;;
  }

  measure: Average_Items_In_Cart {
    type: number
    sql: ${count}/${Session_Count} ;;
  }

  measure: Distinct_Customers {
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: Distinct_Merchant_Users {
    type: count_distinct
    sql: ${merchant_user_id} ;;
  }

  measure: Average_Item_Quantity {
    type: average
    sql: ${quantity} ;;
  }

  dimension: Previous_Subscriber {
    type: yesno
    sql: ${customer_facts.created_date} < ${logged_date} ;;
  }

  dimension: Recurring_Order {
    type: yesno
    sql: ${merchant_order_id} = ${order_order.order_merchant_id} ;;
  }

  dimension: TSC_Ordering_Offers {
    description: "Filter allows you to select either BOPIS or Ship to Home (STH)"
    type: string
    sql: case when ${offer_id} in (5700,5763) then "BOPIS"
      when ${offer_id} in (5701, 5761, 5762) then "STH" end;;
  }
}
