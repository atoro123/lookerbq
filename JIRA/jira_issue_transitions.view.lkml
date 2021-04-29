view: jira_issue_transitions {
  sql_table_name: `stitch-poc-306316.jira_poc.issue_transitions`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
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

  dimension: hasscreen {
    type: yesno
    sql: ${TABLE}.hasscreen ;;
  }

  dimension: isconditional {
    type: yesno
    sql: ${TABLE}.isconditional ;;
  }

  dimension: isglobal {
    type: yesno
    sql: ${TABLE}.isglobal ;;
  }

  dimension: isinitial {
    type: yesno
    sql: ${TABLE}.isinitial ;;
  }

  dimension: issueid {
    type: string
    # hidden: yes
    sql: ${TABLE}.issueid ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: to__description {
    type: string
    sql: ${TABLE}.`to`.description ;;
    group_label: "To"
    group_item_label: "Description"
  }

  dimension: to__iconurl {
    type: string
    sql: ${TABLE}.`to`.iconurl ;;
    group_label: "To"
    group_item_label: "Iconurl"
  }

  dimension: to__id {
    type: string
    sql: ${TABLE}.`to`.id ;;
    group_label: "To"
    group_item_label: "ID"
  }

  dimension: to__name {
    type: string
    sql: ${TABLE}.`to`.name ;;
    group_label: "To"
    group_item_label: "Name"
  }

  dimension: to__self {
    type: string
    sql: ${TABLE}.`to`.self ;;
    group_label: "To"
    group_item_label: "Self"
  }

  dimension: to__statuscategory__colorname {
    type: string
    sql: ${TABLE}.`to`.statuscategory.colorname ;;
    group_label: "To Statuscategory"
    group_item_label: "Colorname"
  }

  dimension: to__statuscategory__id {
    type: number
    sql: ${TABLE}.`to`.statuscategory.id ;;
    group_label: "To Statuscategory"
    group_item_label: "ID"
  }

  dimension: to__statuscategory__key {
    type: string
    sql: ${TABLE}.`to`.statuscategory.key ;;
    group_label: "To Statuscategory"
    group_item_label: "Key"
  }

  dimension: to__statuscategory__name {
    type: string
    sql: ${TABLE}.`to`.statuscategory.name ;;
    group_label: "To Statuscategory"
    group_item_label: "Name"
  }

  dimension: to__statuscategory__self {
    type: string
    sql: ${TABLE}.`to`.statuscategory.self ;;
    group_label: "To Statuscategory"
    group_item_label: "Self"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      to__name,
      to__statuscategory__name,
      to__statuscategory__colorname,
      issues.id,
      issues.fields__status__name,
      issues.fields__project__name,
      issues.fields__priority__name,
      issues.fields__issuetype__name,
      issues.fields__resolution__name,
      issues.fields__creator__displayname,
      issues.fields__assignee__displayname,
      issues.fields__reporter__displayname,
      issues.fields__parent__fields__status__name,
      issues.fields__status__statuscategory__name,
      issues.fields__parent__fields__priority__name,
      issues.fields__parent__fields__issuetype__name,
      issues.fields__project__projectcategory__name,
      issues.fields__customfield_10700__displayname,
      issues.fields__customfield_12300__displayname,
      issues.fields__status__statuscategory__colorname,
      issues.fields__parent__fields__status__statuscategory__name,
      issues.fields__parent__fields__status__statuscategory__colorname
    ]
  }
}
