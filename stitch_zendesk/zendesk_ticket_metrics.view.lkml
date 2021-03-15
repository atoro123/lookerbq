view: ticket_metrics {
  sql_table_name: `stitch-poc-306316.zendesk.ticket_metrics`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: agent_wait_time_in_minutes__business {
    type: number
    sql: ${TABLE}.agent_wait_time_in_minutes.business ;;
    group_label: "Agent Wait Time In Minutes"
    group_item_label: "Business"
  }

  dimension: agent_wait_time_in_minutes__calendar {
    type: number
    sql: ${TABLE}.agent_wait_time_in_minutes.calendar ;;
    group_label: "Agent Wait Time In Minutes"
    group_item_label: "Calendar"
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
    sql: ${TABLE}.assigned_at ;;
  }

  dimension: assignee_stations {
    type: number
    sql: ${TABLE}.assignee_stations ;;
  }

  dimension_group: assignee_updated {
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
    sql: ${TABLE}.assignee_updated_at ;;
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

  dimension: first_resolution_time_in_minutes__business {
    type: number
    sql: ${TABLE}.first_resolution_time_in_minutes.business ;;
    group_label: "First Resolution Time In Minutes"
    group_item_label: "Business"
  }

  dimension: first_resolution_time_in_minutes__calendar {
    type: number
    sql: ${TABLE}.first_resolution_time_in_minutes.calendar ;;
    group_label: "First Resolution Time In Minutes"
    group_item_label: "Calendar"
  }

  dimension: full_resolution_time_in_minutes__business {
    type: number
    sql: ${TABLE}.full_resolution_time_in_minutes.business ;;
    group_label: "Full Resolution Time In Minutes"
    group_item_label: "Business"
  }

  dimension: full_resolution_time_in_minutes__calendar {
    type: number
    sql: ${TABLE}.full_resolution_time_in_minutes.calendar ;;
    group_label: "Full Resolution Time In Minutes"
    group_item_label: "Calendar"
  }

  dimension: group_stations {
    type: number
    sql: ${TABLE}.group_stations ;;
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
    sql: ${TABLE}.initially_assigned_at ;;
  }

  dimension_group: latest_comment_added {
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
    sql: ${TABLE}.latest_comment_added_at ;;
  }

  dimension: on_hold_time_in_minutes__business {
    type: number
    sql: ${TABLE}.on_hold_time_in_minutes.business ;;
    group_label: "On Hold Time In Minutes"
    group_item_label: "Business"
  }

  dimension: on_hold_time_in_minutes__calendar {
    type: number
    sql: ${TABLE}.on_hold_time_in_minutes.calendar ;;
    group_label: "On Hold Time In Minutes"
    group_item_label: "Calendar"
  }

  dimension: reopens {
    type: number
    sql: ${TABLE}.reopens ;;
  }

  dimension: replies {
    type: number
    sql: ${TABLE}.replies ;;
  }

  dimension: reply_time_in_minutes__business {
    type: number
    sql: ${TABLE}.reply_time_in_minutes.business ;;
    group_label: "Reply Time In Minutes"
    group_item_label: "Business"
  }

  dimension: reply_time_in_minutes__calendar {
    type: number
    sql: ${TABLE}.reply_time_in_minutes.calendar ;;
    group_label: "Reply Time In Minutes"
    group_item_label: "Calendar"
  }

  dimension_group: requester_updated {
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
    sql: ${TABLE}.requester_updated_at ;;
  }

  dimension: requester_wait_time_in_minutes__business {
    type: number
    sql: ${TABLE}.requester_wait_time_in_minutes.business ;;
    group_label: "Requester Wait Time In Minutes"
    group_item_label: "Business"
  }

  dimension: requester_wait_time_in_minutes__calendar {
    type: number
    sql: ${TABLE}.requester_wait_time_in_minutes.calendar ;;
    group_label: "Requester Wait Time In Minutes"
    group_item_label: "Calendar"
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
    sql: ${TABLE}.solved_at ;;
  }

  dimension_group: status_updated {
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
    sql: ${TABLE}.status_updated_at ;;
  }

  dimension: ticket_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ticket_id ;;
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

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [id, tickets.via__source__to__name, tickets.via__source__from__name, tickets.via__source__from__ticket_id]
  }
}
