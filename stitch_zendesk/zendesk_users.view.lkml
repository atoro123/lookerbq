# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: users {
  hidden: yes

  join: users__tags {
    view_label: "Users: Tags"
    sql: LEFT JOIN UNNEST(${users.tags}) as users__tags ;;
    relationship: one_to_many
  }
}

view: users {
  sql_table_name: `stitch-poc-306316.zendesk.users`
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

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: chat_only {
    type: yesno
    sql: ${TABLE}.chat_only ;;
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

  dimension: custom_role_id {
    type: number
    sql: ${TABLE}.custom_role_id ;;
  }

  dimension: default_group_id {
    type: number
    sql: ${TABLE}.default_group_id ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension_group: last_login {
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
    sql: ${TABLE}.last_login_at ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: locale_id {
    type: number
    sql: ${TABLE}.locale_id ;;
  }

  dimension: moderator {
    type: yesno
    sql: ${TABLE}.moderator ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: only_private_comments {
    type: yesno
    sql: ${TABLE}.only_private_comments ;;
  }

  dimension: organization_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  dimension: restricted_agent {
    type: yesno
    sql: ${TABLE}.restricted_agent ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: role_type {
    type: number
    sql: ${TABLE}.role_type ;;
  }

  dimension: shared {
    type: yesno
    sql: ${TABLE}.shared ;;
  }

  dimension: shared_agent {
    type: yesno
    sql: ${TABLE}.shared_agent ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: suspended {
    type: yesno
    sql: ${TABLE}.suspended ;;
  }

  dimension: tags {
    hidden: yes
    sql: ${TABLE}.tags ;;
  }

  dimension: ticket_restriction {
    type: string
    sql: ${TABLE}.ticket_restriction ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: two_factor_auth_enabled {
    type: yesno
    sql: ${TABLE}.two_factor_auth_enabled ;;
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

  dimension: user_fields__current_merchant {
    type: string
    sql: ${TABLE}.user_fields.current_merchant ;;
    group_label: "User Fields"
    group_item_label: "Current Merchant"
  }

  dimension: user_fields__id {
    type: string
    sql: ${TABLE}.user_fields.id ;;
    group_label: "User Fields"
    group_item_label: "ID"
  }

  dimension: user_fields__is_superuser {
    type: yesno
    sql: ${TABLE}.user_fields.is_superuser ;;
    group_label: "User Fields"
    group_item_label: "Is Superuser"
  }

  dimension: user_fields__merchant_public_id {
    type: string
    sql: ${TABLE}.user_fields.merchant_public_id ;;
    group_label: "User Fields"
    group_item_label: "Merchant Public ID"
  }

  dimension: user_fields__username {
    type: string
    sql: ${TABLE}.user_fields.username ;;
    group_label: "User Fields"
    group_item_label: "Username"
  }

  dimension: verified {
    type: yesno
    sql: ${TABLE}.verified ;;
  }

  measure: count {
    type: count
    drill_fields: [id, user_fields__username, organizations.name, organizations.id, group_memberships.count]
  }
}

view: users__tags {
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
