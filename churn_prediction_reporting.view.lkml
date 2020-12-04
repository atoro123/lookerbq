view: churn_prediction_reporting {
  sql_table_name: `production-202017.looker_scratch.churn_prediction_reporting_static`
    ;;

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension_group: cancel {
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
    sql: ${TABLE}.cancel_date ;;
  }

  dimension: churn_prediction_id {
    type: number
    sql: ${TABLE}.churn_prediction_id ;;
  }

  dimension: confidence_value {
    type: number
    sql: ${TABLE}.confidence_value ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: email_clicked {
    type: number
    sql: ${TABLE}.email_clicked ;;
  }

  dimension_group: email {
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
    sql: ${TABLE}.email_date ;;
  }

  dimension: email_opened {
    type: number
    sql: ${TABLE}.email_opened ;;
  }

  dimension: emailed {
    type: number
    sql: ${TABLE}.emailed ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: model_id {
    type: number
    sql: ${TABLE}.model_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: merchant_public_id {
    type: string
    sql: ${TABLE}.merchant_public_id ;;
  }

  dimension_group: next_order {
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
    sql: ${TABLE}.next_order_date ;;
  }

  dimension: next_order_id {
    type: number
    sql: ${TABLE}.next_order_id ;;
  }

  dimension: next_order_item_id {
    type: number
    sql: ${TABLE}.next_order_item_id ;;
  }

  dimension: order_completed {
    type: number
    sql: ${TABLE}.order_completed ;;
  }

  dimension: order_moved {
    type: number
    sql: ${TABLE}.order_moved ;;
  }

  dimension: order_not_completed {
    type: number
    sql: ${TABLE}.order_not_completed ;;
  }

  dimension: overstock_cancelled {
    type: number
    sql: ${TABLE}.overstock_cancelled ;;
  }

  dimension: percentile_value {
    type: number
    sql: ${TABLE}.percentile_value ;;
  }

  dimension_group: placed {
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
    sql: ${TABLE}.placed ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: sub_cancelled {
    type: number
    sql: ${TABLE}.sub_cancelled ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }

  dimension: over_70 {
    sql: CASE WHEN ${TABLE}.percentile_value > 0.7 THEN 1
      ELSE 0 END ;;
  }

  dimension: cancelled_next_order_item_id {
    type: number
    sql: CASE WHEN ${TABLE}.sub_cancelled = 1 THEN ${TABLE}.next_order_item_id
    ELSE 0 END;;
  }

  dimension: overstock_cancelled_next_order_item_id {
    type: number
    sql: CASE WHEN ${TABLE}.overstock_cancelled = 1 THEN ${TABLE}.next_order_item_id
      ELSE 0 END;;
  }


  dimension: Tier_1{
    type: string
    sql: case when ${emailed} = 1 then "Emailed"  else null end;;
  }

  dimension: Tier_2{
    type: string
    sql: case when ${email_opened} <> 1 then "Not Opened" when  ${email_opened} = 1 then "Opened" else null end;;
  }

  dimension: Tier_3{
    type: string
    sql: case when ${email_opened} <> 1 and (${churn_prediction_reporting.order_moved} = 1 OR ${churn_prediction_reporting.order_not_completed} = 1) then "Not Opened Moved"
    when ${email_opened} <> 1 and ${churn_prediction_reporting.order_completed} = 1 then "Not Opened Success"
    when ${email_opened} <> 1 and ${churn_prediction_reporting.sub_cancelled} = 1 then "Not Opened Cancelled"
    when ${email_opened} = 1 and ${email_clicked} <> 1 then "Opened Not Clicked"
    when ${email_opened} = 1 and ${email_clicked} = 1 then "Opened and Clicked"
    else null end;;
  }

  dimension: Tier_4{
    type: string
    sql: case when ${email_opened} = 1 and ${email_clicked} <> 1 and ${order_completed} = 1 then "Not Clicked Success"
    when ${email_opened} = 1 and ${email_clicked} <> 1 and ${sub_cancelled} = 1 then "Not Clicked Cancelled"
    when ${email_opened} = 1 and ${email_clicked} <> 1 and (${order_moved} = 1 OR ${churn_prediction_reporting.order_not_completed} = 1) then "Not Clicked Moved"
    when ${email_opened} = 1 and ${email_clicked} = 1 and ${sub_cancelled} = 1 then "Clicked Cancelled"
    when ${email_opened} = 1 and ${email_clicked} = 1 and (${order_moved} = 1 OR ${churn_prediction_reporting.order_not_completed} = 1) then "Clicked Moved"
    when ${email_opened} = 1 and ${email_clicked} = 1 and ${order_completed} = 1 then "Clicked Success"

    else null end
    ;;
  }

  measure: count_distinct_items {
    type: count_distinct
    sql: ${next_order_item_id};;
  }

  measure: count_distinct_mpi {
    type: count_distinct
    sql: ${merchant_public_id};;
  }


  measure: count_distinct_cancelled_next_order_item_id {
    type: count_distinct
    sql: ${cancelled_next_order_item_id};;
  }


  measure: sum_overstock_cancelled {
    type: sum
    sql: ${overstock_cancelled} ;;
  }

  measure: count_distinct_overstocked_cancelled {
    type: count_distinct
    sql: ${overstock_cancelled_next_order_item_id};;
  }


  measure: sum_sub_cancelled {
    type: sum
    sql: ${sub_cancelled} ;;
  }

  measure: sum_order_moved {
    type: sum
    sql: ${order_moved} ;;
  }

  measure: sum_order_not_completed {
    type: sum
    sql: ${order_not_completed} ;;
  }

  measure: sum_order_completed {
    type: sum
    sql: ${order_completed} ;;
  }

  measure: sum_over_70 {
    type: sum
    sql: ${over_70} ;;
  }

  measure: sum_email_clicked {
    type: sum
    sql: ${email_clicked} ;;
  }

  measure: sum_email_opened {
    type: sum
    sql: ${email_opened} ;;
  }

  measure: sum_emailed {
    type: sum
    sql: ${emailed} ;;
  }

  measure: min_pred {
    type: min
    sql: ${percentile_value} ;;
  }
}
