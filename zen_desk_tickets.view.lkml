view: zen_desk_tickets {
  sql_table_name: `production-202017.ogv2_consumerinsight.zen_desk_tickets`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: admin_reviewed {
    type: string
    sql: ${TABLE}.Admin_Reviewed ;;
  }

  dimension: agent_wait_time_in_minutes {
    type: number
    sql: ${TABLE}.Agent_Wait_Time_In_Minutes ;;
  }

  dimension: agent_wait_time_in_minutes_within_business_hours {
    type: number
    sql: ${TABLE}.Agent_Wait_Time_In_Minutes_Within_Business_Hours ;;
  }

  dimension_group: assigned {
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
    sql: TIMESTAMP(${TABLE}.Assigned_At) ;;
  }

  dimension: assignee_stations {
    type: number
    sql: ${TABLE}.Assignee_Stations ;;
  }

  dimension: assisgnee {
    type: string
    sql: ${TABLE}.Assisgnee ;;
  }

  dimension: client_stage {
    type: string
    sql: ${TABLE}.Client_Stage ;;
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
    sql: TIMESTAMP(${TABLE}.Created_At) ;;
  }

  dimension: documentation_needed {
    type: string
    sql: ${TABLE}.Documentation_Needed ;;
  }

  dimension_group: due {
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
    sql: ${TABLE}.Due_Date ;;
  }

  dimension: ecom_platform {
    type: string
    sql: ${TABLE}.Ecom_Platform ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.Email_Address ;;
  }

  dimension: first_reply_in_minutes {
    type: number
    sql: ${TABLE}.First_Reply_In_Minutes ;;
  }

  dimension: first_resolution_time_in_minutes {
    type: number
    sql: ${TABLE}.First_Resolution_Time_In_Minutes ;;
  }

  dimension: first_resolution_time_in_minutes_within_minutes {
    type: number
    sql: ${TABLE}.First_Resolution_Time_In_Minutes_Within_Minutes ;;
  }

  dimension: first_resolution_time_in_minutes_within_minutes_within_business_hours {
    type: number
    sql: ${TABLE}.First_Resolution_Time_In_Minutes_Within_Minutes_Within_Business_Hours ;;
  }

  dimension: full_resolution_time_in_minutes {
    type: number
    sql: ${TABLE}.Full_Resolution_Time_In_Minutes ;;
  }

  dimension: full_resolution_time_in_minutes_within_business_hours {
    type: number
    sql: ${TABLE}.Full_Resolution_Time_In_Minutes_Within_Business_Hours ;;
  }

  dimension: group {
    type: string
    sql: ${TABLE}.`Group` ;;
  }

  dimension: group_stations {
    type: number
    sql: ${TABLE}.Group_Stations ;;
  }

  dimension_group: initially_assigned {
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
    sql: TIMESTAMP(${TABLE}.Initially_Assigned_At) ;;
  }

  dimension: intiated_by {
    type: string
    sql: ${TABLE}.Intiated_By ;;
  }

  dimension: manually_imported {
    type: string
    sql: ${TABLE}.Manually_Imported ;;
  }

  dimension: merchant {
    type: string
    sql: ${TABLE}.Merchant ;;
  }

  dimension: on_hold_time_in_minutes {
    type: number
    sql: ${TABLE}.On_Hold_Time_In_Minutes ;;
  }

  dimension: on_hold_time_in_minutes_within_business_hours {
    type: number
    sql: ${TABLE}.On_Hold_Time_In_Minutes_Within_Business_Hours ;;
  }

  dimension: organization {
    type: string
    sql: ${TABLE}.Organization ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.Priority ;;
  }

  dimension: product_tags {
    type: string
    sql: ${TABLE}.Product_Tags ;;
  }

  dimension: product_tier {
    type: string
    sql: ${TABLE}.Product_Tier ;;
  }

  dimension: register_wait_time_in_minutes {
    type: number
    sql: ${TABLE}.Register_Wait_Time_In_Minutes ;;
  }

  dimension: register_wait_time_in_minutes_within_business_hours {
    type: number
    sql: ${TABLE}.Register_Wait_Time_In_Minutes_Within_Business_Hours ;;
  }

  dimension: reopens {
    type: number
    sql: ${TABLE}.Reopens ;;
  }

  dimension: replies {
    type: number
    sql: ${TABLE}.Replies ;;
  }

  measure: Total_Replies {
    type: sum
    sql: ${replies} ;;
  }

  dimension: requester_external_id {
    type: string
    sql: ${TABLE}.Requester_External_ID ;;
  }

  dimension: requester_id {
    type: number
    sql: ${TABLE}.Requester_ID ;;
  }

  dimension: resolution_time {
    type: number
    sql: ${TABLE}.Resolution_Time ;;
  }

  dimension: satisfaction_score {
    type: string
    sql: ${TABLE}.Satisfaction_Score ;;
  }

  dimension_group: solved {
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
    sql: TIMESTAMP(${TABLE}.Solved_At) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: sub_issue_type {
    type: string
    sql: ${TABLE}.Sub_Issue_Type ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.Subject ;;
  }

  dimension: submitter {
    type: string
    sql: ${TABLE}.Submitter ;;
  }

  dimension: summation_column {
    type: number
    sql: ${TABLE}.summation_column ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.Tags ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}.Ticket_ID ;;
    html:
    <a href="https://ordergroove.zendesk.com/agent/tickets/{{ value }}">{{ value }}</a> ;;
  }

  dimension: ticket_type {
    type: string
    sql: ${TABLE}.Ticket_Type ;;
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
    sql: TIMESTAMP(${TABLE}.Updated_At) ;;
  }

  dimension: via {
    type: string
    sql: ${TABLE}.Via ;;
  }

  measure: count {
    type: count
    drill_fields: [ticket_id,subject]
  }

  dimension: Issue_Tags {
    type: string
    sql:  case when ${tags} like '%email%' then 'Email'
when ${tags} like '%piplines%' then 'Pipeline'
when ${tags} like '%promotions%' then 'Promotions'
when ${tags} like '%software_not_working_as_expected%' then 'Software Not Working'
when ${tags} like '%offers%' then 'Offers'
when ${tags} like '%client_settings%' then 'Client Settings'
when ${tags} like '%order%' then 'Orders'
when ${tags} like '%api%' then 'API'
when ${tags} like '%bug%' then 'Bug'
when ${tags} like '%missing_documentation%' then 'Missing Documentation'
when ${tags} like '%product_feed%' then 'Product Feed'
when ${tags} like '%advanced_offer%' then 'Advanced Offers'
when ${tags} like '%web_widget%' then 'Web Widget'
when ${tags} like '%msi%' then 'MSI'
when ${tags} like '%service/process%' then 'Service and Process'
when ${tags} like '%styling%' then 'Styling'
when ${tags} like '%feature_not_available%' then 'Feature not Available'
when ${tags} like '%cartridge%' then 'Cartridge'
when ${tags} like '%purchase_post%' then 'Purchase Post'
when ${tags} like '%page_tagging%' then 'Page Tagging'
when ${tags} like '%advanced%' then 'Advanced Offers'
when ${tags} like '%browser_issue%' then 'Browser Issue'
when ${tags} like '%sms%' then 'SMS'
when ${tags} like '%order_placement%' then 'Order Placement'
when ${tags} like '%unclear_documenation%' then 'Unclear Documentation'
when ${tags} like '%advanced_editing%' then 'Advanced Editing'
when ${tags} like '%msi_-_copy%' then 'MSI Copy'
when ${tags} like '%instant_upsell%' then 'IU'
when ${tags} like '%international%' then 'Internation'
when ${tags} like '%atg%' then 'ATG'
else 'other' end
 ;;
  }
  dimension: Platform_Tags {
    type: string
    sql:  case when ${tags} like '%shopify%' then 'Shopfy'
when ${tags} like '%magento_2%' then 'Magento 2'
when ${tags} like '%sfcc%' then 'Salesforce'
when ${tags} like '%bigcommerce%' then 'Bigcommerce'
else 'other' end
 ;;
  }

  measure: Average_Days_Open {
    type: average
    sql: date_diff(ifnull(${solved_date}, current_date()), ${created_date}, DAY) ;;
    value_format: "0"
  }

  measure: Average_Touches {
    type: average
    sql: ${replies} ;;
    value_format: "0"
  }

  dimension: Produvt_Level_Tag {
    type: string
    sql:  case when ${tags} like '%essentials%' then 'Eseentials'
      when ${tags} like '%enterprise%' then 'Enteprise'
      else 'other' end
       ;;
  }

  measure: Average_Tickets {
    type: average
    sql: count(${id}) ;;
  }

  measure: sum_resolution_time {
    type: sum
    sql: ${resolution_time} ;;
  }

  measure: avg_resolution_time {
    type: average
    sql: ${resolution_time} ;;
  }
}
