view: zen_desk_tickets {
  sql_table_name: `production-202017.ogv2_consumerinsight.zen_desk_tickets`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: admin_reviewed {
    type: string
    sql: ${TABLE}.Admin_Reviewed ;;
  }

  dimension: agent_wait_time_in_minutes {
    type: number
    sql: ${TABLE}.Agent_Wait_Time_In_Minutes ;;
  }

  dimension: agent_wait_time_in_minutes_within_business_hours {
    type: number
    sql: ${TABLE}.Agent_Wait_Time_In_Minutes_Within_Business_Hours ;;
  }

  dimension_group: assigned {
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
    sql: ${TABLE}.Assigned_At ;;
  }

  dimension: assignee_stations {
    type: number
    sql: ${TABLE}.Assignee_Stations ;;
  }

  dimension: assisgnee {
    type: string
    sql: ${TABLE}.Assisgnee ;;
  }

  dimension: client_stage {
    type: string
    sql: ${TABLE}.Client_Stage ;;
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
    sql: ${TABLE}.Created_At ;;
  }

  dimension: documentation_needed {
    type: string
    sql: ${TABLE}.Documentation_Needed ;;
  }

  dimension_group: due {
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
    sql: ${TABLE}.Due_Date ;;
  }

  dimension: ecom_platform {
    type: string
    sql: ${TABLE}.Ecom_Platform ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.Email_Address ;;
  }

  dimension: first_reply_in_minutes {
    type: number
    sql: ${TABLE}.First_Reply_In_Minutes ;;
  }

  dimension: first_resolution_time_in_minutes {
    type: number
    sql: ${TABLE}.First_Resolution_Time_In_Minutes ;;
  }

  dimension: first_resolution_time_in_minutes_within_minutes {
    type: number
    sql: ${TABLE}.First_Resolution_Time_In_Minutes_Within_Minutes ;;
  }

  dimension: first_resolution_time_in_minutes_within_minutes_within_business_hours {
    type: number
    sql: ${TABLE}.First_Resolution_Time_In_Minutes_Within_Minutes_Within_Business_Hours ;;
  }

  dimension: full_resolution_time_in_minutes {
    type: number
    sql: ${TABLE}.Full_Resolution_Time_In_Minutes ;;
  }

  dimension: full_resolution_time_in_minutes_within_business_hours {
    type: number
    sql: ${TABLE}.Full_Resolution_Time_In_Minutes_Within_Business_Hours ;;
  }

  dimension: group {
    type: string
    sql: ${TABLE}.`Group` ;;
  }

  dimension: group_stations {
    type: number
    sql: ${TABLE}.Group_Stations ;;
  }

  dimension_group: initially_assigned {
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
    sql: ${TABLE}.Initially_Assigned_At ;;
  }

  dimension: intiated_by {
    type: string
    sql: ${TABLE}.Intiated_By ;;
  }

  dimension: manually_imported {
    type: string
    sql: ${TABLE}.Manually_Imported ;;
  }

  dimension: merchant {
    type: string
    sql: ${TABLE}.Merchant ;;
  }

  dimension: on_hold_time_in_minutes {
    type: number
    sql: ${TABLE}.On_Hold_Time_In_Minutes ;;
  }

  dimension: on_hold_time_in_minutes_within_business_hours {
    type: number
    sql: ${TABLE}.On_Hold_Time_In_Minutes_Within_Business_Hours ;;
  }

  dimension: organization {
    type: string
    sql: ${TABLE}.Organization ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.Priority ;;
  }

  dimension: product_tags {
    type: string
    sql: ${TABLE}.Product_Tags ;;
  }

  dimension: product_tier {
    type: string
    sql: ${TABLE}.Product_Tier ;;
  }

  dimension: register_wait_time_in_minutes {
    type: number
    sql: ${TABLE}.Register_Wait_Time_In_Minutes ;;
  }

  dimension: register_wait_time_in_minutes_within_business_hours {
    type: number
    sql: ${TABLE}.Register_Wait_Time_In_Minutes_Within_Business_Hours ;;
  }

  dimension: reopens {
    type: number
    sql: ${TABLE}.Reopens ;;
  }

  dimension: replies {
    type: number
    sql: ${TABLE}.Replies ;;
  }

  dimension: requester {
    type: string
    sql: ${TABLE}.Requester ;;
  }

  dimension: requester_domain {
    type: string
    sql: ${TABLE}.Requester_Domain ;;
  }

  dimension: requester_email {
    type: string
    sql: ${TABLE}.Requester_Email ;;
  }

  dimension: requester_external_id {
    type: string
    sql: ${TABLE}.Requester_External_ID ;;
  }

  dimension: requester_id {
    type: number
    sql: ${TABLE}.Requester_ID ;;
  }

  dimension: resolution_time {
    type: number
    sql: ${TABLE}.Resolution_Time ;;
  }

  dimension: satisfaction_score {
    type: string
    sql: ${TABLE}.Satisfaction_Score ;;
  }

  dimension_group: solved {
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
    sql: ${TABLE}.Solved_At ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: sub_issue_type {
    type: string
    sql: ${TABLE}.Sub_Issue_Type ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.Subject ;;
  }

  dimension: submitter {
    type: string
    sql: ${TABLE}.Submitter ;;
  }

  dimension: summation_column {
    type: number
    sql: ${TABLE}.summation_column ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.Tags ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}.Ticket_ID ;;
  }

  dimension: ticket_type {
    type: string
    sql: ${TABLE}.Ticket_Type ;;
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
    sql: ${TABLE}.Updated_At ;;
  }

  dimension: via {
    type: string
    sql: ${TABLE}.Via ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
