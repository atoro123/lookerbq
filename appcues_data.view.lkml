view: appcues_data {
  sql_table_name: `production-202017.ogv2_consumerinsight.appcues_data`
    ;;

  dimension: attributes__identity__abgroup {
    type: number
    value_format_name: id
    sql: ${TABLE}.attributes__identity__ABGroup ;;
  }

  dimension: attributes__identity__appcues_id {
    type: number
    sql: ${TABLE}.attributes__identity__appcuesID ;;
  }

  dimension: attributes__identity__current_page_title {
    type: string
    sql: ${TABLE}.attributes__identity__currentPageTitle ;;
  }

  dimension: attributes__identity__current_page_url {
    type: string
    sql: ${TABLE}.attributes__identity__currentPageUrl ;;
  }

  dimension: attributes__identity__hostname {
    type: string
    sql: ${TABLE}.attributes__identity__hostname ;;
  }

  dimension: attributes__identity__is_anonymous {
    type: string
    sql: ${TABLE}.attributes__identity__isAnonymous ;;
  }

  dimension: attributes__identity__last_browser_language {
    type: string
    sql: ${TABLE}.attributes__identity__lastBrowserLanguage ;;
  }

  dimension: attributes__identity__last_page_title {
    type: string
    sql: ${TABLE}.attributes__identity__lastPageTitle ;;
  }

  dimension: attributes__identity__last_page_url {
    type: string
    sql: ${TABLE}.attributes__identity__lastPageUrl ;;
  }

  dimension: attributes__identity__local_id {
    type: string
    sql: ${TABLE}.attributes__identity__localId ;;
  }

  dimension: attributes__identity__my_appcues_id {
    type: number
    sql: ${TABLE}.attributes__identity__myAppcuesId ;;
  }

  dimension: attributes__identity__session_pageviews {
    type: number
    value_format_name: id
    sql: ${TABLE}.attributes__identity__sessionPageviews ;;
  }

  dimension: attributes__identity__session_randomizer {
    type: number
    value_format_name: id
    sql: ${TABLE}.attributes__identity__sessionRandomizer ;;
  }

  dimension: attributes__identity__updated_at {
    type: number
    value_format_name: id
    sql: ${TABLE}.attributes__identity__updatedAt ;;
  }

  dimension: attributes__identity__user_agent {
    type: string
    sql: ${TABLE}.attributes__identity__userAgent ;;
  }

  dimension: attributes__identity_user_id {
    type: string
    sql: ${TABLE}.attributes__identity_userId ;;
  }

  dimension: attributes_flow_id {
    type: string
    sql: ${TABLE}.attributes_flowId ;;
  }


  dimension: attributes_flow_name {
    type: string
    sql: ${TABLE}.attributes_flowName ;;
  }

  dimension: attributes_flow_type {
    type: string
    sql: ${TABLE}.attributes_flowType ;;
  }

  dimension: attributes_flow_version {
    type: number
    sql: ${TABLE}.attributes_flowVersion ;;
  }

  dimension: attributes_interaction {
    type: string
    sql: ${TABLE}.attributes_interaction ;;
  }

  dimension: attributes_session_id {
    type: number
    sql: ${TABLE}.attributes_sessionId ;;
  }

  dimension: attributes_step_child_id {
    type: string
    sql: ${TABLE}.attributes_stepChildId ;;
  }

  dimension: attributes_step_child_number {
    type: string
    sql: ${TABLE}.attributes_stepChildNumber ;;
  }

  dimension: attributes_step_id {
    type: string
    sql: ${TABLE}.attributes_stepId ;;
  }

  dimension: attributes_step_type {
    type: string
    sql: ${TABLE}.attributes_stepType ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: current_merchant {
    type: string
    sql: ${TABLE}.attributes__identity_current_merchant ;;
  }

  dimension: is_superuser {
    type: string
    sql: ${TABLE}.attributes__identity_is_superuser ;;
  }

  measure: count {
    type: count
    drill_fields: [attributes__identity__hostname, attributes_flow_name, name]
  }

  dimension: flow_name_sort {
    label: "Flow Name (Custom Sort)"
    case: {
      when: {
        sql: ${attributes_flow_name} = 'Install Shopify App' ;;
        label: "Install Shopify App"
      }
      when: {
        sql: ${attributes_flow_name} = 'Make Your Products Eligible (use)' ;;
        label: "Make Your Products Eligible"
        }
      when: {
        sql: ${attributes_flow_name} = 'Emails' ;;
        label: "Configure Your Subscription Emails"
        }
      when: {
        sql: ${attributes_flow_name} = 'Install Experience on your Site' ;;
        label: "Install Experience on your Site"
            }
      when: {
        sql: ${attributes_flow_name} = 'Payment Gateway' ;;
        label: "Set Up Your Pamyent Gateway"
              }
      when: {
        sql: ${attributes_flow_name} = 'Create Test Sub' ;;
        label: "Create Test Subscription"
                }
      when: {
        sql: ${attributes_flow_name} = 'Launch' ;;
        label: "Launch"
                  }
    }}

dimension: name_sort {
      type: string
        case: {
          when: {
            sql: ${name} = 'appcues:flow_started' ;;
            label: "Flow Started"
          }
          when: {
            sql: ${name} = 'appcues:flow_skipped' ;;
            label: "Flow Skipped"
          }
          when: {
            sql: ${name} = 'appcues:flow_skipped' ;;
            label: "Flow Completed"
          }}}


measure: count_distinct_users {
      type: count_distinct
      sql: ${user_id} ;;
        }
}
