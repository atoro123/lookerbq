view: experience_experiencesetting {
  sql_table_name: experience_service.experience_experiencesetting ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}.enabled ;;
  }

  dimension: experience {
    type: string
    sql: ${TABLE}.experience ;;
  }

  dimension: merchant_public_id {
    type: string
    sql: ${TABLE}.merchant_public_id ;;
  }

  dimension: merchant_user_id {
    type: string
    sql: ${TABLE}.merchant_user_id ;;
  }

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }


  dimension: current_date {
    type: date_month
    sql: CURRENT_DATE() ;;
  }
}
