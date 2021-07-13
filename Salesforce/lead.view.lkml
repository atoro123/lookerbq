view: lead {
  sql_table_name: `stitch-poc-306316.salesforce.Lead`
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

  dimension: account__c {
    type: string
    sql: ${TABLE}.account__c ;;
  }

  dimension: active_lead__c {
    type: number
    sql: ${TABLE}.active_lead__c ;;
  }

  dimension: age_category__c {
    type: string
    sql: ${TABLE}.age_category__c ;;
  }

  dimension: annual_online_revenue__c {
    type: string
    sql: ${TABLE}.annual_online_revenue__c ;;
  }

  dimension: bdr_lead__c {
    type: yesno
    sql: ${TABLE}.bdr_lead__c ;;
  }

  dimension: bizible2__account__c {
    type: string
    sql: ${TABLE}.bizible2__account__c ;;
  }

  dimension: bizible2__ad_campaign_name_ft__c {
    type: string
    sql: ${TABLE}.bizible2__ad_campaign_name_ft__c ;;
  }

  dimension: bizible2__ad_campaign_name_lc__c {
    type: string
    sql: ${TABLE}.bizible2__ad_campaign_name_lc__c ;;
  }

  dimension: bizible2__landing_page_ft__c {
    type: string
    sql: ${TABLE}.bizible2__landing_page_ft__c ;;
  }

  dimension: bizible2__landing_page_lc__c {
    type: string
    sql: ${TABLE}.bizible2__landing_page_lc__c ;;
  }

  dimension: bizible2__marketing_channel_ft__c {
    type: string
    sql: ${TABLE}.bizible2__marketing_channel_ft__c ;;
  }

  dimension: bizible2__marketing_channel_lc__c {
    type: string
    sql: ${TABLE}.bizible2__marketing_channel_lc__c ;;
  }

  dimension_group: bizible2__touchpoint_date_ft__c {
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
    sql: ${TABLE}.bizible2__touchpoint_date_ft__c ;;
  }

  dimension_group: bizible2__touchpoint_date_lc__c {
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
    sql: ${TABLE}.bizible2__touchpoint_date_lc__c ;;
  }

  dimension: bizible2__touchpoint_source_ft__c {
    type: string
    sql: ${TABLE}.bizible2__touchpoint_source_ft__c ;;
  }

  dimension: bizible2__touchpoint_source_lc__c {
    type: string
    sql: ${TABLE}.bizible2__touchpoint_source_lc__c ;;
  }

  dimension: bus_dev_email__c {
    type: string
    sql: ${TABLE}.bus_dev_email__c ;;
  }

  dimension: calendlycreated__c {
    type: yesno
    sql: ${TABLE}.calendlycreated__c ;;
  }

  dimension: campaign_name__c {
    type: string
    sql: ${TABLE}.campaign_name__c ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: closed__c {
    type: yesno
    sql: ${TABLE}.closed__c ;;
  }

  dimension_group: closed_date__c {
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
    sql: ${TABLE}.closed_date__c ;;
  }

  dimension_group: closed_date_time__c {
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
    sql: ${TABLE}.closed_date_time__c ;;
  }

  dimension: closed_quarter__c {
    type: string
    sql: ${TABLE}.closed_quarter__c ;;
  }

  dimension: co_sell__c {
    type: yesno
    sql: ${TABLE}.co_sell__c ;;
  }

  dimension: co_sell_notes__c {
    type: string
    sql: ${TABLE}.co_sell_notes__c ;;
  }

  dimension: co_sell_partner__c {
    type: string
    sql: ${TABLE}.co_sell_partner__c ;;
  }

  dimension: co_selling_sfcc_type__c {
    type: string
    sql: ${TABLE}.co_selling_sfcc_type__c ;;
  }

  dimension: co_selling_status__c {
    type: string
    sql: ${TABLE}.co_selling_status__c ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: company_notes__c {
    type: string
    sql: ${TABLE}.company_notes__c ;;
  }

  dimension: contact_partner_first__c {
    type: yesno
    sql: ${TABLE}.contact_partner_first__c ;;
  }

  dimension: convertedaccountid {
    type: string
    sql: ${TABLE}.convertedaccountid ;;
  }

  dimension: convertedcontactid {
    type: string
    sql: ${TABLE}.convertedcontactid ;;
  }

  dimension_group: converteddate {
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
    sql: ${TABLE}.converteddate ;;
  }

  dimension: convertedopportunityid {
    type: string
    sql: ${TABLE}.convertedopportunityid ;;
  }

  dimension: create_lead_contact__c {
    type: yesno
    sql: ${TABLE}.create_lead_contact__c ;;
  }

  dimension: created_by_role__c {
    type: string
    sql: ${TABLE}.created_by_role__c ;;
  }

  dimension_group: created_date_time__c {
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
    sql: ${TABLE}.created_date_time__c ;;
  }

  dimension: createdbyid {
    type: string
    sql: ${TABLE}.createdbyid ;;
  }

  dimension_group: createddate {
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
    sql: ${TABLE}.createddate ;;
  }

  dimension: current_subscription_provider__c {
    type: string
    sql: ${TABLE}.current_subscription_provider__c ;;
  }

  dimension: custom_packages__c {
    type: string
    sql: ${TABLE}.custom_packages__c ;;
  }

  dimension_group: date_time_entered_intake_review__c {
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
    sql: ${TABLE}.date_time_entered_intake_review__c ;;
  }

  dimension_group: date_time_entered_qualifying__c {
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
    sql: ${TABLE}.date_time_entered_qualifying__c ;;
  }

  dimension_group: date_time_entered_working__c {
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
    sql: ${TABLE}.date_time_entered_working__c ;;
  }

  dimension_group: date_time_left_intake_review__c {
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
    sql: ${TABLE}.date_time_left_intake_review__c ;;
  }

  dimension_group: date_time_left_qualifying__c {
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
    sql: ${TABLE}.date_time_left_qualifying__c ;;
  }

  dimension_group: date_time_left_working__c {
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
    sql: ${TABLE}.date_time_left_working__c ;;
  }

  dimension: days_in_mql__c {
    type: number
    sql: ${TABLE}.days_in_mql__c ;;
  }

  dimension: days_open__c {
    type: number
    sql: ${TABLE}.days_open__c ;;
  }

  dimension: days_since_last_activity__c {
    type: number
    sql: ${TABLE}.days_since_last_activity__c ;;
  }

  dimension_group: demo_date__c {
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
    sql: ${TABLE}.demo_date__c ;;
  }

  dimension: demo_set__c {
    type: yesno
    sql: ${TABLE}.demo_set__c ;;
  }

  dimension: demo_status__c {
    type: string
    sql: ${TABLE}.demo_status__c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: disqualification_notes__c {
    type: string
    sql: ${TABLE}.disqualification_notes__c ;;
  }

  dimension: disqualified_by_role__c {
    type: string
    sql: ${TABLE}.disqualified_by_role__c ;;
  }

  dimension: disqualified_sub_group__c {
    type: string
    sql: ${TABLE}.disqualified_sub_group__c ;;
  }

  dimension: disqualified_sub_group_other__c {
    type: string
    sql: ${TABLE}.disqualified_sub_group_other__c ;;
  }

  dimension: dozisf__zoominfo_company_id__c {
    type: string
    sql: ${TABLE}.dozisf__zoominfo_company_id__c ;;
  }

  dimension_group: dozisf__zoominfo_first_updated__c {
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
    sql: ${TABLE}.dozisf__zoominfo_first_updated__c ;;
  }

  dimension: dozisf__zoominfo_id__c {
    type: string
    sql: ${TABLE}.dozisf__zoominfo_id__c ;;
  }

  dimension_group: dozisf__zoominfo_last_updated__c {
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
    sql: ${TABLE}.dozisf__zoominfo_last_updated__c ;;
  }

  dimension: ecommerce_platform_partner__c {
    type: string
    sql: ${TABLE}.ecommerce_platform_partner__c ;;
  }

  dimension: extension__c {
    type: string
    sql: ${TABLE}.extension__c ;;
  }

  dimension: ga_campaign__c {
    type: string
    sql: ${TABLE}.ga_campaign__c ;;
  }

  dimension: ga_content__c {
    type: string
    sql: ${TABLE}.ga_content__c ;;
  }

  dimension: ga_medium__c {
    type: string
    sql: ${TABLE}.ga_medium__c ;;
  }

  dimension: ga_source__c {
    type: string
    sql: ${TABLE}.ga_source__c ;;
  }

  dimension: ga_term__c {
    type: string
    sql: ${TABLE}.ga_term__c ;;
  }

  dimension: hasoptedoutofemail {
    type: yesno
    sql: ${TABLE}.hasoptedoutofemail ;;
  }

  dimension: hours_in_assigned__c {
    type: number
    sql: ${TABLE}.hours_in_assigned__c ;;
  }

  dimension: how_did_you_hear_about_us__c {
    type: string
    sql: ${TABLE}.how_did_you_hear_about_us__c ;;
  }

  dimension: hubspot_score_lead__c {
    type: number
    sql: ${TABLE}.hubspot_score_lead__c ;;
  }

  dimension: implementation_domain__c {
    type: string
    sql: ${TABLE}.implementation_domain__c ;;
  }

  dimension: important_notes__c {
    type: string
    sql: ${TABLE}.important_notes__c ;;
  }

  dimension: inbound_outbound__c {
    type: string
    sql: ${TABLE}.inbound_outbound__c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: industry_formula__c {
    type: string
    sql: ${TABLE}.industry_formula__c ;;
  }

  dimension: influenced_by_partner_acct__c {
    type: string
    sql: ${TABLE}.influenced_by_partner_acct__c ;;
  }

  dimension_group: initial_sequence_date__c {
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
    sql: ${TABLE}.initial_sequence_date__c ;;
  }

  dimension: isconverted {
    type: yesno
    sql: ${TABLE}.isconverted ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: isunreadbyowner {
    type: yesno
    sql: ${TABLE}.isunreadbyowner ;;
  }

  dimension: jigsawcontactid {
    type: string
    sql: ${TABLE}.jigsawcontactid ;;
  }

  dimension_group: last_activity_date__c {
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
    sql: ${TABLE}.last_activity_date__c ;;
  }

  dimension_group: lastactivitydate {
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
    sql: ${TABLE}.lastactivitydate ;;
  }

  dimension: lastmodifiedbyid {
    type: string
    sql: ${TABLE}.lastmodifiedbyid ;;
  }

  dimension_group: lastmodifieddate {
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
    sql: ${TABLE}.lastmodifieddate ;;
  }

  dimension_group: lastreferenceddate {
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
    sql: ${TABLE}.lastreferenceddate ;;
  }

  dimension_group: lastvieweddate {
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
    sql: ${TABLE}.lastvieweddate ;;
  }

  dimension: lead_influenced_by__c {
    type: string
    sql: ${TABLE}.lead_influenced_by__c ;;
  }

  dimension: lead_source_detail__c {
    type: string
    sql: ${TABLE}.lead_source_detail__c ;;
  }

  dimension: lead_status_sub_group__c {
    type: string
    sql: ${TABLE}.lead_status_sub_group__c ;;
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}.leadsource ;;
  }

  dimension: migration_needed__c {
    type: string
    sql: ${TABLE}.migration_needed__c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_days_in_working__c {
    type: number
    sql: ${TABLE}.number_days_in_working__c ;;
  }

  dimension: of_activities__c {
    type: number
    sql: ${TABLE}.of_activities__c ;;
  }

  dimension: of_open_opps__c {
    type: number
    sql: ${TABLE}.of_open_opps__c ;;
  }

  dimension: offer__c {
    type: string
    sql: ${TABLE}.offer__c ;;
  }

  dimension: old_ecommerce_platform__c {
    type: string
    sql: ${TABLE}.old_ecommerce_platform__c ;;
  }

  dimension_group: opened_date2__c {
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
    sql: ${TABLE}.opened_date2__c ;;
  }

  dimension: opt_in_blog__c {
    type: yesno
    sql: ${TABLE}.opt_in_blog__c ;;
  }

  dimension: opt_in_data_collection__c {
    type: yesno
    sql: ${TABLE}.opt_in_data_collection__c ;;
  }

  dimension: opt_in_newsletter__c {
    type: yesno
    sql: ${TABLE}.opt_in_newsletter__c ;;
  }

  dimension: outreach_actively_being_sequenced__c {
    type: yesno
    sql: ${TABLE}.outreach_actively_being_sequenced__c ;;
  }

  dimension: outreach_current_sequence_name__c {
    type: string
    sql: ${TABLE}.outreach_current_sequence_name__c ;;
  }

  dimension: outreach_initial_sequence_name__c {
    type: string
    sql: ${TABLE}.outreach_initial_sequence_name__c ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: partner_rep_email__c {
    type: string
    sql: ${TABLE}.partner_rep_email__c ;;
  }

  dimension: partner_rep_name__c {
    type: string
    sql: ${TABLE}.partner_rep_name__c ;;
  }

  dimension: partner_rep_phone__c {
    type: string
    sql: ${TABLE}.partner_rep_phone__c ;;
  }

  dimension: partner_sub_group__c {
    type: string
    sql: ${TABLE}.partner_sub_group__c ;;
  }

  dimension: payment_processor__c {
    type: string
    sql: ${TABLE}.payment_processor__c ;;
  }

  dimension: platform_solution_other__c {
    type: string
    sql: ${TABLE}.platform_solution_other__c ;;
  }

  dimension: power_of_1__c {
    type: number
    sql: ${TABLE}.power_of_1__c ;;
  }

  dimension: power_of_1_mql__c {
    type: number
    sql: ${TABLE}.power_of_1_mql__c ;;
  }

  dimension: power_of_1_sql__c {
    type: number
    sql: ${TABLE}.power_of_1_sql__c ;;
  }

  dimension: prevent_lead_notification__c {
    type: yesno
    sql: ${TABLE}.prevent_lead_notification__c ;;
  }

  dimension: product__c {
    type: string
    sql: ${TABLE}.product__c ;;
  }

  dimension: program_name__c {
    type: string
    sql: ${TABLE}.program_name__c ;;
  }

  dimension: qualified_status2__c {
    type: string
    sql: ${TABLE}.qualified_status2__c ;;
  }

  dimension: Lead_Status {
    type: string
    sql: case when ${qualified_status2__c} in ('MQL','Unqualified Lead') then 'UQL'
    when ${qualified_status2__c} in ('SQL') and ${opportunity.power_of_1_sqo__c} = 1 and ${opportunity.recordtypeid} = '012C0000000QLHVIA4' then 'SQO'
    when ${qualified_status2__c} in ('SQL') then 'SQL' else 'UQL' end;;
    order_by_field: lead_status_order
  }


  dimension: lead_status_order {
    type: string
    skip_drill_filter: yes
    sql: if(${Lead_Status} = 'UQL',0,
    if(${Lead_Status} = 'SQL',1,
    if(${Lead_Status} = 'SQO',2,3)));;
  }


  measure: SQL_Count {
    type: count_distinct
    sql_distinct_key: ${id} ;;
    sql: case when ${qualified_status2__c} in ('SQL') then ${id} else null end;;
  }

  measure: SQO_Count {
    type: count_distinct
    sql_distinct_key: ${convertedopportunityid} ;;
    sql: case when ${qualified_status2__c} in ('SQL') and ${opportunity.power_of_1_sqo__c} = 1 then ${convertedopportunityid} else null end;;
  }

  measure: SQL_Conversion_Rate {
    sql: safe_divide(${SQL_Count},${count}) ;;
    value_format: "0.0%"
  }

  measure: SQO_Conversion_Rate {
    sql: safe_divide(${SQO_Count},${SQL_Count}) ;;
    value_format: "0.0%"
  }

  dimension: qualified_status__c {
    type: string
    sql: ${TABLE}.qualified_status__c ;;
  }

  dimension: quarter_created__c {
    type: string
    sql: ${TABLE}.quarter_created__c ;;
  }

  dimension: recordtypeid {
    type: string
    sql: ${TABLE}.recordtypeid ;;
  }

  dimension: referred_by_contact__c {
    type: string
    sql: ${TABLE}.referred_by_contact__c ;;
  }

  dimension: referred_by_partner__c {
    type: string
    sql: ${TABLE}.referred_by_partner__c ;;
  }

  dimension: referred_by_partner_type__c {
    type: string
    sql: ${TABLE}.referred_by_partner_type__c ;;
  }

  dimension_group: reopened_date__c {
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
    sql: ${TABLE}.reopened_date__c ;;
  }

  dimension: replatform__c {
    type: yesno
    sql: ${TABLE}.replatform__c ;;
  }

  dimension: revenue_category__c {
    type: string
    sql: ${TABLE}.revenue_category__c ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension: sdr__c {
    type: string
    sql: ${TABLE}.sdr__c ;;
  }

  dimension: sfcc_rep__c {
    type: string
    sql: ${TABLE}.sfcc_rep__c ;;
  }

  dimension: size_category__c {
    type: string
    sql: ${TABLE}.size_category__c ;;
  }

  dimension: solutions_architect__c {
    type: string
    sql: ${TABLE}.solutions_architect__c ;;
  }

  dimension: source_other_detail__c {
    type: string
    sql: ${TABLE}.source_other_detail__c ;;
  }

  dimension: source_sub_group__c {
    type: string
    sql: ${TABLE}.source_sub_group__c ;;
  }

  dimension: stage_0_unqualified__c {
    type: string
    sql: ${TABLE}.stage_0_unqualified__c ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_comments__c {
    type: string
    sql: ${TABLE}.status_comments__c ;;
  }

  dimension: sub_industry__c {
    type: string
    sql: ${TABLE}.sub_industry__c ;;
  }

  dimension: subject__c {
    type: string
    sql: ${TABLE}.subject__c ;;
  }

  dimension_group: systemmodstamp {
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
    sql: ${TABLE}.systemmodstamp ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: total_time_in_intake_review__c {
    type: number
    sql: ${TABLE}.total_time_in_intake_review__c ;;
  }

  dimension: total_time_in_qualifying__c {
    type: number
    sql: ${TABLE}.total_time_in_qualifying__c ;;
  }

  dimension: total_time_in_working__c {
    type: number
    sql: ${TABLE}.total_time_in_working__c ;;
  }

  dimension_group: uql_date__c {
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
    sql: ${TABLE}.uql_date__c ;;
  }

  dimension: vertical__c {
    type: string
    sql: ${TABLE}.vertical__c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: zoominfo_state__c {
    type: string
    sql: ${TABLE}.zoominfo_state__c ;;
  }

  measure: Custom_Goal {
    type: max
    sql: case when ${qualified_status2__c} = 'SQL' then ${historical_information_google_sheet_connected.goal__sqls}
    when ${qualified_status2__c} = 'Unqualified Lead' then ${historical_information_google_sheet_connected.goal__uqls}
    else 0 end ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  measure: count_distinct {
    type: count_distinct
    sql_distinct_key: ${id} ;;
    sql: ${id} ;;
    drill_fields: [id, name]
  }

  measure: count_distinct_SQL {
    type: count_distinct
    sql_distinct_key: ${id} ;;
    sql: case when ${qualified_status2__c} = 'SQL' then ${id} else null end ;;
    drill_fields: [id, name]
  }


  dimension: category_type {
    type: string
  }

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
    default_value: "Quarter"
  }

  dimension: dynamic_timeframe {
    type: string
    sql:
    case when {% parameter timeframe_picker %} = 'Date' then date(${createddate_date})
    when {% parameter timeframe_picker %} = 'Week' then date(${createddate_week})
    when {% parameter timeframe_picker %} = 'Month' then date(FORMAT_TIMESTAMP('%Y-%m-01', ${createddate_date}))
    when {% parameter timeframe_picker %} = 'Quarter' then DATE_ADD(date((FORMAT_TIMESTAMP('%Y-%m-01', TIMESTAMP_TRUNC(CAST(CAST(DATETIME_ADD(CAST(TIMESTAMP_TRUNC(CAST(Salesforce_leads.createddate  AS TIMESTAMP), MONTH) AS DATETIME), INTERVAL -1 MONTH) AS TIMESTAMP) AS TIMESTAMP), QUARTER)))), INTERVAL 1 MONTH)
    when {% parameter timeframe_picker %} = 'Year' then date(FORMAT_TIMESTAMP('%Y-01-01', ${createddate_date}))
    end ;;
  }
}
