view: order_item_log {
  sql_table_name: og_transactions.order_item_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}.event_id ;;
  }

  dimension: feature_id {
    type: number
    sql: ${TABLE}.feature_id ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
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

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: offer_id {
    type: number
    sql: ${TABLE}.offer_id ;;
  }

  dimension: one_time {
    type: yesno
    sql: ${TABLE}.one_time ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
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

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
  }

  dimension: sub_total {
    type: number
    sql: ${TABLE}.sub_total ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  measure: count {
    type: count
    value_format: "0"
    drill_fields: [id]
  }

  measure: Sum_Total_Price {
    type: sum
    value_format_name: usd
    sql: ${total_price} ;;
  }

  measure: Sum_Quantity {
    type: sum
    sql: ${quantity} ;;
  }

  measure: min_date {
    type: date
    sql: min(${logged_date}) ;;
  }

  measure: Distinct_Customers{
    description: "distinct customer count"
    type: count_distinct
    sql: ${customer_id}  ;;
  }

  dimension: vsi_iu_key {
    type: string
    hidden: yes
    sql: concat(${customer_id}, "-", ${order_id}, "-", ${product_id}, "-", ${logged_date}) ;;
  }

  measure: Distinct_Item_Count {
    type: count_distinct
    sql: ${item_id} ;;
  }

  dimension: IU_One_Time {
    type: yesno
    sql: ${vsi_iu_log.key} is null ;;
  }
}
