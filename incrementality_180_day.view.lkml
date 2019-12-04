view: incrementality_180_day {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: SELECT *,
      CASE
      WHEN spend_pre between 0 and 100 THEN "Not Engaged"
      WHEN spend_pre between 100 and 200 THEN "Mediocre"
      WHEN spend_pre between 200 and 400 THEN "Good"
      WHEN spend_pre between 400 and 600 THEN "Very Good"
      WHEN spend_pre > 600 THEN "Excellent"
      else "NA" end cust_segment
      FROM
      (
      SELECT A.merchant_id, A.customer_id, A.subscriber, A.mid_date, A.did_they_subscribe, reference_date,name, min_date,
      SUM(IF(DATE(logged) BETWEEN DATE_SUB(A.mid_date, INTERVAL 180 DAY) AND A.mid_date, B.quantity, 0)) purchases_pre,
      SUM(IF(DATE(logged) BETWEEN DATE_SUB(A.mid_date, INTERVAL 180 DAY) AND A.mid_date, 1, 0)) transactions_pre,
      SUM(IF(DATE(logged) BETWEEN DATE_SUB(A.mid_date, INTERVAL 180 DAY) AND A.mid_date, B.total, 0)) spend_pre,
      SUM(IF(DATE(logged) BETWEEN A.mid_date AND DATE_ADD(A.mid_date, INTERVAL 180 DAY), B.quantity, 0)) purchases_post,
      SUM(IF(DATE(logged) BETWEEN A.mid_date AND DATE_ADD(A.mid_date, INTERVAL 180 DAY), 1, 0)) transactions_post,
      SUM(IF(DATE(logged) BETWEEN A.mid_date AND DATE_ADD(A.mid_date, INTERVAL 180 DAY), B.total, 0)) spend_post
      FROM
       (SELECT *, IF(subscriber = 1, "Subscriber", "Non-Subscriber") did_they_subscribe
        FROM   (SELECT merchant_id,
                       purchases.customer_id,
                       IF(elligible_sub = 1, 1, 0) subscriber,
                       reference_date,name, min_date,
                       CASE
                         WHEN elligible_sub = 1
                              AND elligible_purchase = 1 THEN subs.signup_date
                         WHEN elligible_purchase = 1
                              AND elligible_sub IS NULL THEN
                         Date_sub(CURRENT_DATE(), INTERVAL 180 day)
                         ELSE NULL
                       end                         mid_date

                FROM   (SELECT merchant_id,
                               customer_id,
                               Min(Date(logged)) first_purchase_date,
                               IF(Min(Date(logged)) <
                                     Date_sub(CURRENT_DATE(),
                                     INTERVAL 180 day), 1, 0
                               )                 elligible_purchase
                        FROM   `production-202017.og_transactions.cart_log`
                        GROUP  BY merchant_id,
                                  customer_id) purchases
                       LEFT JOIN (SELECT customer_id,reference_date, name, min_date,
                                         Min(start_date) signup_date,
                                         IF(Min(start_date) BETWEEN inc_look.reference_date
                                                                    AND
                                            Date_sub(CURRENT_DATE(), INTERVAL 180 day),
                                         1, 0)
                                                         elligible_sub
                                  FROM
                       `production-202017.ogv2_production.subscription_subscription` sub
                                       INNER JOIN
                 `production-202017.looker_scratch.incrementality_lookup` inc_look
                 ON sub.merchant_id = inc_look.merchant_id
                                  GROUP  BY customer_id, inc_look.reference_date, name, min_date ) subs
                              ON purchases.customer_id = subs.customer_id)
        WHERE  mid_date IS NOT NULL) A

      INNER JOIN
      `production-202017.og_transactions.cart_log` B
      ON
      A.customer_id = B.customer_id
      GROUP BY
      A.merchant_id, A.customer_id, A.subscriber, A.mid_date, A.did_they_subscribe, reference_date, name, min_date
      )
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${name} ;;
  }

  measure: avg_order {
    type: average
    sql: ${spend_post} ;;
    value_format_name: usd
  }

  measure: avg_trans {
    type: average
    sql: ${transactions_post} ;;
    value_format_name: decimal_1
  }

  measure: avg_pur {
    type: average
    sql: ${purchases_post} ;;
    value_format_name: decimal_1
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: did_they_subscribe {
    type: string
    sql: ${TABLE}.did_they_subscribe ;;
  }

  dimension: subscriber {
    type: number
    sql: ${TABLE}.subscriber ;;
  }

  dimension: mid_date {
    type: date
    sql: ${TABLE}.mid_date ;;
  }

  dimension: purchases_pre {
    type: number
    sql: ${TABLE}.purchases_pre ;;
  }

  dimension: transactions_pre {
    type: number
    sql: ${TABLE}.transactions_pre ;;
  }

  dimension: spend_pre {
    type: number
    sql: ${TABLE}.spend_pre ;;
  }

  dimension: purchases_post {
    type: number
    sql: ${TABLE}.purchases_post ;;
  }

  dimension: transactions_post {
    type: number
    sql: ${TABLE}.transactions_post ;;
  }

  dimension: spend_post {
    type: number
    sql: ${TABLE}.spend_post ;;
  }

  dimension: cust_segment {
    type: string
    sql: ${TABLE}.cust_segment ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: min_date {
    type: string
    sql: ${TABLE}.min_date ;;
  }

  dimension: reference_date {
    type: string
    sql: ${TABLE}.reference_date ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  set: detail {
    fields: [
      customer_id,
      subscriber,
      mid_date,
      purchases_pre,
      transactions_pre,
      spend_pre,
      purchases_post,
      transactions_post,
      spend_post,
      cust_segment
    ]
  }
}
