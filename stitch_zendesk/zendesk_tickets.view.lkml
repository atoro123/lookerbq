# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: zendesk_tickets_arrays {
  from: zendesk_tickets
  hidden: yes

  join: tickets__tags {
    view_label: "Tickets: Tags"
    sql: LEFT JOIN UNNEST(${zendesk_tickets_arrays.tags}) as tickets__tags ;;
    relationship: one_to_many
  }

  join: tickets__follower_ids {
    view_label: "Tickets: Follower Ids"
    sql: LEFT JOIN UNNEST(${zendesk_tickets_arrays.follower_ids}) as tickets__follower_ids ;;
    relationship: one_to_many
  }

  join: tickets__followup_ids {
    view_label: "Tickets: Followup Ids"
    sql: LEFT JOIN UNNEST(${zendesk_tickets_arrays.followup_ids}) as tickets__followup_ids ;;
    relationship: one_to_many
  }

  join: tickets__custom_fields {
    view_label: "Tickets: Custom Fields"
    sql: LEFT JOIN UNNEST(${zendesk_tickets_arrays.custom_fields}) as tickets__custom_fields ;;
    relationship: one_to_many
  }

  join: tickets__collaborator_ids {
    view_label: "Tickets: Collaborator Ids"
    sql: LEFT JOIN UNNEST(${zendesk_tickets_arrays.collaborator_ids}) as tickets__collaborator_ids ;;
    relationship: one_to_many
  }
}

view: zendesk_tickets {
  sql_table_name: `stitch-poc-306316.zendesk.tickets`
    ;;
  drill_fields: [via__source__from__ticket_id]

  dimension: via__source__from__ticket_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.via.source.`from`.ticket_id ;;
    group_label: "Via Source From"
    group_item_label: "Ticket ID"
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

  dimension: allow_attachments {
    type: yesno
    sql: ${TABLE}.allow_attachments ;;
  }

  dimension: allow_channelback {
    type: yesno
    sql: ${TABLE}.allow_channelback ;;
  }

  dimension: assignee_id {
    type: number
    sql: ${TABLE}.assignee_id ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: collaborator_ids {
    hidden: yes
    sql: ${TABLE}.collaborator_ids ;;
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

  dimension: custom_fields {
    hidden: yes
    sql: ${TABLE}.custom_fields ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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
    sql: ${TABLE}.due_at ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: follower_ids {
    hidden: yes
    sql: ${TABLE}.follower_ids ;;
  }

  dimension: followup_ids {
    hidden: yes
    sql: ${TABLE}.followup_ids ;;
  }

  dimension: generated_timestamp {
    type: number
    sql: ${TABLE}.generated_timestamp ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: has_incidents {
    type: yesno
    sql: ${TABLE}.has_incidents ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
  }

  dimension: organization_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: raw_subject {
    type: string
    sql: ${TABLE}.raw_subject ;;
  }

  dimension: requester_id {
    type: number
    sql: ${TABLE}.requester_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: submitter_id {
    type: number
    sql: ${TABLE}.submitter_id ;;
  }

  dimension: tags {
    hidden: yes
    sql: ${TABLE}.tags ;;
  }

  dimension: tags_list {
    sql: replace(trim(FORMAT('%t', array_concat(${tags})), "[]()"), "), (", ", ") ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  dimension: via__channel {
    type: string
    sql: ${TABLE}.via.channel ;;
    group_label: "Via"
    group_item_label: "Channel"
  }

  dimension: via__source__from__address {
    type: string
    sql: ${TABLE}.via.source.`from`.address ;;
    group_label: "Via Source From"
    group_item_label: "Address"
  }

  dimension: via__source__from__name {
    type: string
    sql: ${TABLE}.via.source.`from`.name ;;
    group_label: "Via Source From"
    group_item_label: "Name"
  }

  dimension: via__source__from__subject {
    type: string
    sql: ${TABLE}.via.source.`from`.subject ;;
    group_label: "Via Source From"
    group_item_label: "Subject"
  }

  dimension: via__source__rel {
    type: string
    sql: ${TABLE}.via.source.rel ;;
    group_label: "Via Source"
    group_item_label: "Rel"
  }

  dimension: via__source__to__address {
    type: string
    sql: ${TABLE}.via.source.`to`.address ;;
    group_label: "Via Source To"
    group_item_label: "Address"
  }

  dimension: via__source__to__name {
    type: string
    sql: ${TABLE}.via.source.`to`.name ;;
    group_label: "Via Source To"
    group_item_label: "Name"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      via__source__from__ticket_id,
      via__source__to__name,
      via__source__from__name,
      groups.name,
      groups.id,
      organizations.name,
      organizations.id,
      ticket_metrics.count,
      ticket_audits.count,
      ticket_comments.count
    ]
  }
}

view: tickets__tags {
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: tickets__follower_ids {
  dimension: value {
    type: number
    value_format_name: id
    sql: ${TABLE}.value ;;
  }
}

view: tickets__followup_ids {
  dimension: value {
    type: number
    value_format_name: id
    sql: ${TABLE}.value ;;
  }
}

view: tickets__custom_fields {
  dimension: value__id {
    type: number
    sql: ${TABLE}.value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__value {
    type: string
    sql: ${TABLE}.value.value ;;
    group_label: "Value"
    group_item_label: "Value"
  }

  dimension: value__value__bo {
    type: yesno
    sql: ${TABLE}.value.value__bo ;;
    group_label: "Value Value"
    group_item_label: "Bo"
  }
}

view: tickets__collaborator_ids {
  dimension: value {
    type: number
    value_format_name: id
    sql: ${TABLE}.value ;;
  }
}
