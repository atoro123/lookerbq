# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: jira_projects {
  hidden: yes

  join: projects__projectkeys {
    view_label: "Projects: Projectkeys"
    sql: LEFT JOIN UNNEST(${jira_projects.projectkeys}) as projects__projectkeys ;;
    relationship: one_to_many
  }
}

view: jira_projects {
  sql_table_name: `stitch-poc-306316.jira_poc.projects`
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

  dimension: avatarurls___16x16 {
    type: string
    sql: ${TABLE}.avatarurls._16x16 ;;
    group_label: "Avatarurls"
    group_item_label: "16x16"
  }

  dimension: avatarurls___24x24 {
    type: string
    sql: ${TABLE}.avatarurls._24x24 ;;
    group_label: "Avatarurls"
    group_item_label: "24x24"
  }

  dimension: avatarurls___32x32 {
    type: string
    sql: ${TABLE}.avatarurls._32x32 ;;
    group_label: "Avatarurls"
    group_item_label: "32x32"
  }

  dimension: avatarurls___48x48 {
    type: string
    sql: ${TABLE}.avatarurls._48x48 ;;
    group_label: "Avatarurls"
    group_item_label: "48x48"
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: expand {
    type: string
    sql: ${TABLE}.expand ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: lead__accountid {
    type: string
    sql: ${TABLE}.lead.accountid ;;
    group_label: "Lead"
    group_item_label: "Accountid"
  }

  dimension: lead__active {
    type: yesno
    sql: ${TABLE}.lead.active ;;
    group_label: "Lead"
    group_item_label: "Active"
  }

  dimension: lead__avatarurls___16x16 {
    type: string
    sql: ${TABLE}.lead.avatarurls._16x16 ;;
    group_label: "Lead Avatarurls"
    group_item_label: "16x16"
  }

  dimension: lead__avatarurls___24x24 {
    type: string
    sql: ${TABLE}.lead.avatarurls._24x24 ;;
    group_label: "Lead Avatarurls"
    group_item_label: "24x24"
  }

  dimension: lead__avatarurls___32x32 {
    type: string
    sql: ${TABLE}.lead.avatarurls._32x32 ;;
    group_label: "Lead Avatarurls"
    group_item_label: "32x32"
  }

  dimension: lead__avatarurls___48x48 {
    type: string
    sql: ${TABLE}.lead.avatarurls._48x48 ;;
    group_label: "Lead Avatarurls"
    group_item_label: "48x48"
  }

  dimension: lead__displayname {
    type: string
    sql: ${TABLE}.lead.displayname ;;
    group_label: "Lead"
    group_item_label: "Displayname"
  }

  dimension: lead__self {
    type: string
    sql: ${TABLE}.lead.self ;;
    group_label: "Lead"
    group_item_label: "Self"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: projectcategory__description {
    type: string
    sql: ${TABLE}.projectcategory.description ;;
    group_label: "Projectcategory"
    group_item_label: "Description"
  }

  dimension: projectcategory__id {
    type: string
    sql: ${TABLE}.projectcategory.id ;;
    group_label: "Projectcategory"
    group_item_label: "ID"
  }

  dimension: projectcategory__name {
    type: string
    sql: ${TABLE}.projectcategory.name ;;
    group_label: "Projectcategory"
    group_item_label: "Name"
  }

  dimension: projectcategory__self {
    type: string
    sql: ${TABLE}.projectcategory.self ;;
    group_label: "Projectcategory"
    group_item_label: "Self"
  }

  dimension: projectkeys {
    hidden: yes
    sql: ${TABLE}.projectkeys ;;
  }

  dimension: projecttypekey {
    type: string
    sql: ${TABLE}.projecttypekey ;;
  }

  dimension: self {
    type: string
    sql: ${TABLE}.self ;;
  }

  dimension: simplified {
    type: yesno
    sql: ${TABLE}.simplified ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, lead__displayname, projectcategory__name]
  }
}

view: projects__projectkeys {
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
