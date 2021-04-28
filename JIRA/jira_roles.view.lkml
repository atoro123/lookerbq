# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: jira_roles {
  hidden: yes

  join: roles__actors {
    view_label: "Roles: Actors"
    sql: LEFT JOIN UNNEST(${jira_roles.actors}) as roles__actors ;;
    relationship: one_to_many
  }
}

view: jira_roles {
  sql_table_name: `stitch-poc-306316.jira_poc.roles`
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

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._sdc_extracted_at ;;
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

  dimension: actors {
    hidden: yes
    sql: ${TABLE}.actors ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: self {
    type: string
    sql: ${TABLE}.self ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}

view: roles__actors {
  dimension: value__displayname {
    type: string
    sql: ${TABLE}.value.displayname ;;
    group_label: "Value"
    group_item_label: "Displayname"
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

  dimension: value__type {
    type: string
    sql: ${TABLE}.value.type ;;
    group_label: "Value"
    group_item_label: "Type"
  }
}
