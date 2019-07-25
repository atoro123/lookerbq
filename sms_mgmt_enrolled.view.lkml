view: sms_mgmt_enrolled {derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24)) ;;
    sql: SELECT cel.merchant_user_id as merchant_user_id_test
                                       FROM og_transactions.customer_experience_log cel
                                       WHERE (enabled is TRUE
                                         AND feature_id = 38) group by 1;;
                                        #indexes: ["merchant_user_id_test"]
                                        }
  dimension: merchant_user_id_test {
    type: string
    sql: ${TABLE}.merchant_user_id_test ;;
  }

  dimension: ever_enrolled {
    type: yesno
    view_label: "Ever Enrolled SMS MGMT"
    sql: case when ${merchant_user_id_test} is not null then TRUE else FALSE end ;;
  }
}
