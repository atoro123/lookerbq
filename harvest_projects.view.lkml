view: harvest_projects {
  sql_table_name: `stitch-poc-306316.harvest.projects`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bill_by {
    type: string
    sql: ${TABLE}.bill_by ;;
  }

  dimension: budget_by {
    type: string
    sql: ${TABLE}.budget_by ;;
  }

  dimension: budget_is_monthly {
    type: yesno
    sql: ${TABLE}.budget_is_monthly ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: cost_budget_include_expenses {
    type: yesno
    sql: ${TABLE}.cost_budget_include_expenses ;;
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

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_billable {
    type: yesno
    sql: ${TABLE}.is_billable ;;
  }

  dimension: is_fixed_fee {
    type: yesno
    sql: ${TABLE}.is_fixed_fee ;;
  }

  dimension: Project_Name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: notify_when_over_budget {
    type: yesno
    sql: ${TABLE}.notify_when_over_budget ;;
  }

  dimension: over_budget_notification_percentage {
    type: number
    sql: ${TABLE}.over_budget_notification_percentage ;;
  }

  dimension: show_budget_to_all {
    type: yesno
    sql: ${TABLE}.show_budget_to_all ;;
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
}
