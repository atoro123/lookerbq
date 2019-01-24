view: reorder_on_time_rate {
  derived_table: {
    sql: SELECT model_id, reminder_date AS prediction_date,
       COUNT(*) AS predictions,
       SUM(CASE WHEN (outcome_type IN ('responded yes', 'external_purchase') AND ABS(DATEDIFF(reminder_date, logged)) <= 7) THEN (1) ELSE (0) END) AS on_time_predictions,
       SUM(CASE WHEN (outcome_type IN ('responded yes', 'external_purchase') AND ABS(DATEDIFF(reminder_date, logged)) <= 7) THEN (1) ELSE (0) END)/COUNT(*) AS on_time_rate,
       (CASE WHEN merchant_public_id = '01f0c9fad4ce11e5a256bc764e106cf4' THEN '145'
             WHEN merchant_public_id = '02b43f2e92c411e7bd36bc764e106cf4' THEN '183'
             WHEN merchant_public_id = '7ff1147b39228e8084bfc9b3199cf780' THEN '34'
             WHEN merchant_public_id = '495c17244abe11e7889dbc764e106cf4' THEN '179'
             WHEN merchant_public_id = '0c32eb96edde11e4a938bc764e106cf4' THEN '113'
             WHEN merchant_public_id = '1237a692846411e384a6bc764e106cf4' THEN '77'
             WHEN merchant_public_id = 'a774017c05d711e780a5bc764e106cf4' THEN '169'
             WHEN merchant_public_id = '926859ae6b3411e8af87bc764e1107f2' THEN '206'
             WHEN merchant_public_id = 'e542f9b6f73111e880f2bc764e10b970' THEN '214'
             WHEN merchant_public_id = '03931c165f8911e8afb2bc764e1107f2' THEN '203'
             WHEN merchant_public_id = '67525f8ca4772569c35f326c274cad70' THEN '2'
             WHEN merchant_public_id = 'ac4f7938383a11e89ecbbc764e1107f2' THEN '200'
             WHEN merchant_public_id = '75f637dc7eaf11e6b517bc764e106cf4' THEN '163'
          else null end) AS merchant_id
FROM (
    SELECT decisions.decision_id, outcomes.outcome_type, decisions.model_id, decisions.reminder_date, outcomes.logged, decisions.merchant_public_id
    FROM (SELECT decision_id, outcome_type, logged
            FROM ds_reorder_outcomes_log
            WHERE outcome_type IN ('responded yes', 'external_purchase')) outcomes
    RIGHT JOIN (
        SELECT id AS decision_id, model_id, reminder_date, merchant_public_id
        FROM ds_reorder_streaming_decision_log
        WHERE reminder_date < CURDATE()) decisions
    ON outcomes.decision_id = decisions.decision_id) raw_data
WHERE reminder_date BETWEEN (CURDATE() - INTERVAL 90 DAY) AND (CURDATE() - INTERVAL 7 DAY)
GROUP BY merchant_id, model_id, reminder_date;;
  }

  dimension: merchant_id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: prediction_date {
    type: date
    hidden: yes
    sql: ${TABLE}.prediction_date ;;
  }

  dimension: model_id {
    type: number
    hidden: yes
    sql: ${TABLE}.model_id ;;
  }

  dimension: predictions {
    type: number
    hidden: yes
    sql: ${TABLE}.predictions ;;
  }

  dimension: on_time_predictions {
    type: number
    hidden: yes
    sql: ${TABLE}.on_time_predictions ;;
  }

  dimension: on_time_rate {
    type: number
    hidden: yes
    sql: ${TABLE}.on_time_rate ;;
  }
}
