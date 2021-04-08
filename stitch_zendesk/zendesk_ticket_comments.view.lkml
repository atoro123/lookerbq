view: zendesk_ticket_comments {
  sql_table_name: `stitch-poc-306316.zendesk.ticket_comments`
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

  dimension: attachments {
    hidden: yes
    sql: ${TABLE}.attachments ;;
  }

  dimension: audit_id {
    type: number
    sql: ${TABLE}.audit_id ;;
  }

  dimension: author_id {
    type: number
    sql: ${TABLE}.author_id ;;
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: html_body {
    type: string
    sql: ${TABLE}.html_body ;;
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

  dimension: plain_body {
    type: string
    sql: ${TABLE}.plain_body ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}.public ;;
  }

  dimension: ticket_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

view: ticket_comments__metadata__flags {
  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: ticket_comments__attachments {
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

view: ticket_comments__via__source__from__ticket_ids {
  dimension: value {
    type: number
    value_format_name: id
    sql: ${TABLE}.value ;;
  }
}

view: ticket_comments__attachments__value__thumbnails {
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

view: ticket_comments__metadata__notifications_suppressed_for {
  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: ticket_comments__via__source__from__original_recipients {
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
