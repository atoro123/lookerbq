view: zendesk_tickets {
    sql_table_name: `production-202017.ogv2_consumerinsight.zendesk_tickets`
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

    dimension: agent_wait_time {
      type: number
      sql: ${TABLE}.Agent_Wait_Time ;;
    }

    dimension: agent_wait_time_business_hours {
      type: number
      sql: ${TABLE}.Agent_Wait_Time_Business_Hours ;;
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

    dimension: assignee {
      type: string
      sql: ${TABLE}.Assignee ;;
    }

    dimension: assignee_stations {
      type: number
      sql: ${TABLE}.Assignee_Stations ;;
    }

    dimension: client_stage {
      type: string
      sql: ${TABLE}.Client_Stage ;;
    }

    dimension_group: created_a_t {
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
      sql: ${TABLE}.Created_A_t ;;
    }

    dimension: does_documentation_exist {
      type: string
      sql: ${TABLE}.Does_Documentation_Exist ;;
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

    dimension: ecomm_platform {
      type: string
      sql: ${TABLE}.Ecomm_Platform ;;
    }

    dimension: email_address {
      type: string
      sql: ${TABLE}.Email_Address ;;
    }

    dimension: first_reply_time_in_minutes {
      type: number
      sql: ${TABLE}.First_Reply_Time_In_Minutes ;;
    }

    dimension: first_resolution_time_business_hours {
      type: number
      sql: ${TABLE}.First_Resolution_Time_Business_Hours ;;
    }

    dimension: first_resolution_time_minutes {
      type: number
      sql: ${TABLE}.First_Resolution_Time_Minutes ;;
    }

    dimension: first_time_reply_business_hours {
      type: number
      sql: ${TABLE}.First_Time_Reply_Business_Hours ;;
    }

    dimension: full_resolution_time_business_hours {
      type: number
      sql: ${TABLE}.Full_Resolution_Time_Business_Hours ;;
    }

    dimension: full_resolution_time_minutes {
      type: number
      sql: ${TABLE}.Full_Resolution_Time_Minutes ;;
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

    dimension: on_hold_time {
      type: number
      sql: ${TABLE}.On_Hold_Time ;;
    }

    dimension: on_hold_time_business_hours {
      type: number
      sql: ${TABLE}.On_Hold_Time_Business_Hours ;;
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

    dimension: requester_wait_time {
      type: number
      sql: ${TABLE}.Requester_Wait_Time ;;
    }

    dimension: requester_wait_time_business_hours {
      type: number
      sql: ${TABLE}.Requester_Wait_Time_Business_Hours ;;
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

    dimension: tags {
      type: string
      sql: ${TABLE}.Tags ;;
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

    measure: ticket_count {
      type: count
      sql: ${id} ;;
    }
  }
