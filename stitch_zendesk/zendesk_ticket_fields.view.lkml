# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: ticket_fields {
  hidden: yes

  join: ticket_fields__custom_field_options {
    view_label: "Ticket Fields: Custom Field Options"
    sql: LEFT JOIN UNNEST(${ticket_fields.custom_field_options}) as ticket_fields__custom_field_options ;;
    relationship: one_to_many
  }

  join: ticket_fields__system_field_options {
    view_label: "Ticket Fields: System Field Options"
    sql: LEFT JOIN UNNEST(${ticket_fields.system_field_options}) as ticket_fields__system_field_options ;;
    relationship: one_to_many
  }
}

view: ticket_fields {
  sql_table_name: `stitch-poc-306316.zendesk.ticket_fields`
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

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: agent_description {
    type: string
    sql: ${TABLE}.agent_description ;;
  }

  dimension: collapsed_for_agents {
    type: yesno
    sql: ${TABLE}.collapsed_for_agents ;;
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

  dimension: custom_field_options {
    hidden: yes
    sql: ${TABLE}.custom_field_options ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: editable_in_portal {
    type: yesno
    sql: ${TABLE}.editable_in_portal ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension: raw_description {
    type: string
    sql: ${TABLE}.raw_description ;;
  }

  dimension: raw_title {
    type: string
    sql: ${TABLE}.raw_title ;;
  }

  dimension: raw_title_in_portal {
    type: string
    sql: ${TABLE}.raw_title_in_portal ;;
  }

  dimension: removable {
    type: yesno
    sql: ${TABLE}.removable ;;
  }

  dimension: required {
    type: yesno
    sql: ${TABLE}.required ;;
  }

  dimension: required_in_portal {
    type: yesno
    sql: ${TABLE}.required_in_portal ;;
  }

  dimension: sub_type_id {
    type: number
    sql: ${TABLE}.sub_type_id ;;
  }

  dimension: system_field_options {
    hidden: yes
    sql: ${TABLE}.system_field_options ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}.tag ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: title_in_portal {
    type: string
    sql: ${TABLE}.title_in_portal ;;
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

  dimension: visible_in_portal {
    type: yesno
    sql: ${TABLE}.visible_in_portal ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

view: ticket_fields__custom_field_options {
  dimension: value__default {
    type: yesno
    sql: ${TABLE}.value.`default` ;;
    group_label: "Value"
    group_item_label: "Default"
  }

  dimension: value__id {
    type: number
    sql: ${TABLE}.value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__name {
    type: string
    sql: ${TABLE}.value.name ;;
    group_label: "Value"
    group_item_label: "Name"
  }

  dimension: value__raw_name {
    type: string
    sql: ${TABLE}.value.raw_name ;;
    group_label: "Value"
    group_item_label: "Raw Name"
  }

  dimension: value__value {
    type: string
    sql: ${TABLE}.value.value ;;
    group_label: "Value"
    group_item_label: "Value"
  }
}

view: ticket_fields__system_field_options {
  dimension: value__name {
    type: string
    sql: ${TABLE}.value.name ;;
    group_label: "Value"
    group_item_label: "Name"
  }

  dimension: value__value {
    type: string
    sql: ${TABLE}.value.value ;;
    group_label: "Value"
    group_item_label: "Value"
  }
}
