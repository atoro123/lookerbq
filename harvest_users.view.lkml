view: harvest_users {
  sql_table_name: `stitch-poc-306316.harvest.users`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: avatar_url {
    type: string
    sql: ${TABLE}.avatar_url ;;
  }

  dimension: can_create_invoices {
    type: yesno
    sql: ${TABLE}.can_create_invoices ;;
  }

  dimension: can_create_projects {
    type: yesno
    sql: ${TABLE}.can_create_projects ;;
  }

  dimension: can_see_rates {
    type: yesno
    sql: ${TABLE}.can_see_rates ;;
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
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: has_access_to_all_future_projects {
    type: yesno
    sql: ${TABLE}.has_access_to_all_future_projects ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_admin {
    type: yesno
    sql: ${TABLE}.is_admin ;;
  }

  dimension: is_contractor {
    type: yesno
    sql: ${TABLE}.is_contractor ;;
  }

  dimension: is_project_manager {
    type: yesno
    sql: ${TABLE}.is_project_manager ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: telephone {
    type: string
    sql: ${TABLE}.telephone ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
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

  dimension: weekly_capacity {
    type: number
    sql: ${TABLE}.weekly_capacity ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      user_projects.count,
      user_project_tasks.count,
      project_users.count,
      user_roles.count
    ]
  }
}
