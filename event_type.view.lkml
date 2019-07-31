view: event_type {
  sql_table_name: ogv2_production.event_type ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: application {
    type: number
    sql: ${TABLE}.application ;;
  }

  dimension: instant_email {
    type: yesno
    sql: ${TABLE}.instant_email ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: og_id {
    type: number
    sql: ${TABLE}.og_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
