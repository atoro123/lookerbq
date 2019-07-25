view: sms_mgmt_enrolled {derived_table: {
    sql_trigger_value: select current_date ;;
    sql: SELECT cel.merchant_user_id as merchant_user_id_test
                                       FROM customer_experience_log cel
                                       WHERE (cel.enabled = 1
                                         AND cel.feature_id = 38) group by 1;;
#indexes: ["merchant_user_id_test"]
  }
  dimension: merchant_user_id_test {
    type: string
    sql: ${TABLE}.merchant_user_id_test ;;
  }

  dimension: ever_enrolled {
    type: yesno
    view_label: "Ever Enrolled SMS MGMT"
    sql: case when ${merchant_user_id_test} is not null then 1 else 0 end ;;
  }
}
