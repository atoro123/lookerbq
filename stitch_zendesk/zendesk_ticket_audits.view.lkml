# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: ticket_audits {
  hidden: yes

  join: ticket_audits__events {
    view_label: "Ticket Audits: Events"
    sql: LEFT JOIN UNNEST(${ticket_audits.events}) as ticket_audits__events ;;
    relationship: one_to_many
  }

  join: ticket_audits__metadata__flags {
    view_label: "Ticket Audits: Metadata Flags"
    sql: LEFT JOIN UNNEST(${ticket_audits.metadata__flags}) as ticket_audits__metadata__flags ;;
    relationship: one_to_many
  }

  join: ticket_audits__events__value__value__ar {
    view_label: "Ticket Audits: Events Value Value Ar"
    sql: LEFT JOIN UNNEST(${ticket_audits__events.value__value__ar}) as ticket_audits__events__value__value__ar ;;
    relationship: one_to_many
  }

  join: ticket_audits__events__value__recipients {
    view_label: "Ticket Audits: Events Value Recipients"
    sql: LEFT JOIN UNNEST(${ticket_audits__events.value__recipients}) as ticket_audits__events__value__recipients ;;
    relationship: one_to_many
  }

  join: ticket_audits__events__value__attachments {
    view_label: "Ticket Audits: Events Value Attachments"
    sql: LEFT JOIN UNNEST(${ticket_audits__events.value__attachments}) as ticket_audits__events__value__attachments ;;
    relationship: one_to_many
  }

  join: ticket_audits__via__source__from__ticket_ids {
    view_label: "Ticket Audits: Via Source From Ticket Ids"
    sql: LEFT JOIN UNNEST(${ticket_audits.via__source__from__ticket_ids}) as ticket_audits__via__source__from__ticket_ids ;;
    relationship: one_to_many
  }

  join: ticket_audits__events__value__previous_value__ar {
    view_label: "Ticket Audits: Events Value Previous Value Ar"
    sql: LEFT JOIN UNNEST(${ticket_audits__events.value__previous_value__ar}) as ticket_audits__events__value__previous_value__ar ;;
    relationship: one_to_many
  }

  join: ticket_audits__metadata__notifications_suppressed_for {
    view_label: "Ticket Audits: Metadata Notifications Suppressed For"
    sql: LEFT JOIN UNNEST(${ticket_audits.metadata__notifications_suppressed_for}) as ticket_audits__metadata__notifications_suppressed_for ;;
    relationship: one_to_many
  }

  join: ticket_audits__via__source__from__original_recipients {
    view_label: "Ticket Audits: Via Source From Original Recipients"
    sql: LEFT JOIN UNNEST(${ticket_audits.via__source__from__original_recipients}) as ticket_audits__via__source__from__original_recipients ;;
    relationship: one_to_many
  }

  join: ticket_audits__events__value__attachments__value__thumbnails {
    view_label: "Ticket Audits: Events Value Attachments Value Thumbnails"
    sql: LEFT JOIN UNNEST(${ticket_audits__events__value__attachments.value__thumbnails}) as ticket_audits__events__value__attachments__value__thumbnails ;;
    relationship: one_to_many
  }
}

