# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: jira_issues {
  hidden: yes

  join: issues__fields__labels {
    view_label: "Issues: Fields Labels"
    sql: LEFT JOIN UNNEST(${jira_issues.fields__labels}) as issues__fields__labels ;;
    relationship: one_to_many
  }

  join: issues__fields__subtasks {
    view_label: "Issues: Fields Subtasks"
    sql: LEFT JOIN UNNEST(${jira_issues.fields__subtasks}) as issues__fields__subtasks ;;
    relationship: one_to_many
  }

  join: issues__fields__issuelinks {
    view_label: "Issues: Fields Issuelinks"
    sql: LEFT JOIN UNNEST(${jira_issues.fields__issuelinks}) as issues__fields__issuelinks ;;
    relationship: one_to_many
  }

  join: issues__fields__attachment {
    view_label: "Issues: Fields Attachment"
    sql: LEFT JOIN UNNEST(${jira_issues.fields__attachment}) as issues__fields__attachment ;;
    relationship: one_to_many
  }

  join: issues__fields__fixversions {
    view_label: "Issues: Fields Fixversions"
    sql: LEFT JOIN UNNEST(${jira_issues.fields__fixversions}) as issues__fields__fixversions ;;
    relationship: one_to_many
  }

  join: issues__fields__customfield_10300 {
    view_label: "Issues: Fields Customfield 10300"
    sql: LEFT JOIN UNNEST(${jira_issues.fields__customfield_10300}) as issues__fields__customfield_10300 ;;
    relationship: one_to_many
  }

  join: issues__fields__customfield_11900 {
    view_label: "Issues: Fields Customfield 11900"
    sql: LEFT JOIN UNNEST(${jira_issues.fields__customfield_11900}) as issues__fields__customfield_11900 ;;
    relationship: one_to_many
  }

  join: issues__fields__customfield_10007 {
    view_label: "Issues: Fields Customfield 10007"
    sql: LEFT JOIN UNNEST(${jira_issues.fields__customfield_10007}) as issues__fields__customfield_10007 ;;
    relationship: one_to_many
  }

  join: issues__fields__customfield_10002 {
    view_label: "Issues: Fields Customfield 10002"
    sql: LEFT JOIN UNNEST(${jira_issues.fields__customfield_10002}) as issues__fields__customfield_10002 ;;
    relationship: one_to_many
  }

  join: issues__fields__customfield_10901 {
    view_label: "Issues: Fields Customfield 10901"
    sql: LEFT JOIN UNNEST(${jira_issues.fields__customfield_10901}) as issues__fields__customfield_10901 ;;
    relationship: one_to_many
  }
}

