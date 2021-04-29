view: jira_issue_comments {
  sql_table_name: `stitch-poc-306316.jira_poc.issue_comments`
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

  dimension: author__accountid {
    type: string
    sql: ${TABLE}.author.accountid ;;
    group_label: "Author"
    group_item_label: "Accountid"
  }

  dimension: author__active {
    type: yesno
    sql: ${TABLE}.author.active ;;
    group_label: "Author"
    group_item_label: "Active"
  }

  dimension: author__avatarurls___16x16 {
    type: string
    sql: ${TABLE}.author.avatarurls._16x16 ;;
    group_label: "Author Avatarurls"
    group_item_label: "16x16"
  }

  dimension: author__avatarurls___24x24 {
    type: string
    sql: ${TABLE}.author.avatarurls._24x24 ;;
    group_label: "Author Avatarurls"
    group_item_label: "24x24"
  }

  dimension: author__avatarurls___32x32 {
    type: string
    sql: ${TABLE}.author.avatarurls._32x32 ;;
    group_label: "Author Avatarurls"
    group_item_label: "32x32"
  }

  dimension: author__avatarurls___48x48 {
    type: string
    sql: ${TABLE}.author.avatarurls._48x48 ;;
    group_label: "Author Avatarurls"
    group_item_label: "48x48"
  }

  dimension: author__displayname {
    type: string
    sql: ${TABLE}.author.displayname ;;
    group_label: "Author"
    group_item_label: "Displayname"
  }

  dimension: author__emailaddress {
    type: string
    sql: ${TABLE}.author.emailaddress ;;
    group_label: "Author"
    group_item_label: "Emailaddress"
  }

  dimension: author__self {
    type: string
    sql: ${TABLE}.author.self ;;
    group_label: "Author"
    group_item_label: "Self"
  }

  dimension: author__timezone {
    type: string
    sql: ${TABLE}.author.timezone ;;
    group_label: "Author"
    group_item_label: "Timezone"
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
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
    sql: ${TABLE}.created ;;
  }

  dimension: issueid {
    type: string
    # hidden: yes
    sql: ${TABLE}.issueid ;;
  }

  dimension: jsdpublic {
    type: yesno
    sql: ${TABLE}.jsdpublic ;;
  }

  dimension: self {
    type: string
    sql: ${TABLE}.self ;;
  }

  dimension: updateauthor__accountid {
    type: string
    sql: ${TABLE}.updateauthor.accountid ;;
    group_label: "Updateauthor"
    group_item_label: "Accountid"
  }

  dimension: updateauthor__active {
    type: yesno
    sql: ${TABLE}.updateauthor.active ;;
    group_label: "Updateauthor"
    group_item_label: "Active"
  }

  dimension: updateauthor__avatarurls___16x16 {
    type: string
    sql: ${TABLE}.updateauthor.avatarurls._16x16 ;;
    group_label: "Updateauthor Avatarurls"
    group_item_label: "16x16"
  }

  dimension: updateauthor__avatarurls___24x24 {
    type: string
    sql: ${TABLE}.updateauthor.avatarurls._24x24 ;;
    group_label: "Updateauthor Avatarurls"
    group_item_label: "24x24"
  }

  dimension: updateauthor__avatarurls___32x32 {
    type: string
    sql: ${TABLE}.updateauthor.avatarurls._32x32 ;;
    group_label: "Updateauthor Avatarurls"
    group_item_label: "32x32"
  }

  dimension: updateauthor__avatarurls___48x48 {
    type: string
    sql: ${TABLE}.updateauthor.avatarurls._48x48 ;;
    group_label: "Updateauthor Avatarurls"
    group_item_label: "48x48"
  }

  dimension: updateauthor__displayname {
    type: string
    sql: ${TABLE}.updateauthor.displayname ;;
    group_label: "Updateauthor"
    group_item_label: "Displayname"
  }

  dimension: updateauthor__emailaddress {
    type: string
    sql: ${TABLE}.updateauthor.emailaddress ;;
    group_label: "Updateauthor"
    group_item_label: "Emailaddress"
  }

  dimension: updateauthor__self {
    type: string
    sql: ${TABLE}.updateauthor.self ;;
    group_label: "Updateauthor"
    group_item_label: "Self"
  }

  dimension: updateauthor__timezone {
    type: string
    sql: ${TABLE}.updateauthor.timezone ;;
    group_label: "Updateauthor"
    group_item_label: "Timezone"
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
    sql: ${TABLE}.updated ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      author__displayname,
      updateauthor__displayname,
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