view: ticket_audits {
  sql_table_name: `stitch-poc-306316.zendesk.ticket_audits`
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

  dimension: author_id {
    type: number
    sql: ${TABLE}.author_id ;;
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

  dimension: events {
    hidden: yes
    sql: ${TABLE}.events ;;
  }

  dimension: metadata__custom__slack_channel_id {
    type: string
    sql: ${TABLE}.metadata.custom.slack_channel_id ;;
    group_label: "Metadata Custom"
    group_item_label: "Slack Channel ID"
  }

  dimension: metadata__flags {
    hidden: yes
    sql: ${TABLE}.metadata.flags ;;
    group_label: "Metadata"
    group_item_label: "Flags"
  }

  dimension: metadata__flags_options___11__message__user {
    type: string
    sql: ${TABLE}.metadata.flags_options._11.message.user ;;
    group_label: "Metadata Flags Options 11 Message"
    group_item_label: "User"
  }

  dimension: metadata__flags_options___11__trusted {
    type: yesno
    sql: ${TABLE}.metadata.flags_options._11.trusted ;;
    group_label: "Metadata Flags Options 11"
    group_item_label: "Trusted"
  }

  dimension: metadata__flags_options___2__trusted {
    type: yesno
    sql: ${TABLE}.metadata.flags_options._2.trusted ;;
    group_label: "Metadata Flags Options 2"
    group_item_label: "Trusted"
  }

  dimension: metadata__notifications_suppressed_for {
    hidden: yes
    sql: ${TABLE}.metadata.notifications_suppressed_for ;;
    group_label: "Metadata"
    group_item_label: "Notifications Suppressed For"
  }

  dimension: metadata__system__client {
    type: string
    sql: ${TABLE}.metadata.system.client ;;
    group_label: "Metadata System"
    group_item_label: "Client"
  }

  dimension: metadata__system__ip_address {
    type: string
    sql: ${TABLE}.metadata.system.ip_address ;;
    group_label: "Metadata System"
    group_item_label: "IP Address"
  }

  dimension: metadata__system__json_email_identifier {
    type: string
    sql: ${TABLE}.metadata.system.json_email_identifier ;;
    group_label: "Metadata System"
    group_item_label: "JSON Email Identifier"
  }

  dimension: metadata__system__latitude {
    type: number
    sql: ${TABLE}.metadata.system.latitude ;;
    group_label: "Metadata System"
    group_item_label: "Latitude"
  }

  dimension: metadata__system__location {
    type: string
    sql: ${TABLE}.metadata.system.location ;;
    group_label: "Metadata System"
    group_item_label: "Location"
  }

  dimension: metadata__system__longitude {
    type: number
    sql: ${TABLE}.metadata.system.longitude ;;
    group_label: "Metadata System"
    group_item_label: "Longitude"
  }

  dimension: metadata__system__message_id {
    type: string
    sql: ${TABLE}.metadata.system.message_id ;;
    group_label: "Metadata System"
    group_item_label: "Message ID"
  }

  dimension: metadata__system__raw_email_identifier {
    type: string
    sql: ${TABLE}.metadata.system.raw_email_identifier ;;
    group_label: "Metadata System"
    group_item_label: "Raw Email Identifier"
  }

  dimension: metadata__trusted {
    type: yesno
    sql: ${TABLE}.metadata.trusted ;;
    group_label: "Metadata"
    group_item_label: "Trusted"
  }

  dimension: ticket_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ticket_id ;;
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

  dimension: via__source__from__deleted {
    type: yesno
    sql: ${TABLE}.via.source.`from`.deleted ;;
    group_label: "Via Source From"
    group_item_label: "Deleted"
  }

  dimension: via__source__from__id {
    type: number
    sql: ${TABLE}.via.source.`from`.id ;;
    group_label: "Via Source From"
    group_item_label: "ID"
  }

  dimension: via__source__from__name {
    type: string
    sql: ${TABLE}.via.source.`from`.name ;;
    group_label: "Via Source From"
    group_item_label: "Name"
  }

  dimension: via__source__from__original_recipients {
    hidden: yes
    sql: ${TABLE}.via.source.from.original_recipients ;;
    group_label: "Via Source From"
    group_item_label: "Original Recipients"
  }

  dimension: via__source__from__subject {
    type: string
    sql: ${TABLE}.via.source.`from`.subject ;;
    group_label: "Via Source From"
    group_item_label: "Subject"
  }

  dimension: via__source__from__ticket_id {
    type: number
    sql: ${TABLE}.via.source.`from`.ticket_id ;;
    group_label: "Via Source From"
    group_item_label: "Ticket ID"
  }

  dimension: via__source__from__ticket_ids {
    hidden: yes
    sql: ${TABLE}.via.source.from.ticket_ids ;;
    group_label: "Via Source From"
    group_item_label: "Ticket Ids"
  }

  dimension: via__source__from__title {
    type: string
    sql: ${TABLE}.via.source.`from`.title ;;
    group_label: "Via Source From"
    group_item_label: "Title"
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
      id,
      via__source__to__name,
      via__source__from__name,
      tickets.via__source__to__name,
      tickets.via__source__from__name,
      tickets.via__source__from__ticket_id
    ]
  }
}

