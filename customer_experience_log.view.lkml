view: customer_experience_log {
  sql_table_name: og_transactions.customer_experience_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}.enabled ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}.event_id ;;
  }

  dimension: feature_id {
    type: number
    sql: ${TABLE}.feature_id ;;
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
      year,
      day_of_month
    ]
    sql: ${TABLE}.logged ;;
  }

  dimension: merchant_public_id {
    type: string
    sql: ${TABLE}.merchant_public_id ;;
  }

  dimension: merchant_user_id {
    type: string
    sql: ${TABLE}.merchant_user_id ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
  }

  dimension: merchant_id {
    type: number
    sql:  CASE WHEN merchant_public_id = '01f0c9fad4ce11e5a256bc764e106cf4' THEN '145'
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
          else null end
          ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: double_optin {
    type: count_distinct
    sql: case when enabled > 0 AND feature_id = 40 THEN merchant_user_id END ;;
    drill_fields: [logged_date,merchant_user_id]
    description: "Initial enrollment into SMS messaging"
  }
  measure: Enrollments {
    type: count_distinct
    sql: case when enabled > 0 AND feature_id = 39 THEN merchant_user_id END ;;
    drill_fields: [logged_date,merchant_user_id]
    description: "Enrollment confirmed into SMS messaging"
  }

  measure: Unenrollments {
    type: count_distinct
    sql: case when enabled = 0 AND feature_id = 39 THEN merchant_user_id END ;;
   filters: {field:enrolled_customer_experience_log.ever_enrolled
      value:"yes"}
    drill_fields: [logged_date,merchant_user_id]
    description: "Unenrolled from SMS messaging"
  }
}
