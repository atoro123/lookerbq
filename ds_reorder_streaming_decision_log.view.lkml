view: ds_reorder_streaming_decision_log {
  sql_table_name: og_transactions.ds_reorder_streaming_decision_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: last_order_quantity {
    type: number
    sql: ${TABLE}.last_order_quantity ;;
  }

  dimension_group: reminder_date {
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
    sql: ${TABLE}.reminder_date ;;
  }

  dimension: purchase_source {
    type: string
    sql: ${TABLE}.purchase_source ;;
  }

  dimension: merchant_user_id {
    type: string
    sql: ${TABLE}.merchant_user_id ;;
  }

  dimension: days_since_last_order {
    type: number
    sql: ${TABLE}.days_since_last_order ;;
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

  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: days_between_orders {
    type: number
    sql: ${TABLE}.days_between_orders ;;
  }

  dimension_group: purchase_logged {
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
    sql: ${TABLE}.purchase_logged ;;
  }

  dimension: remind_today {
    type: number
    sql: ${TABLE}.remind_today ;;
  }

  dimension: external_product_id {
    type: string
    sql: ${TABLE}.external_product_id ;;
  }

  dimension: model_id {
    type: number
    sql: ${TABLE}.model_id ;;
  }

  dimension: live {
    type: number
    sql: ${TABLE}.live ;;
  }

  dimension: merchant_public_id {
    type: string
    sql: ${TABLE}.merchant_public_id ;;
  }

  dimension: purchase_id {
    type: number
    sql: ${TABLE}.purchase_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }


  dimension: merchant_id {
    type: number
    sql:  CASE WHEN ds_reorder_streaming_decision_log.merchant_public_id = '01f0c9fad4ce11e5a256bc764e106cf4' THEN '145'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = '02b43f2e92c411e7bd36bc764e106cf4' THEN '183'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = '7ff1147b39228e8084bfc9b3199cf780' THEN '34'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = '495c17244abe11e7889dbc764e106cf4' THEN '179'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = '0c32eb96edde11e4a938bc764e106cf4' THEN '113'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = '1237a692846411e384a6bc764e106cf4' THEN '77'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = 'a774017c05d711e780a5bc764e106cf4' THEN '169'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = '926859ae6b3411e8af87bc764e1107f2' THEN '206'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = 'e542f9b6f73111e880f2bc764e10b970' THEN '214'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = '03931c165f8911e8afb2bc764e1107f2' THEN '203'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = '67525f8ca4772569c35f326c274cad70' THEN '2'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = 'ac4f7938383a11e89ecbbc764e1107f2' THEN '200'
          WHEN ds_reorder_streaming_decision_log.merchant_public_id = '75f637dc7eaf11e6b517bc764e106cf4' THEN '163'
          else null end
          ;;
  }
}