view: ticket_audits__events {
  dimension: value__attachments {
    hidden: yes
    sql: ${TABLE}.value.attachments ;;
    group_label: "Value"
    group_item_label: "Attachments"
  }

  dimension: value__audit_id {
    type: number
    sql: ${TABLE}.value.audit_id ;;
    group_label: "Value"
    group_item_label: "Audit ID"
  }

  dimension: value__author_id {
    type: number
    sql: ${TABLE}.value.author_id ;;
    group_label: "Value"
    group_item_label: "Author ID"
  }

  dimension: value__body {
    type: string
    sql: ${TABLE}.value.body ;;
    group_label: "Value"
    group_item_label: "Body"
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
    sql: ${TABLE}.value.created_at ;;
    group_label: "Value"
    group_item_label: "Created"
  }

  dimension: value__data__answered_by_name {
    type: string
    sql: ${TABLE}.value.data.answered_by_name ;;
    group_label: "Value Data"
    group_item_label: "Answered By Name"
  }

  dimension: value__data__call_duration {
    type: string
    sql: ${TABLE}.value.data.call_duration ;;
    group_label: "Value Data"
    group_item_label: "Call Duration"
  }

  dimension: value__data__from {
    type: string
    sql: ${TABLE}.value.data.`from` ;;
    group_label: "Value Data"
    group_item_label: "From"
  }

  dimension: value__data__recording_url {
    type: string
    sql: ${TABLE}.value.data.recording_url ;;
    group_label: "Value Data"
    group_item_label: "Recording URL"
  }

  dimension_group: value__data__started {
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
    sql: ${TABLE}.value.data.started_at ;;
    group_label: "Value Data"
    group_item_label: "Started"
  }

  dimension: value__data__to {
    type: string
    sql: ${TABLE}.value.data.`to` ;;
    group_label: "Value Data"
    group_item_label: "To"
  }

  dimension: value__data__transcription_status {
    type: string
    sql: ${TABLE}.value.data.transcription_status ;;
    group_label: "Value Data"
    group_item_label: "Transcription Status"
  }

  dimension: value__data__transcription_text {
    type: string
    sql: ${TABLE}.value.data.transcription_text ;;
    group_label: "Value Data"
    group_item_label: "Transcription Text"
  }

  dimension: value__field_name {
    type: string
    sql: ${TABLE}.value.field_name ;;
    group_label: "Value"
    group_item_label: "Field Name"
  }

  dimension: value__formatted_from {
    type: string
    sql: ${TABLE}.value.formatted_from ;;
    group_label: "Value"
    group_item_label: "Formatted From"
  }

  dimension: value__formatted_to {
    type: string
    sql: ${TABLE}.value.formatted_to ;;
    group_label: "Value"
    group_item_label: "Formatted To"
  }

  dimension: value__html_body {
    type: string
    sql: ${TABLE}.value.html_body ;;
    group_label: "Value"
    group_item_label: "HTML Body"
  }

  dimension: value__id {
    type: number
    sql: ${TABLE}.value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__plain_body {
    type: string
    sql: ${TABLE}.value.plain_body ;;
    group_label: "Value"
    group_item_label: "Plain Body"
  }

  dimension: value__previous_value {
    type: string
    sql: ${TABLE}.value.previous_value ;;
    group_label: "Value"
    group_item_label: "Previous Value"
  }

  dimension: value__previous_value__ar {
    hidden: yes
    sql: ${TABLE}.value.previous_value__ar ;;
    group_label: "Value Previous Value"
    group_item_label: "Ar"
  }

  dimension: value__public {
    type: yesno
    sql: ${TABLE}.value.public ;;
    group_label: "Value"
    group_item_label: "Public"
  }

  dimension: value__recipients {
    hidden: yes
    sql: ${TABLE}.value.recipients ;;
    group_label: "Value"
    group_item_label: "Recipients"
  }

  dimension: value__resource {
    type: string
    sql: ${TABLE}.value.resource ;;
    group_label: "Value"
    group_item_label: "Resource"
  }

  dimension: value__subject {
    type: string
    sql: ${TABLE}.value.subject ;;
    group_label: "Value"
    group_item_label: "Subject"
  }

  dimension: value__transcription_visible {
    type: yesno
    sql: ${TABLE}.value.transcription_visible ;;
    group_label: "Value"
    group_item_label: "Transcription Visible"
  }

  dimension: value__trusted {
    type: yesno
    sql: ${TABLE}.value.trusted ;;
    group_label: "Value"
    group_item_label: "Trusted"
  }

  dimension: value__type {
    type: string
    sql: ${TABLE}.value.type ;;
    group_label: "Value"
    group_item_label: "Type"
  }

  dimension: value__value {
    type: string
    sql: ${TABLE}.value.value ;;
    group_label: "Value"
    group_item_label: "Value"
  }

  dimension: value__value__ar {
    hidden: yes
    sql: ${TABLE}.value.value__ar ;;
    group_label: "Value Value"
    group_item_label: "Ar"
  }

  dimension: value__via__channel {
    type: string
    sql: ${TABLE}.value.via.channel ;;
    group_label: "Value Via"
    group_item_label: "Channel"
  }

  dimension: value__via__source__from__deleted {
    type: yesno
    sql: ${TABLE}.value.via.source.`from`.deleted ;;
    group_label: "Value Via Source From"
    group_item_label: "Deleted"
  }

  dimension: value__via__source__from__id {
    type: number
    sql: ${TABLE}.value.via.source.`from`.id ;;
    group_label: "Value Via Source From"
    group_item_label: "ID"
  }

  dimension: value__via__source__from__title {
    type: string
    sql: ${TABLE}.value.via.source.`from`.title ;;
    group_label: "Value Via Source From"
    group_item_label: "Title"
  }

  dimension: value__via__source__rel {
    type: string
    sql: ${TABLE}.value.via.source.rel ;;
    group_label: "Value Via Source"
    group_item_label: "Rel"
  }
}

view: ticket_audits__metadata__flags {
  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: ticket_audits__events__value__value__ar {
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: ticket_audits__events__value__recipients {
  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: ticket_audits__events__value__attachments {
  dimension: value__content_type {
    type: string
    sql: ${TABLE}.value.content_type ;;
    group_label: "Value"
    group_item_label: "Content Type"
  }

  dimension: value__content_url {
    type: string
    sql: ${TABLE}.value.content_url ;;
    group_label: "Value"
    group_item_label: "Content URL"
  }

  dimension: value__file_name {
    type: string
    sql: ${TABLE}.value.file_name ;;
    group_label: "Value"
    group_item_label: "File Name"
  }

  dimension: value__height {
    type: number
    sql: ${TABLE}.value.height ;;
    group_label: "Value"
    group_item_label: "Height"
  }

  dimension: value__id {
    type: number
    sql: ${TABLE}.value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__inline {
    type: yesno
    sql: ${TABLE}.value.inline ;;
    group_label: "Value"
    group_item_label: "Inline"
  }

  dimension: value__mapped_content_url {
    type: string
    sql: ${TABLE}.value.mapped_content_url ;;
    group_label: "Value"
    group_item_label: "Mapped Content URL"
  }

  dimension: value__size {
    type: number
    sql: ${TABLE}.value.size ;;
    group_label: "Value"
    group_item_label: "Size"
  }

  dimension: value__thumbnails {
    hidden: yes
    sql: ${TABLE}.value.thumbnails ;;
    group_label: "Value"
    group_item_label: "Thumbnails"
  }

  dimension: value__url {
    type: string
    sql: ${TABLE}.value.url ;;
    group_label: "Value"
    group_item_label: "URL"
  }

  dimension: value__width {
    type: number
    sql: ${TABLE}.value.width ;;
    group_label: "Value"
    group_item_label: "Width"
  }
}

view: ticket_audits__via__source__from__ticket_ids {
  dimension: value {
    type: number
    value_format_name: id
    sql: ${TABLE}.value ;;
  }
}

view: ticket_audits__events__value__previous_value__ar {
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: ticket_audits__metadata__notifications_suppressed_for {
  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: ticket_audits__via__source__from__original_recipients {
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: ticket_audits__events__value__attachments__value__thumbnails {
  dimension: value__content_type {
    type: string
    sql: ${TABLE}.value.content_type ;;
    group_label: "Value"
    group_item_label: "Content Type"
  }

  dimension: value__content_url {
    type: string
    sql: ${TABLE}.value.content_url ;;
    group_label: "Value"
    group_item_label: "Content URL"
  }

  dimension: value__file_name {
    type: string
    sql: ${TABLE}.value.file_name ;;
    group_label: "Value"
    group_item_label: "File Name"
  }

  dimension: value__height {
    type: number
    sql: ${TABLE}.value.height ;;
    group_label: "Value"
    group_item_label: "Height"
  }

  dimension: value__id {
    type: number
    sql: ${TABLE}.value.id ;;
    group_label: "Value"
    group_item_label: "ID"
  }

  dimension: value__inline {
    type: yesno
    sql: ${TABLE}.value.inline ;;
    group_label: "Value"
    group_item_label: "Inline"
  }

  dimension: value__mapped_content_url {
    type: string
    sql: ${TABLE}.value.mapped_content_url ;;
    group_label: "Value"
    group_item_label: "Mapped Content URL"
  }

  dimension: value__size {
    type: number
    sql: ${TABLE}.value.size ;;
    group_label: "Value"
    group_item_label: "Size"
  }

  dimension: value__url {
    type: string
    sql: ${TABLE}.value.url ;;
    group_label: "Value"
    group_item_label: "URL"
  }

  dimension: value__width {
    type: number
    sql: ${TABLE}.value.width ;;
    group_label: "Value"
    group_item_label: "Width"
  }
}
