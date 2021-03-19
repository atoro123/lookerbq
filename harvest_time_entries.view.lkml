view: harvest_time_entries {
  sql_table_name: `stitch-poc-306316.harvest.time_entries`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: billable {
    type: yesno
    sql: ${TABLE}.billable ;;
  }

  dimension: budgeted {
    type: number
    sql: ${TABLE}.budgeted ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: hours {
    type: number
    sql: ${TABLE}.hours ;;
  }

  measure: Work_Cost {
    type: sum
    sql: ${hours}*${harvest_roles.Role_Rate} ;;
    value_format: "$0.00"
  }

  measure: total_hours {
    type: sum
    sql: ${hours} ;;
    value_format: "0.0"
  }

  dimension: is_billed {
    type: yesno
    sql: ${TABLE}.is_billed ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_locked {
    type: yesno
    sql: ${TABLE}.is_locked ;;
  }

  dimension: is_running {
    type: yesno
    sql: ${TABLE}.is_running ;;
  }

  dimension: locked_reason {
    type: string
    sql: ${TABLE}.locked_reason ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension_group: spent {
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
    sql: ${TABLE}.spent_date ;;
  }

  dimension: started_time {
    type: string
    sql: ${TABLE}.started_time ;;
  }

  dimension: task_assignment_id {
    type: number
    sql: ${TABLE}.task_assignment_id ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension_group: timer_started {
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
    sql: ${TABLE}.timer_started_at ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_assignment_id {
    type: number
    sql: ${TABLE}.user_assignment_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
