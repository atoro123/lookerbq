view: csd_tickets {
  sql_table_name: `production-202017.ogv2_consumerinsight.CSD_Tickets`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: assignee {
    type: string
    sql: ${TABLE}.Assignee ;;
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
    sql: ${TABLE}.Created ;;
  }

  dimension: creator {
    type: string
    sql: ${TABLE}.Creator ;;
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.Issue_Id ;;
  }

  dimension: issue_key {
    type: string
    sql: ${TABLE}.Issue_key ;;
  }

  dimension: issue_type {
    type: string
    sql: ${TABLE}.Issue_Type ;;
  }

  dimension_group: last_viewed {
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
    sql: ${TABLE}.Last_Viewed ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.Parent_Id ;;
  }

  dimension: points {
    type: number
    sql: ${TABLE}.Points ;;
  }

  measure: Total_points {
    type: sum
    sql: ${points} ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.Priority ;;
  }

  dimension: project_description {
    type: string
    sql: ${TABLE}.Project_description ;;
  }

  dimension: project_key {
    type: string
    sql: ${TABLE}.Project_key ;;
  }

  dimension: project_lead {
    type: string
    sql: ${TABLE}.Project_lead ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.Project_name ;;
  }

  dimension: project_type {
    type: string
    sql: ${TABLE}.Project_type ;;
  }

  dimension: project_url {
    type: string
    sql: ${TABLE}.Project_url ;;
  }

  dimension: reporter {
    type: string
    sql: ${TABLE}.Reporter ;;
  }

  dimension: resolution {
    type: string
    sql: ${TABLE}.Resolution ;;
  }

  dimension_group: resolved {
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
    sql: ${TABLE}.Resolved ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.Summary ;;
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
      year,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}.Updated ;;
  }

  measure: count {
    type: count
    drill_fields: [id, project_name]
  }
}