view: jira_issues {
  sql_table_name: `stitch-poc-306316.jira_poc.issues`
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

  dimension: expand {
    type: string
    sql: ${TABLE}.expand ;;
  }

  dimension: fields__aggregateprogress__percent {
    type: number
    sql: ${TABLE}.fields.aggregateprogress.percent ;;
    group_label: "Fields Aggregateprogress"
    group_item_label: "Percent"
  }

  dimension: fields__aggregateprogress__progress {
    type: number
    sql: ${TABLE}.fields.aggregateprogress.progress ;;
    group_label: "Fields Aggregateprogress"
    group_item_label: "Progress"
  }

  dimension: fields__aggregateprogress__total {
    type: number
    sql: ${TABLE}.fields.aggregateprogress.total ;;
    group_label: "Fields Aggregateprogress"
    group_item_label: "Total"
  }

  dimension: fields__aggregatetimeestimate {
    type: number
    sql: ${TABLE}.fields.aggregatetimeestimate ;;
    group_label: "Fields"
    group_item_label: "Aggregatetimeestimate"
  }

  dimension: fields__aggregatetimeoriginalestimate {
    type: number
    sql: ${TABLE}.fields.aggregatetimeoriginalestimate ;;
    group_label: "Fields"
    group_item_label: "Aggregatetimeoriginalestimate"
  }

  dimension: fields__aggregatetimespent {
    type: number
    sql: ${TABLE}.fields.aggregatetimespent ;;
    group_label: "Fields"
    group_item_label: "Aggregatetimespent"
  }

  dimension: fields__assignee__accountid {
    type: string
    sql: ${TABLE}.fields.assignee.accountid ;;
    group_label: "Fields Assignee"
    group_item_label: "Accountid"
  }

  dimension: fields__assignee__accounttype {
    type: string
    sql: ${TABLE}.fields.assignee.accounttype ;;
    group_label: "Fields Assignee"
    group_item_label: "Accounttype"
  }

  dimension: fields__assignee__active {
    type: yesno
    sql: ${TABLE}.fields.assignee.active ;;
    group_label: "Fields Assignee"
    group_item_label: "Active"
  }

  dimension: fields__assignee__avatarurls___16x16 {
    type: string
    sql: ${TABLE}.fields.assignee.avatarurls._16x16 ;;
    group_label: "Fields Assignee Avatarurls"
    group_item_label: "16x16"
  }

  dimension: fields__assignee__avatarurls___24x24 {
    type: string
    sql: ${TABLE}.fields.assignee.avatarurls._24x24 ;;
    group_label: "Fields Assignee Avatarurls"
    group_item_label: "24x24"
  }

  dimension: fields__assignee__avatarurls___32x32 {
    type: string
    sql: ${TABLE}.fields.assignee.avatarurls._32x32 ;;
    group_label: "Fields Assignee Avatarurls"
    group_item_label: "32x32"
  }

  dimension: fields__assignee__avatarurls___48x48 {
    type: string
    sql: ${TABLE}.fields.assignee.avatarurls._48x48 ;;
    group_label: "Fields Assignee Avatarurls"
    group_item_label: "48x48"
  }

  dimension: fields__assignee__displayname {
    type: string
    sql: ${TABLE}.fields.assignee.displayname ;;
    group_label: "Fields Assignee"
    group_item_label: "Displayname"
  }

  dimension: fields__assignee__emailaddress {
    type: string
    sql: ${TABLE}.fields.assignee.emailaddress ;;
    group_label: "Fields Assignee"
    group_item_label: "Emailaddress"
  }

  dimension: fields__assignee__self {
    type: string
    sql: ${TABLE}.fields.assignee.self ;;
    group_label: "Fields Assignee"
    group_item_label: "Self"
  }

  dimension: fields__assignee__timezone {
    type: string
    sql: ${TABLE}.fields.assignee.timezone ;;
    group_label: "Fields Assignee"
    group_item_label: "Timezone"
  }

  dimension: fields__attachment {
    hidden: yes
    sql: ${TABLE}.fields.attachment ;;
    group_label: "Fields"
    group_item_label: "Attachment"
  }

  dimension_group: fields__created {
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
    sql: ${TABLE}.fields.created ;;
    group_label: "Fields"
    group_item_label: "Created"
  }

  dimension: fields__creator__accountid {
    type: string
    sql: ${TABLE}.fields.creator.accountid ;;
    group_label: "Fields Creator"
    group_item_label: "Accountid"
  }

  dimension: fields__creator__accounttype {
    type: string
    sql: ${TABLE}.fields.creator.accounttype ;;
    group_label: "Fields Creator"
    group_item_label: "Accounttype"
  }

  dimension: fields__creator__active {
    type: yesno
    sql: ${TABLE}.fields.creator.active ;;
    group_label: "Fields Creator"
    group_item_label: "Active"
  }

  dimension: fields__creator__avatarurls___16x16 {
    type: string
    sql: ${TABLE}.fields.creator.avatarurls._16x16 ;;
    group_label: "Fields Creator Avatarurls"
    group_item_label: "16x16"
  }

  dimension: fields__creator__avatarurls___24x24 {
    type: string
    sql: ${TABLE}.fields.creator.avatarurls._24x24 ;;
    group_label: "Fields Creator Avatarurls"
    group_item_label: "24x24"
  }

  dimension: fields__creator__avatarurls___32x32 {
    type: string
    sql: ${TABLE}.fields.creator.avatarurls._32x32 ;;
    group_label: "Fields Creator Avatarurls"
    group_item_label: "32x32"
  }

  dimension: fields__creator__avatarurls___48x48 {
    type: string
    sql: ${TABLE}.fields.creator.avatarurls._48x48 ;;
    group_label: "Fields Creator Avatarurls"
    group_item_label: "48x48"
  }

  dimension: fields__creator__displayname {
    type: string
    sql: ${TABLE}.fields.creator.displayname ;;
    group_label: "Fields Creator"
    group_item_label: "Displayname"
  }

  dimension: fields__creator__emailaddress {
    type: string
    sql: ${TABLE}.fields.creator.emailaddress ;;
    group_label: "Fields Creator"
    group_item_label: "Emailaddress"
  }

  dimension: fields__creator__self {
    type: string
    sql: ${TABLE}.fields.creator.self ;;
    group_label: "Fields Creator"
    group_item_label: "Self"
  }

  dimension: fields__creator__timezone {
    type: string
    sql: ${TABLE}.fields.creator.timezone ;;
    group_label: "Fields Creator"
    group_item_label: "Timezone"
  }

  dimension: fields__customfield_10000 {
    type: string
    sql: ${TABLE}.fields.customfield_10000 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10000"
  }

  dimension: fields__customfield_10001 {
    type: string
    sql: ${TABLE}.fields.customfield_10001 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10001"
  }

  dimension: fields__customfield_10002 {
    hidden: yes
    sql: ${TABLE}.fields.customfield_10002 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10002"
  }

  dimension: fields__customfield_10004 {
    type: number
    sql: ${TABLE}.fields.customfield_10004 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10004"
  }

  dimension: fields__customfield_10005 {
    type: number
    sql: ${TABLE}.fields.customfield_10005 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10005"
  }

  dimension: fields__customfield_10007 {
    hidden: yes
    sql: ${TABLE}.fields.customfield_10007 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10007"
  }

  dimension: fields__customfield_10008 {
    type: string
    sql: ${TABLE}.fields.customfield_10008 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10008"
  }

  dimension: fields__customfield_10009 {
    type: string
    sql: ${TABLE}.fields.customfield_10009 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10009"
  }

  dimension: fields__customfield_10010__id {
    type: string
    sql: ${TABLE}.fields.customfield_10010.id ;;
    group_label: "Fields Customfield 10010"
    group_item_label: "ID"
  }

  dimension: fields__customfield_10010__self {
    type: string
    sql: ${TABLE}.fields.customfield_10010.self ;;
    group_label: "Fields Customfield 10010"
    group_item_label: "Self"
  }

  dimension: fields__customfield_10010__value {
    type: string
    sql: ${TABLE}.fields.customfield_10010.value ;;
    group_label: "Fields Customfield 10010"
    group_item_label: "Value"
  }

  dimension: fields__customfield_10011 {
    type: string
    sql: ${TABLE}.fields.customfield_10011 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10011"
  }

  dimension: fields__customfield_10100__id {
    type: string
    sql: ${TABLE}.fields.customfield_10100.id ;;
    group_label: "Fields Customfield 10100"
    group_item_label: "ID"
  }

  dimension: fields__customfield_10100__self {
    type: string
    sql: ${TABLE}.fields.customfield_10100.self ;;
    group_label: "Fields Customfield 10100"
    group_item_label: "Self"
  }

  dimension: fields__customfield_10100__value {
    type: string
    sql: ${TABLE}.fields.customfield_10100.value ;;
    group_label: "Fields Customfield 10100"
    group_item_label: "Value"
  }

  dimension: fields__customfield_10200 {
    type: string
    sql: ${TABLE}.fields.customfield_10200 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10200"
  }

  dimension: fields__customfield_10300 {
    hidden: yes
    sql: ${TABLE}.fields.customfield_10300 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10300"
  }

  dimension: fields__customfield_10400__id {
    type: string
    sql: ${TABLE}.fields.customfield_10400.id ;;
    group_label: "Fields Customfield 10400"
    group_item_label: "ID"
  }

  dimension: fields__customfield_10400__self {
    type: string
    sql: ${TABLE}.fields.customfield_10400.self ;;
    group_label: "Fields Customfield 10400"
    group_item_label: "Self"
  }

  dimension: fields__customfield_10400__value {
    type: string
    sql: ${TABLE}.fields.customfield_10400.value ;;
    group_label: "Fields Customfield 10400"
    group_item_label: "Value"
  }

  dimension: fields__customfield_10700__accountid {
    type: string
    sql: ${TABLE}.fields.customfield_10700.accountid ;;
    group_label: "Fields Customfield 10700"
    group_item_label: "Accountid"
  }

  dimension: fields__customfield_10700__accounttype {
    type: string
    sql: ${TABLE}.fields.customfield_10700.accounttype ;;
    group_label: "Fields Customfield 10700"
    group_item_label: "Accounttype"
  }

  dimension: fields__customfield_10700__active {
    type: yesno
    sql: ${TABLE}.fields.customfield_10700.active ;;
    group_label: "Fields Customfield 10700"
    group_item_label: "Active"
  }

  dimension: fields__customfield_10700__avatarurls___16x16 {
    type: string
    sql: ${TABLE}.fields.customfield_10700.avatarurls._16x16 ;;
    group_label: "Fields Customfield 10700 Avatarurls"
    group_item_label: "16x16"
  }

  dimension: fields__customfield_10700__avatarurls___24x24 {
    type: string
    sql: ${TABLE}.fields.customfield_10700.avatarurls._24x24 ;;
    group_label: "Fields Customfield 10700 Avatarurls"
    group_item_label: "24x24"
  }

  dimension: fields__customfield_10700__avatarurls___32x32 {
    type: string
    sql: ${TABLE}.fields.customfield_10700.avatarurls._32x32 ;;
    group_label: "Fields Customfield 10700 Avatarurls"
    group_item_label: "32x32"
  }

  dimension: fields__customfield_10700__avatarurls___48x48 {
    type: string
    sql: ${TABLE}.fields.customfield_10700.avatarurls._48x48 ;;
    group_label: "Fields Customfield 10700 Avatarurls"
    group_item_label: "48x48"
  }

  dimension: fields__customfield_10700__displayname {
    type: string
    sql: ${TABLE}.fields.customfield_10700.displayname ;;
    group_label: "Fields Customfield 10700"
    group_item_label: "Displayname"
  }

  dimension: fields__customfield_10700__self {
    type: string
    sql: ${TABLE}.fields.customfield_10700.self ;;
    group_label: "Fields Customfield 10700"
    group_item_label: "Self"
  }

  dimension: fields__customfield_10700__timezone {
    type: string
    sql: ${TABLE}.fields.customfield_10700.timezone ;;
    group_label: "Fields Customfield 10700"
    group_item_label: "Timezone"
  }

  dimension: fields__customfield_10800 {
    type: string
    sql: ${TABLE}.fields.customfield_10800 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10800"
  }

  dimension: fields__customfield_10900__errormessage {
    type: string
    sql: ${TABLE}.fields.customfield_10900.errormessage ;;
    group_label: "Fields Customfield 10900"
    group_item_label: "Errormessage"
  }

  dimension: fields__customfield_10900__i18nerrormessage__i18nkey {
    type: string
    sql: ${TABLE}.fields.customfield_10900.i18nerrormessage.i18nkey ;;
    group_label: "Fields Customfield 10900 I18nerrormessage"
    group_item_label: "I18nkey"
  }

  dimension: fields__customfield_10901 {
    hidden: yes
    sql: ${TABLE}.fields.customfield_10901 ;;
    group_label: "Fields"
    group_item_label: "Customfield 10901"
  }

  dimension: fields__customfield_10902__errormessage {
    type: string
    sql: ${TABLE}.fields.customfield_10902.errormessage ;;
    group_label: "Fields Customfield 10902"
    group_item_label: "Errormessage"
  }

  dimension: fields__customfield_10902__i18nerrormessage__i18nkey {
    type: string
    sql: ${TABLE}.fields.customfield_10902.i18nerrormessage.i18nkey ;;
    group_label: "Fields Customfield 10902 I18nerrormessage"
    group_item_label: "I18nkey"
  }

  dimension: fields__customfield_11000 {
    type: string
    sql: ${TABLE}.fields.customfield_11000 ;;
    group_label: "Fields"
    group_item_label: "Customfield 11000"
  }

  dimension: fields__customfield_11002__errormessage {
    type: string
    sql: ${TABLE}.fields.customfield_11002.errormessage ;;
    group_label: "Fields Customfield 11002"
    group_item_label: "Errormessage"
  }

  dimension: fields__customfield_11002__i18nerrormessage__i18nkey {
    type: string
    sql: ${TABLE}.fields.customfield_11002.i18nerrormessage.i18nkey ;;
    group_label: "Fields Customfield 11002 I18nerrormessage"
    group_item_label: "I18nkey"
  }

  dimension: fields__customfield_11003__errormessage {
    type: string
    sql: ${TABLE}.fields.customfield_11003.errormessage ;;
    group_label: "Fields Customfield 11003"
    group_item_label: "Errormessage"
  }

  dimension: fields__customfield_11003__i18nerrormessage__i18nkey {
    type: string
    sql: ${TABLE}.fields.customfield_11003.i18nerrormessage.i18nkey ;;
    group_label: "Fields Customfield 11003 I18nerrormessage"
    group_item_label: "I18nkey"
  }

  dimension: fields__customfield_11004__errormessage {
    type: string
    sql: ${TABLE}.fields.customfield_11004.errormessage ;;
    group_label: "Fields Customfield 11004"
    group_item_label: "Errormessage"
  }

  dimension: fields__customfield_11004__i18nerrormessage__i18nkey {
    type: string
    sql: ${TABLE}.fields.customfield_11004.i18nerrormessage.i18nkey ;;
    group_label: "Fields Customfield 11004 I18nerrormessage"
    group_item_label: "I18nkey"
  }

  dimension: fields__customfield_11005__errormessage {
    type: string
    sql: ${TABLE}.fields.customfield_11005.errormessage ;;
    group_label: "Fields Customfield 11005"
    group_item_label: "Errormessage"
  }

  dimension: fields__customfield_11005__i18nerrormessage__i18nkey {
    type: string
    sql: ${TABLE}.fields.customfield_11005.i18nerrormessage.i18nkey ;;
    group_label: "Fields Customfield 11005 I18nerrormessage"
    group_item_label: "I18nkey"
  }

  dimension: fields__customfield_11006__errormessage {
    type: string
    sql: ${TABLE}.fields.customfield_11006.errormessage ;;
    group_label: "Fields Customfield 11006"
    group_item_label: "Errormessage"
  }

  dimension: fields__customfield_11006__i18nerrormessage__i18nkey {
    type: string
    sql: ${TABLE}.fields.customfield_11006.i18nerrormessage.i18nkey ;;
    group_label: "Fields Customfield 11006 I18nerrormessage"
    group_item_label: "I18nkey"
  }

  dimension: fields__customfield_11007__errormessage {
    type: string
    sql: ${TABLE}.fields.customfield_11007.errormessage ;;
    group_label: "Fields Customfield 11007"
    group_item_label: "Errormessage"
  }

  dimension: fields__customfield_11007__i18nerrormessage__i18nkey {
    type: string
    sql: ${TABLE}.fields.customfield_11007.i18nerrormessage.i18nkey ;;
    group_label: "Fields Customfield 11007 I18nerrormessage"
    group_item_label: "I18nkey"
  }

  dimension: fields__customfield_11100 {
    type: string
    sql: ${TABLE}.fields.customfield_11100 ;;
    group_label: "Fields"
    group_item_label: "Customfield 11100"
  }

  dimension: fields__customfield_11200 {
    type: string
    sql: ${TABLE}.fields.customfield_11200 ;;
    group_label: "Fields"
    group_item_label: "Customfield 11200"
  }

  dimension: fields__customfield_11201 {
    type: string
    sql: ${TABLE}.fields.customfield_11201 ;;
    group_label: "Fields"
    group_item_label: "Customfield 11201"
  }

  dimension: fields__customfield_11202 {
    type: string
    sql: ${TABLE}.fields.customfield_11202 ;;
    group_label: "Fields"
    group_item_label: "Customfield 11202"
  }

  dimension: fields__customfield_11205 {
    type: string
    sql: ${TABLE}.fields.customfield_11205 ;;
    group_label: "Fields"
    group_item_label: "Customfield 11205"
  }

  dimension: fields__customfield_11300__rating {
    type: number
    sql: ${TABLE}.fields.customfield_11300.rating ;;
    group_label: "Fields Customfield 11300"
    group_item_label: "Rating"
  }

  dimension: fields__customfield_11301 {
    type: string
    sql: ${TABLE}.fields.customfield_11301 ;;
    group_label: "Fields"
    group_item_label: "Customfield 11301"
  }

  dimension: fields__customfield_11600 {
    type: string
    sql: ${TABLE}.fields.customfield_11600 ;;
    group_label: "Fields"
    group_item_label: "Customfield 11600"
  }

  dimension: fields__customfield_11700__hasepiclinkfielddependency {
    type: yesno
    sql: ${TABLE}.fields.customfield_11700.hasepiclinkfielddependency ;;
    group_label: "Fields Customfield 11700"
    group_item_label: "Hasepiclinkfielddependency"
  }

  dimension: fields__customfield_11700__noneditablereason__message {
    type: string
    sql: ${TABLE}.fields.customfield_11700.noneditablereason.message ;;
    group_label: "Fields Customfield 11700 Noneditablereason"
    group_item_label: "Message"
  }

  dimension: fields__customfield_11700__noneditablereason__reason {
    type: string
    sql: ${TABLE}.fields.customfield_11700.noneditablereason.reason ;;
    group_label: "Fields Customfield 11700 Noneditablereason"
    group_item_label: "Reason"
  }

  dimension: fields__customfield_11700__showfield {
    type: yesno
    sql: ${TABLE}.fields.customfield_11700.showfield ;;
    group_label: "Fields Customfield 11700"
    group_item_label: "Showfield"
  }

  dimension: fields__customfield_11800 {
    type: string
    sql: ${TABLE}.fields.customfield_11800 ;;
    group_label: "Fields"
    group_item_label: "Customfield 11800"
  }

  dimension: fields__customfield_11900 {
    hidden: yes
    sql: ${TABLE}.fields.customfield_11900 ;;
    group_label: "Fields"
    group_item_label: "Customfield 11900"
  }

  dimension: fields__customfield_12000__errormessage {
    type: string
    sql: ${TABLE}.fields.customfield_12000.errormessage ;;
    group_label: "Fields Customfield 12000"
    group_item_label: "Errormessage"
  }

  dimension: fields__customfield_12000__i18nerrormessage__i18nkey {
    type: string
    sql: ${TABLE}.fields.customfield_12000.i18nerrormessage.i18nkey ;;
    group_label: "Fields Customfield 12000 I18nerrormessage"
    group_item_label: "I18nkey"
  }

  dimension: fields__customfield_12300__displayname {
    type: string
    sql: ${TABLE}.fields.customfield_12300.displayname ;;
    group_label: "Fields Customfield 12300"
    group_item_label: "Displayname"
  }

  dimension: fields__customfield_12300__languagecode {
    type: string
    sql: ${TABLE}.fields.customfield_12300.languagecode ;;
    group_label: "Fields Customfield 12300"
    group_item_label: "Languagecode"
  }

  dimension: fields__customfield_12301 {
    type: string
    sql: ${TABLE}.fields.customfield_12301 ;;
    group_label: "Fields"
    group_item_label: "Customfield 12301"
  }

  dimension: fields__customfield_12303 {
    type: string
    sql: ${TABLE}.fields.customfield_12303 ;;
    group_label: "Fields"
    group_item_label: "Customfield 12303"
  }

  dimension: fields__customfield_12307 {
    type: string
    sql: ${TABLE}.fields.customfield_12307 ;;
    group_label: "Fields"
    group_item_label: "Customfield 12307"
  }

  dimension: fields__description {
    type: string
    sql: ${TABLE}.fields.description ;;
    group_label: "Fields"
    group_item_label: "Description"
  }

  dimension: fields__duedate {
    type: string
    sql: ${TABLE}.fields.duedate ;;
    group_label: "Fields"
    group_item_label: "Duedate"
  }

  dimension: fields__fixversions {
    hidden: yes
    sql: ${TABLE}.fields.fixversions ;;
    group_label: "Fields"
    group_item_label: "Fixversions"
  }

  dimension: fields__issuelinks {
    hidden: yes
    sql: ${TABLE}.fields.issuelinks ;;
    group_label: "Fields"
    group_item_label: "Issuelinks"
  }

  dimension: fields__issuerestriction__shoulddisplay {
    type: yesno
    sql: ${TABLE}.fields.issuerestriction.shoulddisplay ;;
    group_label: "Fields Issuerestriction"
    group_item_label: "Shoulddisplay"
  }

  dimension: fields__issuetype__avatarid {
    type: number
    value_format_name: id
    sql: ${TABLE}.fields.issuetype.avatarid ;;
    group_label: "Fields Issuetype"
    group_item_label: "Avatarid"
  }

  dimension: fields__issuetype__description {
    type: string
    sql: ${TABLE}.fields.issuetype.description ;;
    group_label: "Fields Issuetype"
    group_item_label: "Description"
  }

  dimension: fields__issuetype__entityid {
    type: string
    sql: ${TABLE}.fields.issuetype.entityid ;;
    group_label: "Fields Issuetype"
    group_item_label: "Entityid"
  }

  dimension: fields__issuetype__hierarchylevel {
    type: number
    sql: ${TABLE}.fields.issuetype.hierarchylevel ;;
    group_label: "Fields Issuetype"
    group_item_label: "Hierarchylevel"
  }

  dimension: fields__issuetype__iconurl {
    type: string
    sql: ${TABLE}.fields.issuetype.iconurl ;;
    group_label: "Fields Issuetype"
    group_item_label: "Iconurl"
  }

  dimension: fields__issuetype__id {
    type: string
    sql: ${TABLE}.fields.issuetype.id ;;
    group_label: "Fields Issuetype"
    group_item_label: "ID"
  }

  dimension: fields__issuetype__name {
    type: string
    sql: ${TABLE}.fields.issuetype.name ;;
    group_label: "Fields Issuetype"
    group_item_label: "Name"
  }

  dimension: fields__issuetype__self {
    type: string
    sql: ${TABLE}.fields.issuetype.self ;;
    group_label: "Fields Issuetype"
    group_item_label: "Self"
  }

  dimension: fields__issuetype__subtask {
    type: yesno
    sql: ${TABLE}.fields.issuetype.subtask ;;
    group_label: "Fields Issuetype"
    group_item_label: "Subtask"
  }

  dimension: fields__labels {
    hidden: yes
    sql: ${TABLE}.fields.labels ;;
    group_label: "Fields"
    group_item_label: "Labels"
  }

  dimension_group: fields__lastviewed {
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
    sql: ${TABLE}.fields.lastviewed ;;
    group_label: "Fields"
    group_item_label: "Lastviewed"
  }

  dimension: fields__parent__fields__issuetype__avatarid {
    type: number
    value_format_name: id
    sql: ${TABLE}.fields.parent.fields.issuetype.avatarid ;;
    group_label: "Fields Parent Fields Issuetype"
    group_item_label: "Avatarid"
  }

  dimension: fields__parent__fields__issuetype__description {
    type: string
    sql: ${TABLE}.fields.parent.fields.issuetype.description ;;
    group_label: "Fields Parent Fields Issuetype"
    group_item_label: "Description"
  }

  dimension: fields__parent__fields__issuetype__iconurl {
    type: string
    sql: ${TABLE}.fields.parent.fields.issuetype.iconurl ;;
    group_label: "Fields Parent Fields Issuetype"
    group_item_label: "Iconurl"
  }

  dimension: fields__parent__fields__issuetype__id {
    type: string
    sql: ${TABLE}.fields.parent.fields.issuetype.id ;;
    group_label: "Fields Parent Fields Issuetype"
    group_item_label: "ID"
  }

  dimension: fields__parent__fields__issuetype__name {
    type: string
    sql: ${TABLE}.fields.parent.fields.issuetype.name ;;
    group_label: "Fields Parent Fields Issuetype"
    group_item_label: "Name"
  }

  dimension: fields__parent__fields__issuetype__self {
    type: string
    sql: ${TABLE}.fields.parent.fields.issuetype.self ;;
    group_label: "Fields Parent Fields Issuetype"
    group_item_label: "Self"
  }

  dimension: fields__parent__fields__issuetype__subtask {
    type: yesno
    sql: ${TABLE}.fields.parent.fields.issuetype.subtask ;;
    group_label: "Fields Parent Fields Issuetype"
    group_item_label: "Subtask"
  }

  dimension: fields__parent__fields__priority__iconurl {
    type: string
    sql: ${TABLE}.fields.parent.fields.priority.iconurl ;;
    group_label: "Fields Parent Fields Priority"
    group_item_label: "Iconurl"
  }

  dimension: fields__parent__fields__priority__id {
    type: string
    sql: ${TABLE}.fields.parent.fields.priority.id ;;
    group_label: "Fields Parent Fields Priority"
    group_item_label: "ID"
  }

  dimension: fields__parent__fields__priority__name {
    type: string
    sql: ${TABLE}.fields.parent.fields.priority.name ;;
    group_label: "Fields Parent Fields Priority"
    group_item_label: "Name"
  }

  dimension: fields__parent__fields__priority__self {
    type: string
    sql: ${TABLE}.fields.parent.fields.priority.self ;;
    group_label: "Fields Parent Fields Priority"
    group_item_label: "Self"
  }

  dimension: fields__parent__fields__status__description {
    type: string
    sql: ${TABLE}.fields.parent.fields.status.description ;;
    group_label: "Fields Parent Fields Status"
    group_item_label: "Description"
  }

  dimension: fields__parent__fields__status__iconurl {
    type: string
    sql: ${TABLE}.fields.parent.fields.status.iconurl ;;
    group_label: "Fields Parent Fields Status"
    group_item_label: "Iconurl"
  }

  dimension: fields__parent__fields__status__id {
    type: string
    sql: ${TABLE}.fields.parent.fields.status.id ;;
    group_label: "Fields Parent Fields Status"
    group_item_label: "ID"
  }

  dimension: fields__parent__fields__status__name {
    type: string
    sql: ${TABLE}.fields.parent.fields.status.name ;;
    group_label: "Fields Parent Fields Status"
    group_item_label: "Name"
  }

  dimension: fields__parent__fields__status__self {
    type: string
    sql: ${TABLE}.fields.parent.fields.status.self ;;
    group_label: "Fields Parent Fields Status"
    group_item_label: "Self"
  }

  dimension: fields__parent__fields__status__statuscategory__colorname {
    type: string
    sql: ${TABLE}.fields.parent.fields.status.statuscategory.colorname ;;
    group_label: "Fields Parent Fields Status Statuscategory"
    group_item_label: "Colorname"
  }

  dimension: fields__parent__fields__status__statuscategory__id {
    type: number
    sql: ${TABLE}.fields.parent.fields.status.statuscategory.id ;;
    group_label: "Fields Parent Fields Status Statuscategory"
    group_item_label: "ID"
  }

  dimension: fields__parent__fields__status__statuscategory__key {
    type: string
    sql: ${TABLE}.fields.parent.fields.status.statuscategory.key ;;
    group_label: "Fields Parent Fields Status Statuscategory"
    group_item_label: "Key"
  }

  dimension: fields__parent__fields__status__statuscategory__name {
    type: string
    sql: ${TABLE}.fields.parent.fields.status.statuscategory.name ;;
    group_label: "Fields Parent Fields Status Statuscategory"
    group_item_label: "Name"
  }

  dimension: fields__parent__fields__status__statuscategory__self {
    type: string
    sql: ${TABLE}.fields.parent.fields.status.statuscategory.self ;;
    group_label: "Fields Parent Fields Status Statuscategory"
    group_item_label: "Self"
  }

  dimension: fields__parent__fields__summary {
    type: string
    sql: ${TABLE}.fields.parent.fields.summary ;;
    group_label: "Fields Parent Fields"
    group_item_label: "Summary"
  }

  dimension: fields__parent__id {
    type: string
    sql: ${TABLE}.fields.parent.id ;;
    group_label: "Fields Parent"
    group_item_label: "ID"
  }

  dimension: fields__parent__key {
    type: string
    sql: ${TABLE}.fields.parent.key ;;
    group_label: "Fields Parent"
    group_item_label: "Key"
  }

  dimension: fields__parent__self {
    type: string
    sql: ${TABLE}.fields.parent.self ;;
    group_label: "Fields Parent"
    group_item_label: "Self"
  }

  dimension: fields__priority__iconurl {
    type: string
    sql: ${TABLE}.fields.priority.iconurl ;;
    group_label: "Fields Priority"
    group_item_label: "Iconurl"
  }

  dimension: fields__priority__id {
    type: string
    sql: ${TABLE}.fields.priority.id ;;
    group_label: "Fields Priority"
    group_item_label: "ID"
  }

  dimension: fields__priority__name {
    type: string
    sql: ${TABLE}.fields.priority.name ;;
    group_label: "Fields Priority"
    group_item_label: "Name"
  }

  dimension: fields__priority__self {
    type: string
    sql: ${TABLE}.fields.priority.self ;;
    group_label: "Fields Priority"
    group_item_label: "Self"
  }

  dimension: fields__progress__percent {
    type: number
    sql: ${TABLE}.fields.progress.percent ;;
    group_label: "Fields Progress"
    group_item_label: "Percent"
  }

  dimension: fields__progress__progress {
    type: number
    sql: ${TABLE}.fields.progress.progress ;;
    group_label: "Fields Progress"
    group_item_label: "Progress"
  }

  dimension: fields__progress__total {
    type: number
    sql: ${TABLE}.fields.progress.total ;;
    group_label: "Fields Progress"
    group_item_label: "Total"
  }

  dimension: fields__project__avatarurls___16x16 {
    type: string
    sql: ${TABLE}.fields.project.avatarurls._16x16 ;;
    group_label: "Fields Project Avatarurls"
    group_item_label: "16x16"
  }

  dimension: fields__project__avatarurls___24x24 {
    type: string
    sql: ${TABLE}.fields.project.avatarurls._24x24 ;;
    group_label: "Fields Project Avatarurls"
    group_item_label: "24x24"
  }

  dimension: fields__project__avatarurls___32x32 {
    type: string
    sql: ${TABLE}.fields.project.avatarurls._32x32 ;;
    group_label: "Fields Project Avatarurls"
    group_item_label: "32x32"
  }

  dimension: fields__project__avatarurls___48x48 {
    type: string
    sql: ${TABLE}.fields.project.avatarurls._48x48 ;;
    group_label: "Fields Project Avatarurls"
    group_item_label: "48x48"
  }

  dimension: fields__project__id {
    type: string
    sql: ${TABLE}.fields.project.id ;;
    group_label: "Fields Project"
    group_item_label: "ID"
  }

  dimension: fields__project__key {
    type: string
    sql: ${TABLE}.fields.project.key ;;
    group_label: "Fields Project"
    group_item_label: "Key"
  }

  dimension: fields__project__name {
    type: string
    sql: ${TABLE}.fields.project.name ;;
    group_label: "Fields Project"
    group_item_label: "Name"
  }

  dimension: fields__project__projectcategory__description {
    type: string
    sql: ${TABLE}.fields.project.projectcategory.description ;;
    group_label: "Fields Project Projectcategory"
    group_item_label: "Description"
  }

  dimension: fields__project__projectcategory__id {
    type: string
    sql: ${TABLE}.fields.project.projectcategory.id ;;
    group_label: "Fields Project Projectcategory"
    group_item_label: "ID"
  }

  dimension: fields__project__projectcategory__name {
    type: string
    sql: ${TABLE}.fields.project.projectcategory.name ;;
    group_label: "Fields Project Projectcategory"
    group_item_label: "Name"
  }

  dimension: fields__project__projectcategory__self {
    type: string
    sql: ${TABLE}.fields.project.projectcategory.self ;;
    group_label: "Fields Project Projectcategory"
    group_item_label: "Self"
  }

  dimension: fields__project__projecttypekey {
    type: string
    sql: ${TABLE}.fields.project.projecttypekey ;;
    group_label: "Fields Project"
    group_item_label: "Projecttypekey"
  }

  dimension: fields__project__self {
    type: string
    sql: ${TABLE}.fields.project.self ;;
    group_label: "Fields Project"
    group_item_label: "Self"
  }

  dimension: fields__project__simplified {
    type: yesno
    sql: ${TABLE}.fields.project.simplified ;;
    group_label: "Fields Project"
    group_item_label: "Simplified"
  }

  dimension: fields__reporter__accountid {
    type: string
    sql: ${TABLE}.fields.reporter.accountid ;;
    group_label: "Fields Reporter"
    group_item_label: "Accountid"
  }

  dimension: fields__reporter__accounttype {
    type: string
    sql: ${TABLE}.fields.reporter.accounttype ;;
    group_label: "Fields Reporter"
    group_item_label: "Accounttype"
  }

  dimension: fields__reporter__active {
    type: yesno
    sql: ${TABLE}.fields.reporter.active ;;
    group_label: "Fields Reporter"
    group_item_label: "Active"
  }

  dimension: fields__reporter__avatarurls___16x16 {
    type: string
    sql: ${TABLE}.fields.reporter.avatarurls._16x16 ;;
    group_label: "Fields Reporter Avatarurls"
    group_item_label: "16x16"
  }

  dimension: fields__reporter__avatarurls___24x24 {
    type: string
    sql: ${TABLE}.fields.reporter.avatarurls._24x24 ;;
    group_label: "Fields Reporter Avatarurls"
    group_item_label: "24x24"
  }

  dimension: fields__reporter__avatarurls___32x32 {
    type: string
    sql: ${TABLE}.fields.reporter.avatarurls._32x32 ;;
    group_label: "Fields Reporter Avatarurls"
    group_item_label: "32x32"
  }

  dimension: fields__reporter__avatarurls___48x48 {
    type: string
    sql: ${TABLE}.fields.reporter.avatarurls._48x48 ;;
    group_label: "Fields Reporter Avatarurls"
    group_item_label: "48x48"
  }

  dimension: fields__reporter__displayname {
    type: string
    sql: ${TABLE}.fields.reporter.displayname ;;
    group_label: "Fields Reporter"
    group_item_label: "Displayname"
  }

  dimension: fields__reporter__emailaddress {
    type: string
    sql: ${TABLE}.fields.reporter.emailaddress ;;
    group_label: "Fields Reporter"
    group_item_label: "Emailaddress"
  }

  dimension: fields__reporter__self {
    type: string
    sql: ${TABLE}.fields.reporter.self ;;
    group_label: "Fields Reporter"
    group_item_label: "Self"
  }

  dimension: fields__reporter__timezone {
    type: string
    sql: ${TABLE}.fields.reporter.timezone ;;
    group_label: "Fields Reporter"
    group_item_label: "Timezone"
  }

  dimension: fields__resolution__description {
    type: string
    sql: ${TABLE}.fields.resolution.description ;;
    group_label: "Fields Resolution"
    group_item_label: "Description"
  }

  dimension: fields__resolution__id {
    type: string
    sql: ${TABLE}.fields.resolution.id ;;
    group_label: "Fields Resolution"
    group_item_label: "ID"
  }

  dimension: fields__resolution__name {
    type: string
    sql: ${TABLE}.fields.resolution.name ;;
    group_label: "Fields Resolution"
    group_item_label: "Name"
  }

  dimension: fields__resolution__self {
    type: string
    sql: ${TABLE}.fields.resolution.self ;;
    group_label: "Fields Resolution"
    group_item_label: "Self"
  }

  dimension: fields__resolutiondate {
    type: string
    sql: ${TABLE}.fields.resolutiondate ;;
    group_label: "Fields"
    group_item_label: "Resolutiondate"
  }

  dimension: fields__status__description {
    type: string
    sql: ${TABLE}.fields.status.description ;;
    group_label: "Fields Status"
    group_item_label: "Description"
  }

  dimension: fields__status__iconurl {
    type: string
    sql: ${TABLE}.fields.status.iconurl ;;
    group_label: "Fields Status"
    group_item_label: "Iconurl"
  }

  dimension: fields__status__id {
    type: string
    sql: ${TABLE}.fields.status.id ;;
    group_label: "Fields Status"
    group_item_label: "ID"
  }

  dimension: fields__status__name {
    type: string
    sql: ${TABLE}.fields.status.name ;;
    group_label: "Fields Status"
    group_item_label: "Name"
  }

  dimension: fields__status__self {
    type: string
    sql: ${TABLE}.fields.status.self ;;
    group_label: "Fields Status"
    group_item_label: "Self"
  }

  dimension: fields__status__statuscategory__colorname {
    type: string
    sql: ${TABLE}.fields.status.statuscategory.colorname ;;
    group_label: "Fields Status Statuscategory"
    group_item_label: "Colorname"
  }

  dimension: fields__status__statuscategory__id {
    type: number
    sql: ${TABLE}.fields.status.statuscategory.id ;;
    group_label: "Fields Status Statuscategory"
    group_item_label: "ID"
  }

  dimension: fields__status__statuscategory__key {
    type: string
    sql: ${TABLE}.fields.status.statuscategory.key ;;
    group_label: "Fields Status Statuscategory"
    group_item_label: "Key"
  }

  dimension: fields__status__statuscategory__name {
    type: string
    sql: ${TABLE}.fields.status.statuscategory.name ;;
    group_label: "Fields Status Statuscategory"
    group_item_label: "Name"
  }

  dimension: fields__status__statuscategory__self {
    type: string
    sql: ${TABLE}.fields.status.statuscategory.self ;;
    group_label: "Fields Status Statuscategory"
    group_item_label: "Self"
  }

  dimension: fields__statuscategorychangedate {
    type: string
    sql: ${TABLE}.fields.statuscategorychangedate ;;
    group_label: "Fields"
    group_item_label: "Statuscategorychangedate"
  }

  dimension: fields__subtasks {
    hidden: yes
    sql: ${TABLE}.fields.subtasks ;;
    group_label: "Fields"
    group_item_label: "Subtasks"
  }

  dimension: fields__summary {
    type: string
    sql: ${TABLE}.fields.summary ;;
    group_label: "Fields"
    group_item_label: "Summary"
  }

  dimension: fields__timeestimate {
    type: number
    sql: ${TABLE}.fields.timeestimate ;;
    group_label: "Fields"
    group_item_label: "Timeestimate"
  }

  dimension: fields__timeoriginalestimate {
    type: number
    sql: ${TABLE}.fields.timeoriginalestimate ;;
    group_label: "Fields"
    group_item_label: "Timeoriginalestimate"
  }

  dimension: fields__timespent {
    type: number
    sql: ${TABLE}.fields.timespent ;;
    group_label: "Fields"
    group_item_label: "Timespent"
  }

  dimension: fields__timetracking__originalestimate {
    type: string
    sql: ${TABLE}.fields.timetracking.originalestimate ;;
    group_label: "Fields Timetracking"
    group_item_label: "Originalestimate"
  }

  dimension: fields__timetracking__originalestimateseconds {
    type: number
    sql: ${TABLE}.fields.timetracking.originalestimateseconds ;;
    group_label: "Fields Timetracking"
    group_item_label: "Originalestimateseconds"
  }

  dimension: fields__timetracking__remainingestimate {
    type: string
    sql: ${TABLE}.fields.timetracking.remainingestimate ;;
    group_label: "Fields Timetracking"
    group_item_label: "Remainingestimate"
  }

  dimension: fields__timetracking__remainingestimateseconds {
    type: number
    sql: ${TABLE}.fields.timetracking.remainingestimateseconds ;;
    group_label: "Fields Timetracking"
    group_item_label: "Remainingestimateseconds"
  }

  dimension: fields__timetracking__timespent {
    type: string
    sql: ${TABLE}.fields.timetracking.timespent ;;
    group_label: "Fields Timetracking"
    group_item_label: "Timespent"
  }

  dimension: fields__timetracking__timespentseconds {
    type: number
    sql: ${TABLE}.fields.timetracking.timespentseconds ;;
    group_label: "Fields Timetracking"
    group_item_label: "Timespentseconds"
  }

  dimension_group: fields__updated {
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
    sql: ${TABLE}.fields.updated ;;
    group_label: "Fields"
    group_item_label: "Updated"
  }

  dimension: fields__votes__hasvoted {
    type: yesno
    sql: ${TABLE}.fields.votes.hasvoted ;;
    group_label: "Fields Votes"
    group_item_label: "Hasvoted"
  }

  dimension: fields__votes__self {
    type: string
    sql: ${TABLE}.fields.votes.self ;;
    group_label: "Fields Votes"
    group_item_label: "Self"
  }

  dimension: fields__votes__votes {
    type: number
    sql: ${TABLE}.fields.votes.votes ;;
    group_label: "Fields Votes"
    group_item_label: "Votes"
  }

  dimension: fields__watches__iswatching {
    type: yesno
    sql: ${TABLE}.fields.watches.iswatching ;;
    group_label: "Fields Watches"
    group_item_label: "Iswatching"
  }

  dimension: fields__watches__self {
    type: string
    sql: ${TABLE}.fields.watches.self ;;
    group_label: "Fields Watches"
    group_item_label: "Self"
  }

  dimension: fields__watches__watchcount {
    type: number
    sql: ${TABLE}.fields.watches.watchcount ;;
    group_label: "Fields Watches"
    group_item_label: "Watchcount"
  }

  dimension: fields__workratio {
    type: number
    sql: ${TABLE}.fields.workratio ;;
    group_label: "Fields"
    group_item_label: "Workratio"
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: self {
    type: string
    sql: ${TABLE}.self ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      fields__status__name,
      fields__project__name,
      fields__priority__name,
      fields__issuetype__name,
      fields__resolution__name,
      fields__creator__displayname,
      fields__assignee__displayname,
      fields__reporter__displayname,
      fields__parent__fields__status__name,
      fields__status__statuscategory__name,
      fields__parent__fields__priority__name,
      fields__parent__fields__issuetype__name,
      fields__project__projectcategory__name,
      fields__customfield_10700__displayname,
      fields__customfield_12300__displayname,
      fields__status__statuscategory__colorname,
      fields__parent__fields__status__statuscategory__name,
      fields__parent__fields__status__statuscategory__colorname,
      issue_transitions.count,
      issue_comments.count
    ]
  }
}

