view: client_status_tracker__c {
  sql_table_name: `stitch-poc-306316.salesforce.Client_Status_Tracker__c`
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

  dimension_group: actual_launch_date__c {
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
    sql: ${TABLE}.actual_launch_date__c ;;
  }

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
    default_value: "Quarter"
  }

  dimension: dynamic_created_timeframe {
    label: "Dynamic Expected Launch Date"
    type: string
    sql:
    case when {% parameter timeframe_picker %} = 'Date' then date(${current_estimated_launch_date__c_date})
    when {% parameter timeframe_picker %} = 'Week' then date(${current_estimated_launch_date__c_date})
    when {% parameter timeframe_picker %} = 'Month' then date(FORMAT_TIMESTAMP('%Y-%m-01', ${current_estimated_launch_date__c_date}))
    when {% parameter timeframe_picker %} = 'Quarter' then DATE_ADD(date((FORMAT_TIMESTAMP('%Y-%m-01', TIMESTAMP_TRUNC(CAST(CAST(DATETIME_ADD(CAST(TIMESTAMP_TRUNC(CAST(${current_estimated_launch_date__c_date} AS TIMESTAMP), MONTH) AS DATETIME), INTERVAL -1 MONTH) AS TIMESTAMP) AS TIMESTAMP), QUARTER)))), INTERVAL 1 MONTH)
    when {% parameter timeframe_picker %} = 'Year' then date(FORMAT_TIMESTAMP('%Y-01-01', ${current_estimated_launch_date__c_date}))
    end  ;;
  }

  dimension: app_cartridge_installed__c {
    type: string
    sql: ${TABLE}.app_cartridge_installed__c ;;
  }

  dimension: checklist_denominator__c {
    type: number
    sql: ${TABLE}.checklist_denominator__c ;;
  }

  dimension: checklist_numerator__c {
    type: number
    sql: ${TABLE}.checklist_numerator__c ;;
  }

  dimension: client_kickoff_call__c {
    type: string
    sql: ${TABLE}.client_kickoff_call__c ;;
  }

  dimension: configured_in_production__c {
    type: string
    sql: ${TABLE}.configured_in_production__c ;;
  }

  dimension_group: contract_signed_date__c {
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
    sql: ${TABLE}.contract_signed_date__c ;;
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

  dimension_group: current_estimated_launch_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      fiscal_quarter_of_year,
      fiscal_year,
      fiscal_quarter,
      quarter,
      year
    ]
    sql: ${TABLE}.current_estimated_launch_date__c ;;
  }

  dimension: Months_Between_Sign_And_Expected_Launch {
    type: number
    sql: Date_Diff(${current_estimated_launch_date__c_date}, ${contract_signed_date__c_date}, MONTH) ;;
  }

  dimension: current_impact_statement__c {
    type: string
    sql: ${TABLE}.current_impact_statement__c ;;
  }

  dimension: current_quarter_launch_target__c {
    type: string
    sql: ${TABLE}.current_quarter_launch_target__c ;;
  }

  dimension: custom_instant_upsell_configured__c {
    type: string
    sql: ${TABLE}.custom_instant_upsell_configured__c ;;
  }

  dimension: custom_offers_configured__c {
    type: string
    sql: ${TABLE}.custom_offers_configured__c ;;
  }

  dimension: custom_smi_configured__c {
    type: string
    sql: ${TABLE}.custom_smi_configured__c ;;
  }

  dimension: days_since_contract__c {
    type: number
    sql: ${TABLE}.days_since_contract__c ;;
  }

  dimension: days_since_last_service_update__c {
    type: number
    sql: ${TABLE}.days_since_last_service_update__c ;;
  }

  dimension: ecommerce_platform__c {
    type: string
    sql: ${TABLE}.ecommerce_platform__c ;;
  }

  dimension: emails_configured__c {
    type: string
    sql: ${TABLE}.emails_configured__c ;;
  }

  dimension: full_end_to_end_qa_complete__c {
    type: string
    sql: ${TABLE}.full_end_to_end_qa_complete__c ;;
  }

  dimension: intake_form_completed__c {
    type: string
    sql: ${TABLE}.intake_form_completed__c ;;
  }

  dimension: intake_form_sent__c {
    type: string
    sql: ${TABLE}.intake_form_sent__c ;;
  }

  dimension: integration_checklist__c {
    type: number
    sql: ${TABLE}.integration_checklist__c ;;
    value_format: "0\%"
  }

  dimension: percent_completed_integration {
    type: number
    sql: ${TABLE}.integration_checklist__c ;;
  }

  measure: Intergration_Percent_Complete {
    type: sum
    sql: case when ${percent_completed_integration} is not null then cast(${percent_completed_integration} as FLOAT64) else 0 end ;;
  }

  dimension: integration_effort__c {
    type: string
    sql: ${TABLE}.integration_effort__c ;;
  }

  dimension_group: integration_start_date__c {
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
    sql: ${TABLE}.integration_start_date__c ;;
  }

  dimension: internal_kickoff__c {
    type: string
    sql: ${TABLE}.internal_kickoff__c ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: last_modified_by_role__c {
    type: string
    sql: ${TABLE}.last_modified_by_role__c ;;
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

  dimension: link_to_smartsheet_project__c {
    type: string
    sql: ${TABLE}.link_to_smartsheet_project__c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: needs_shopifypay__c {
    type: yesno
    sql: ${TABLE}.needs_shopifypay__c ;;
  }

  dimension: notes__c {
    type: string
    sql: ${TABLE}.notes__c ;;
  }

  dimension: order_placement_configured__c {
    type: string
    sql: ${TABLE}.order_placement_configured__c ;;
  }

  dimension_group: original_expected_launch_date__c {
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
    sql: ${TABLE}.original_expected_launch_date__c ;;
  }

  dimension: product_configuration_file_uploaded__c {
    type: string
    sql: ${TABLE}.product_configuration_file_uploaded__c ;;
  }

  dimension: product_feed_synced__c {
    type: string
    sql: ${TABLE}.product_feed_synced__c ;;
  }

  dimension: productlookup__c {
    type: string
    sql: ${TABLE}.productlookup__c ;;
  }

  dimension: program_design_call__c {
    type: string
    sql: ${TABLE}.program_design_call__c ;;
  }

  dimension: project_slippage__c {
    type: number
    sql: ${TABLE}.project_slippage__c ;;
  }

  dimension: promotion_configured__c {
    type: string
    sql: ${TABLE}.promotion_configured__c ;;
  }

  dimension: purchase_post_configured__c {
    type: string
    sql: ${TABLE}.purchase_post_configured__c ;;
  }

  dimension: rc3_instant_upsell_configured__c {
    type: string
    sql: ${TABLE}.rc3_instant_upsell_configured__c ;;
  }

  dimension: rc3_offers_configured__c {
    type: string
    sql: ${TABLE}.rc3_offers_configured__c ;;
  }

  dimension: recordtypeid {
    type: string
    sql: ${TABLE}.recordtypeid ;;
  }

  dimension: remaining_launch_outlook__c {
    type: string
    sql: ${TABLE}.remaining_launch_outlook__c ;;
  }

  dimension_group: service_last_modified_date__c {
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
    sql: ${TABLE}.service_last_modified_date__c ;;
  }

  dimension: smi_configured__c {
    type: string
    sql: ${TABLE}.smi_configured__c ;;
  }

  dimension: solutions_contact__c {
    type: string
    sql: ${TABLE}.solutions_contact__c ;;
  }

  dimension: solutions_partner__c {
    type: string
    sql: ${TABLE}.solutions_partner__c ;;
  }

  dimension: stage__c {
    type: string
    sql: ${TABLE}.stage__c ;;
  }

  dimension: status_notes__c {
    type: string
    sql: ${TABLE}.status_notes__c ;;
  }

  dimension: subscriber_migration_file_tested__c {
    type: string
    sql: ${TABLE}.subscriber_migration_file_tested__c ;;
  }

  dimension: subscription_enrollment_configured__c {
    type: string
    sql: ${TABLE}.subscription_enrollment_configured__c ;;
  }

  dimension: success_owner__c {
    type: string
    sql: ${TABLE}.success_owner__c ;;
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

  dimension: update_apis_configured__c {
    type: string
    sql: ${TABLE}.update_apis_configured__c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  measure: Days_Since_start_of_Integration{
    type:number
    sql: date_diff(
            case when ${actual_launch_date__c_date} is null then CURRENT_DATE()
              else Date(EXTRACT(YEAR FROM ${actual_launch_date__c_date}),EXTRACT(MONTH FROM ${actual_launch_date__c_date}),EXTRACT(DAY FROM ${actual_launch_date__c_date}))
              end,
            DATE(EXTRACT(YEAR FROM ${integration_start_date__c_date}),EXTRACT(MONTH FROM ${integration_start_date__c_date}),EXTRACT(DAY FROM ${integration_start_date__c_date})),
            DAY) ;;
  }
}