view: issues__fields__labels {
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: issues__fields__subtasks {
  dimension: value__fields__issuetype__avatarid {
    type: number
    value_format_name: id
    sql: ${TABLE}.value.fields.issuetype.avatarid ;;
    group_label: "Value Fields Issuetype"
    group_item_label: "Avatarid"
  }

  dimension: value__fields__issuetype__description {
    type: string
    sql: ${TABLE}.value.fields.issuetype.description ;;
    group_label: "Value Fields Issuetype"
    group_item_label: "Description"
  }

  dimension: value__fields__issuetype__iconurl {
    type: string
    sql: ${TABLE}.value.fields.issuetype.iconurl ;;
    group_label: "Value Fields Issuetype"
    group_item_label: "Iconurl"
  }

  dimension: value__fields__issuetype__id {
    type: string
    sql: ${TABLE}.value.fields.issuetype.id ;;
    group_label: "Value Fields Issuetype"
    group_item_label: "ID"
  }

  dimension: value__fields__issuetype__name {
    type: string
    sql: ${TABLE}.value.fields.issuetype.name ;;
    group_label: "Value Fields Issuetype"
    group_item_label: "Name"
  }

  dimension: value__fields__issuetype__self {
    type: string
    sql: ${TABLE}.value.fields.issuetype.self ;;
    group_label: "Value Fields Issuetype"
    group_item_label: "Self"
  }

  dimension: value__fields__issuetype__subtask {
    type: yesno
    sql: ${TABLE}.value.fields.issuetype.subtask ;;
    group_label: "Value Fields Issuetype"
    group_item_label: "Subtask"
  }

  dimension: value__fields__priority__iconurl {
    type: string
    sql: ${TABLE}.value.fields.priority.iconurl ;;
    group_label: "Value Fields Priority"
    group_item_label: "Iconurl"
  }

  dimension: value__fields__priority__id {
    type: string
    sql: ${TABLE}.value.fields.priority.id ;;
    group_label: "Value Fields Priority"
    group_item_label: "ID"
  }

  dimension: value__fields__priority__name {
    type: string
    sql: ${TABLE}.value.fields.priority.name ;;
    group_label: "Value Fields Priority"
    group_item_label: "Name"
  }

  dimension: value__fields__priority__self {
    type: string
    sql: ${TABLE}.value.fields.priority.self ;;
    group_label: "Value Fields Priority"
    group_item_label: "Self"
  }

  dimension: value__fields__status__description {
    type: string
    sql: ${TABLE}.value.fields.status.description ;;
    group_label: "Value Fields Status"
    group_item_label: "Description"
  }

  dimension: value__fields__status__iconurl {
    type: string
    sql: ${TABLE}.value.fields.status.iconurl ;;
    group_label: "Value Fields Status"
    group_item_label: "Iconurl"
  }

  dimension: value__fields__status__id {
    type: string
    sql: ${TABLE}.value.fields.status.id ;;
    group_label: "Value Fields Status"
    group_item_label: "ID"
  }

  dimension: value__fields__status__name {
    type: string
    sql: ${TABLE}.value.fields.status.name ;;
    group_label: "Value Fields Status"
    group_item_label: "Name"
  }

  dimension: value__fields__status__self {
    type: string
    sql: ${TABLE}.value.fields.status.self ;;
    group_label: "Value Fields Status"
    group_item_label: "Self"
  }

  dimension: value__fields__status__statuscategory__colorname {
    type: string
    sql: ${TABLE}.value.fields.status.statuscategory.colorname ;;
    group_label: "Value Fields Status Statuscategory"
    group_item_label: "Colorname"
  }

  dimension: value__fields__status__statuscategory__id {
    type: number
    sql: ${TABLE}.value.fields.status.statuscategory.id ;;
    group_label: "Value Fields Status Statuscategory"
    group_item_label: "ID"
  }

  dimension: value__fields__status__statuscategory__key {
    type: string
    sql: ${TABLE}.value.fields.status.statuscategory.key ;;
    group_label: "Value Fields Status Statuscategory"
    group_item_label: "Key"
  }

  dimension: value__fields__status__statuscategory__name {
    type: string
    sql: ${TABLE}.value.fields.status.statuscategory.name ;;
    group_label: "Value Fields Status Statuscategory"
    group_item_label: "Name"
  }

  dimension: value__fields__status__statuscategory__self {
    type: string
    sql: ${TABLE}.value.fields.status.statuscategory.self ;;
    group_label: "Value Fields Status Statuscategory"
    group_item_label: "Self"
  }

  dimension: value__fields__summary {
    type: string
    sql: ${TABLE}.value.fields.summary ;;
    group_label: "Value Fields"
    group_item_label: "Summary"
  }

  dimension: value__id {
    type: string
    sql: ${TABLE}.value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__key {
    type: string
    sql: ${TABLE}.value.key ;;
    group_label: "Value"
    group_item_label: "Key"
  }

  dimension: value__self {
    type: string
    sql: ${TABLE}.value.self ;;
    group_label: "Value"
    group_item_label: "Self"
  }
}

view: issues__fields__issuelinks {
  dimension: value__id {
    type: string
    sql: ${TABLE}.value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__inwardissue__fields__issuetype__avatarid {
    type: number
    value_format_name: id
    sql: ${TABLE}.value.inwardissue.fields.issuetype.avatarid ;;
    group_label: "Value Inwardissue Fields Issuetype"
    group_item_label: "Avatarid"
  }

  dimension: value__inwardissue__fields__issuetype__description {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.issuetype.description ;;
    group_label: "Value Inwardissue Fields Issuetype"
    group_item_label: "Description"
  }

  dimension: value__inwardissue__fields__issuetype__iconurl {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.issuetype.iconurl ;;
    group_label: "Value Inwardissue Fields Issuetype"
    group_item_label: "Iconurl"
  }

  dimension: value__inwardissue__fields__issuetype__id {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.issuetype.id ;;
    group_label: "Value Inwardissue Fields Issuetype"
    group_item_label: "ID"
  }

  dimension: value__inwardissue__fields__issuetype__name {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.issuetype.name ;;
    group_label: "Value Inwardissue Fields Issuetype"
    group_item_label: "Name"
  }

  dimension: value__inwardissue__fields__issuetype__self {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.issuetype.self ;;
    group_label: "Value Inwardissue Fields Issuetype"
    group_item_label: "Self"
  }

  dimension: value__inwardissue__fields__issuetype__subtask {
    type: yesno
    sql: ${TABLE}.value.inwardissue.fields.issuetype.subtask ;;
    group_label: "Value Inwardissue Fields Issuetype"
    group_item_label: "Subtask"
  }

  dimension: value__inwardissue__fields__priority__iconurl {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.priority.iconurl ;;
    group_label: "Value Inwardissue Fields Priority"
    group_item_label: "Iconurl"
  }

  dimension: value__inwardissue__fields__priority__id {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.priority.id ;;
    group_label: "Value Inwardissue Fields Priority"
    group_item_label: "ID"
  }

  dimension: value__inwardissue__fields__priority__name {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.priority.name ;;
    group_label: "Value Inwardissue Fields Priority"
    group_item_label: "Name"
  }

  dimension: value__inwardissue__fields__priority__self {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.priority.self ;;
    group_label: "Value Inwardissue Fields Priority"
    group_item_label: "Self"
  }

  dimension: value__inwardissue__fields__status__description {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.status.description ;;
    group_label: "Value Inwardissue Fields Status"
    group_item_label: "Description"
  }

  dimension: value__inwardissue__fields__status__iconurl {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.status.iconurl ;;
    group_label: "Value Inwardissue Fields Status"
    group_item_label: "Iconurl"
  }

  dimension: value__inwardissue__fields__status__id {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.status.id ;;
    group_label: "Value Inwardissue Fields Status"
    group_item_label: "ID"
  }

  dimension: value__inwardissue__fields__status__name {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.status.name ;;
    group_label: "Value Inwardissue Fields Status"
    group_item_label: "Name"
  }

  dimension: value__inwardissue__fields__status__self {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.status.self ;;
    group_label: "Value Inwardissue Fields Status"
    group_item_label: "Self"
  }

  dimension: value__inwardissue__fields__status__statuscategory__colorname {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.status.statuscategory.colorname ;;
    group_label: "Value Inwardissue Fields Status Statuscategory"
    group_item_label: "Colorname"
  }

  dimension: value__inwardissue__fields__status__statuscategory__id {
    type: number
    sql: ${TABLE}.value.inwardissue.fields.status.statuscategory.id ;;
    group_label: "Value Inwardissue Fields Status Statuscategory"
    group_item_label: "ID"
  }

  dimension: value__inwardissue__fields__status__statuscategory__key {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.status.statuscategory.key ;;
    group_label: "Value Inwardissue Fields Status Statuscategory"
    group_item_label: "Key"
  }

  dimension: value__inwardissue__fields__status__statuscategory__name {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.status.statuscategory.name ;;
    group_label: "Value Inwardissue Fields Status Statuscategory"
    group_item_label: "Name"
  }

  dimension: value__inwardissue__fields__status__statuscategory__self {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.status.statuscategory.self ;;
    group_label: "Value Inwardissue Fields Status Statuscategory"
    group_item_label: "Self"
  }

  dimension: value__inwardissue__fields__summary {
    type: string
    sql: ${TABLE}.value.inwardissue.fields.summary ;;
    group_label: "Value Inwardissue Fields"
    group_item_label: "Summary"
  }

  dimension: value__inwardissue__id {
    type: string
    sql: ${TABLE}.value.inwardissue.id ;;
    group_label: "Value Inwardissue"
    group_item_label: "ID"
  }

  dimension: value__inwardissue__key {
    type: string
    sql: ${TABLE}.value.inwardissue.key ;;
    group_label: "Value Inwardissue"
    group_item_label: "Key"
  }

  dimension: value__inwardissue__self {
    type: string
    sql: ${TABLE}.value.inwardissue.self ;;
    group_label: "Value Inwardissue"
    group_item_label: "Self"
  }

  dimension: value__outwardissue__fields__issuetype__avatarid {
    type: number
    value_format_name: id
    sql: ${TABLE}.value.outwardissue.fields.issuetype.avatarid ;;
    group_label: "Value Outwardissue Fields Issuetype"
    group_item_label: "Avatarid"
  }

  dimension: value__outwardissue__fields__issuetype__description {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.issuetype.description ;;
    group_label: "Value Outwardissue Fields Issuetype"
    group_item_label: "Description"
  }

  dimension: value__outwardissue__fields__issuetype__iconurl {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.issuetype.iconurl ;;
    group_label: "Value Outwardissue Fields Issuetype"
    group_item_label: "Iconurl"
  }

  dimension: value__outwardissue__fields__issuetype__id {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.issuetype.id ;;
    group_label: "Value Outwardissue Fields Issuetype"
    group_item_label: "ID"
  }

  dimension: value__outwardissue__fields__issuetype__name {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.issuetype.name ;;
    group_label: "Value Outwardissue Fields Issuetype"
    group_item_label: "Name"
  }

  dimension: value__outwardissue__fields__issuetype__self {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.issuetype.self ;;
    group_label: "Value Outwardissue Fields Issuetype"
    group_item_label: "Self"
  }

  dimension: value__outwardissue__fields__issuetype__subtask {
    type: yesno
    sql: ${TABLE}.value.outwardissue.fields.issuetype.subtask ;;
    group_label: "Value Outwardissue Fields Issuetype"
    group_item_label: "Subtask"
  }

  dimension: value__outwardissue__fields__priority__iconurl {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.priority.iconurl ;;
    group_label: "Value Outwardissue Fields Priority"
    group_item_label: "Iconurl"
  }

  dimension: value__outwardissue__fields__priority__id {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.priority.id ;;
    group_label: "Value Outwardissue Fields Priority"
    group_item_label: "ID"
  }

  dimension: value__outwardissue__fields__priority__name {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.priority.name ;;
    group_label: "Value Outwardissue Fields Priority"
    group_item_label: "Name"
  }

  dimension: value__outwardissue__fields__priority__self {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.priority.self ;;
    group_label: "Value Outwardissue Fields Priority"
    group_item_label: "Self"
  }

  dimension: value__outwardissue__fields__status__description {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.status.description ;;
    group_label: "Value Outwardissue Fields Status"
    group_item_label: "Description"
  }

  dimension: value__outwardissue__fields__status__iconurl {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.status.iconurl ;;
    group_label: "Value Outwardissue Fields Status"
    group_item_label: "Iconurl"
  }

  dimension: value__outwardissue__fields__status__id {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.status.id ;;
    group_label: "Value Outwardissue Fields Status"
    group_item_label: "ID"
  }

  dimension: value__outwardissue__fields__status__name {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.status.name ;;
    group_label: "Value Outwardissue Fields Status"
    group_item_label: "Name"
  }

  dimension: value__outwardissue__fields__status__self {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.status.self ;;
    group_label: "Value Outwardissue Fields Status"
    group_item_label: "Self"
  }

  dimension: value__outwardissue__fields__status__statuscategory__colorname {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.status.statuscategory.colorname ;;
    group_label: "Value Outwardissue Fields Status Statuscategory"
    group_item_label: "Colorname"
  }

  dimension: value__outwardissue__fields__status__statuscategory__id {
    type: number
    sql: ${TABLE}.value.outwardissue.fields.status.statuscategory.id ;;
    group_label: "Value Outwardissue Fields Status Statuscategory"
    group_item_label: "ID"
  }

  dimension: value__outwardissue__fields__status__statuscategory__key {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.status.statuscategory.key ;;
    group_label: "Value Outwardissue Fields Status Statuscategory"
    group_item_label: "Key"
  }

  dimension: value__outwardissue__fields__status__statuscategory__name {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.status.statuscategory.name ;;
    group_label: "Value Outwardissue Fields Status Statuscategory"
    group_item_label: "Name"
  }

  dimension: value__outwardissue__fields__status__statuscategory__self {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.status.statuscategory.self ;;
    group_label: "Value Outwardissue Fields Status Statuscategory"
    group_item_label: "Self"
  }

  dimension: value__outwardissue__fields__summary {
    type: string
    sql: ${TABLE}.value.outwardissue.fields.summary ;;
    group_label: "Value Outwardissue Fields"
    group_item_label: "Summary"
  }

  dimension: value__outwardissue__id {
    type: string
    sql: ${TABLE}.value.outwardissue.id ;;
    group_label: "Value Outwardissue"
    group_item_label: "ID"
  }

  dimension: value__outwardissue__key {
    type: string
    sql: ${TABLE}.value.outwardissue.key ;;
    group_label: "Value Outwardissue"
    group_item_label: "Key"
  }

  dimension: value__outwardissue__self {
    type: string
    sql: ${TABLE}.value.outwardissue.self ;;
    group_label: "Value Outwardissue"
    group_item_label: "Self"
  }

  dimension: value__self {
    type: string
    sql: ${TABLE}.value.self ;;
    group_label: "Value"
    group_item_label: "Self"
  }

  dimension: value__type__id {
    type: string
    sql: ${TABLE}.value.type.id ;;
    group_label: "Value Type"
    group_item_label: "ID"
  }

  dimension: value__type__inward {
    type: string
    sql: ${TABLE}.value.type.inward ;;
    group_label: "Value Type"
    group_item_label: "Inward"
  }

  dimension: value__type__name {
    type: string
    sql: ${TABLE}.value.type.name ;;
    group_label: "Value Type"
    group_item_label: "Name"
  }

  dimension: value__type__outward {
    type: string
    sql: ${TABLE}.value.type.outward ;;
    group_label: "Value Type"
    group_item_label: "Outward"
  }

  dimension: value__type__self {
    type: string
    sql: ${TABLE}.value.type.self ;;
    group_label: "Value Type"
    group_item_label: "Self"
  }
}

view: issues__fields__attachment {
  dimension: value__author__accountid {
    type: string
    sql: ${TABLE}.value.author.accountid ;;
    group_label: "Value Author"
    group_item_label: "Accountid"
  }

  dimension: value__author__active {
    type: yesno
    sql: ${TABLE}.value.author.active ;;
    group_label: "Value Author"
    group_item_label: "Active"
  }

  dimension: value__author__avatarurls___16x16 {
    type: string
    sql: ${TABLE}.value.author.avatarurls._16x16 ;;
    group_label: "Value Author Avatarurls"
    group_item_label: "16x16"
  }

  dimension: value__author__avatarurls___24x24 {
    type: string
    sql: ${TABLE}.value.author.avatarurls._24x24 ;;
    group_label: "Value Author Avatarurls"
    group_item_label: "24x24"
  }

  dimension: value__author__avatarurls___32x32 {
    type: string
    sql: ${TABLE}.value.author.avatarurls._32x32 ;;
    group_label: "Value Author Avatarurls"
    group_item_label: "32x32"
  }

  dimension: value__author__avatarurls___48x48 {
    type: string
    sql: ${TABLE}.value.author.avatarurls._48x48 ;;
    group_label: "Value Author Avatarurls"
    group_item_label: "48x48"
  }

  dimension: value__author__displayname {
    type: string
    sql: ${TABLE}.value.author.displayname ;;
    group_label: "Value Author"
    group_item_label: "Displayname"
  }

  dimension: value__author__emailaddress {
    type: string
    sql: ${TABLE}.value.author.emailaddress ;;
    group_label: "Value Author"
    group_item_label: "Emailaddress"
  }

  dimension: value__author__self {
    type: string
    sql: ${TABLE}.value.author.self ;;
    group_label: "Value Author"
    group_item_label: "Self"
  }

  dimension: value__author__timezone {
    type: string
    sql: ${TABLE}.value.author.timezone ;;
    group_label: "Value Author"
    group_item_label: "Timezone"
  }

  dimension: value__content {
    type: string
    sql: ${TABLE}.value.content ;;
    group_label: "Value"
    group_item_label: "Content"
  }

  dimension_group: value__created {
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
    sql: ${TABLE}.value.created ;;
    group_label: "Value"
    group_item_label: "Created"
  }

  dimension: value__filename {
    type: string
    sql: ${TABLE}.value.filename ;;
    group_label: "Value"
    group_item_label: "Filename"
  }

  dimension: value__id {
    type: string
    sql: ${TABLE}.value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__mimetype {
    type: string
    sql: ${TABLE}.value.mimetype ;;
    group_label: "Value"
    group_item_label: "Mimetype"
  }

  dimension: value__self {
    type: string
    sql: ${TABLE}.value.self ;;
    group_label: "Value"
    group_item_label: "Self"
  }

  dimension: value__size {
    type: number
    sql: ${TABLE}.value.size ;;
    group_label: "Value"
    group_item_label: "Size"
  }

  dimension: value__thumbnail {
    type: string
    sql: ${TABLE}.value.thumbnail ;;
    group_label: "Value"
    group_item_label: "Thumbnail"
  }
}

view: issues__fields__fixversions {
  dimension: value__archived {
    type: yesno
    sql: ${TABLE}.value.archived ;;
    group_label: "Value"
    group_item_label: "Archived"
  }

  dimension: value__description {
    type: string
    sql: ${TABLE}.value.description ;;
    group_label: "Value"
    group_item_label: "Description"
  }

  dimension: value__id {
    type: string
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

  dimension: value__released {
    type: yesno
    sql: ${TABLE}.value.released ;;
    group_label: "Value"
    group_item_label: "Released"
  }

  dimension: value__releasedate {
    type: string
    sql: ${TABLE}.value.releasedate ;;
    group_label: "Value"
    group_item_label: "Releasedate"
  }

  dimension: value__self {
    type: string
    sql: ${TABLE}.value.self ;;
    group_label: "Value"
    group_item_label: "Self"
  }
}

view: issues__fields__customfield_10300 {
  dimension: value__id {
    type: string
    sql: ${TABLE}.value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__self {
    type: string
    sql: ${TABLE}.value.self ;;
    group_label: "Value"
    group_item_label: "Self"
  }

  dimension: value__value {
    type: string
    sql: ${TABLE}.value.value ;;
    group_label: "Value"
    group_item_label: "Value"
  }
}

view: issues__fields__customfield_11900 {
  dimension: value___links__self {
    type: string
    sql: ${TABLE}.value._links.self ;;
    group_label: "Value Links"
    group_item_label: "Self"
  }

  dimension: value__id {
    type: string
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
}

view: issues__fields__customfield_10007 {
  dimension: value__boardid {
    type: number
    value_format_name: id
    sql: ${TABLE}.value.boardid ;;
    group_label: "Value"
    group_item_label: "Boardid"
  }

  dimension: value__completedate {
    type: string
    sql: ${TABLE}.value.completedate ;;
    group_label: "Value"
    group_item_label: "Completedate"
  }

  dimension: value__enddate {
    type: string
    sql: ${TABLE}.value.enddate ;;
    group_label: "Value"
    group_item_label: "Enddate"
  }

  dimension: value__goal {
    type: string
    sql: ${TABLE}.value.goal ;;
    group_label: "Value"
    group_item_label: "Goal"
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

  dimension: value__startdate {
    type: string
    sql: ${TABLE}.value.startdate ;;
    group_label: "Value"
    group_item_label: "Startdate"
  }

  dimension: value__state {
    type: string
    sql: ${TABLE}.value.state ;;
    group_label: "Value"
    group_item_label: "State"
  }
}

view: issues__fields__customfield_10002 {
  dimension: value__id {
    type: string
    sql: ${TABLE}.value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__self {
    type: string
    sql: ${TABLE}.value.self ;;
    group_label: "Value"
    group_item_label: "Self"
  }

  dimension: value__value {
    type: string
    sql: ${TABLE}.value.value ;;
    group_label: "Value"
    group_item_label: "Value"
  }
}

view: issues__fields__customfield_10901 {
  dimension: value__accountid {
    type: string
    sql: ${TABLE}.value.accountid ;;
    group_label: "Value"
    group_item_label: "Accountid"
  }

  dimension: value__accounttype {
    type: string
    sql: ${TABLE}.value.accounttype ;;
    group_label: "Value"
    group_item_label: "Accounttype"
  }

  dimension: value__active {
    type: yesno
    sql: ${TABLE}.value.active ;;
    group_label: "Value"
    group_item_label: "Active"
  }

  dimension: value__avatarurls___16x16 {
    type: string
    sql: ${TABLE}.value.avatarurls._16x16 ;;
    group_label: "Value Avatarurls"
    group_item_label: "16x16"
  }

  dimension: value__avatarurls___24x24 {
    type: string
    sql: ${TABLE}.value.avatarurls._24x24 ;;
    group_label: "Value Avatarurls"
    group_item_label: "24x24"
  }

  dimension: value__avatarurls___32x32 {
    type: string
    sql: ${TABLE}.value.avatarurls._32x32 ;;
    group_label: "Value Avatarurls"
    group_item_label: "32x32"
  }

  dimension: value__avatarurls___48x48 {
    type: string
    sql: ${TABLE}.value.avatarurls._48x48 ;;
    group_label: "Value Avatarurls"
    group_item_label: "48x48"
  }

  dimension: value__displayname {
    type: string
    sql: ${TABLE}.value.displayname ;;
    group_label: "Value"
    group_item_label: "Displayname"
  }

  dimension: value__key {
    type: string
    sql: ${TABLE}.value.key ;;
    group_label: "Value"
    group_item_label: "Key"
  }

  dimension: value__self {
    type: string
    sql: ${TABLE}.value.self ;;
    group_label: "Value"
    group_item_label: "Self"
  }

  dimension: value__timezone {
    type: string
    sql: ${TABLE}.value.timezone ;;
    group_label: "Value"
    group_item_label: "Timezone"
  }
}
