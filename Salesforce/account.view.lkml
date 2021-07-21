view: account {
  sql_table_name: `stitch-poc-306316.salesforce.Account`
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
      year,
      fiscal_quarter
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
      year,
      fiscal_quarter
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
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension_group: churn_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.churn_date__c ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: account_arr__c {
    type: number
    sql: ${TABLE}.account_arr__c ;;
  }

  dimension: account_influenced_by__c {
    type: string
    sql: ${TABLE}.account_influenced_by__c ;;
  }

  dimension: account_notes__c {
    type: string
    sql: ${TABLE}.account_notes__c ;;
  }

  dimension: account_type__c {
    type: string
    sql: ${TABLE}.account_type__c ;;
  }

  dimension: active_accounts_14_days__c {
    type: number
    sql: ${TABLE}.active_accounts_14_days__c ;;
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
      year,
      fiscal_quarter
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
    label: "Dynamic Launch Date"
    type: string
    sql:
    case when {% parameter timeframe_picker %} = 'Date' then date(${actual_launch_date__c_date})
    when {% parameter timeframe_picker %} = 'Week' then date(${actual_launch_date__c_date})
    when {% parameter timeframe_picker %} = 'Month' then date(FORMAT_TIMESTAMP('%Y-%m-01', ${actual_launch_date__c_date}))
    when {% parameter timeframe_picker %} = 'Quarter' then DATE_ADD(date((FORMAT_TIMESTAMP('%Y-%m-01', TIMESTAMP_TRUNC(CAST(CAST(DATETIME_ADD(CAST(TIMESTAMP_TRUNC(CAST(${actual_launch_date__c_date} AS TIMESTAMP), MONTH) AS DATETIME), INTERVAL -1 MONTH) AS TIMESTAMP) AS TIMESTAMP), QUARTER)))), INTERVAL 1 MONTH)
    when {% parameter timeframe_picker %} = 'Year' then date(FORMAT_TIMESTAMP('%Y-01-01', ${actual_launch_date__c_date}))
    end  ;;
  }

  dimension: dynamic_churn_timeframe {
    label: "Dynamic Churn Date"
    type: string
    sql:
    case when {% parameter timeframe_picker %} = 'Date' then date(${churn_date_date})
    when {% parameter timeframe_picker %} = 'Week' then date(${churn_date_date})
    when {% parameter timeframe_picker %} = 'Month' then date(FORMAT_TIMESTAMP('%Y-%m-01', ${churn_date_date}))
    when {% parameter timeframe_picker %} = 'Quarter' then DATE_ADD(date((FORMAT_TIMESTAMP('%Y-%m-01', TIMESTAMP_TRUNC(CAST(CAST(DATETIME_ADD(CAST(TIMESTAMP_TRUNC(CAST(${churn_date_date} AS TIMESTAMP), MONTH) AS DATETIME), INTERVAL -1 MONTH) AS TIMESTAMP) AS TIMESTAMP), QUARTER)))), INTERVAL 1 MONTH)
    when {% parameter timeframe_picker %} = 'Year' then date(FORMAT_TIMESTAMP('%Y-01-01', ${churn_date_date}))
    end  ;;
  }

  dimension: add_ons__c {
    type: string
    sql: ${TABLE}.add_ons__c ;;
  }

  dimension: add_ons_true__c {
    type: yesno
    sql: ${TABLE}.add_ons_true__c ;;
  }

  dimension: add_to_campaign__c {
    type: yesno
    sql: ${TABLE}.add_to_campaign__c ;;
  }

  dimension: additional_support_hours_term__c {
    type: string
    sql: ${TABLE}.additional_support_hours_term__c ;;
  }

  dimension: alexa_score__c {
    type: number
    sql: ${TABLE}.alexa_score__c ;;
  }

  dimension: annual_online_revenue2__c {
    type: string
    sql: ${TABLE}.annual_online_revenue2__c ;;
  }

  dimension: annual_support_hours__c {
    type: number
    sql: ${TABLE}.annual_support_hours__c ;;
  }

  dimension: annual_support_hours_internal__c {
    type: number
    sql: ${TABLE}.annual_support_hours_internal__c ;;
  }

  dimension: arr_calculated_from_parent__c {
    type: yesno
    sql: ${TABLE}.arr_calculated_from_parent__c ;;
  }

  dimension_group: auto_renew_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.auto_renew_date__c ;;
  }

  dimension: auto_renews__c {
    type: yesno
    sql: ${TABLE}.auto_renews__c ;;
  }

  dimension: bi_analytics_provider2__c {
    type: string
    sql: ${TABLE}.bi_analytics_provider2__c ;;
  }

  dimension: block_survey_send__c {
    type: yesno
    sql: ${TABLE}.block_survey_send__c ;;
  }

  dimension: calculated_product__c {
    type: string
    sql: ${TABLE}.calculated_product__c ;;
  }

  dimension: call_schedule__c {
    type: string
    sql: ${TABLE}.call_schedule__c ;;
  }

  dimension: cancellation_policy__c {
    type: string
    sql: ${TABLE}.cancellation_policy__c ;;
  }

  dimension: client_hosted_enrollment__c {
    type: yesno
    sql: ${TABLE}.client_hosted_enrollment__c ;;
  }

  dimension: client_status__c {
    type: string
    sql: ${TABLE}.client_status__c ;;
  }

  dimension: commissions__c {
    type: string
    sql: ${TABLE}.commissions__c ;;
  }

  dimension: company_type__c {
    type: string
    sql: ${TABLE}.company_type__c ;;
  }

  dimension_group: contract_commencement_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.contract_commencement_date__c ;;
  }

  dimension: contract_data_updated__c {
    type: yesno
    sql: ${TABLE}.contract_data_updated__c ;;
  }

  dimension: contract_end_quarter__c {
    type: string
    sql: ${TABLE}.contract_end_quarter__c ;;
  }

  dimension: contract_length_mths__c {
    type: number
    sql: ${TABLE}.contract_length_mths__c ;;
  }

  dimension: contract_type__c {
    type: string
    sql: ${TABLE}.contract_type__c ;;
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
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.createddate ;;
  }

  dimension: cs_tracker_status__c {
    type: string
    sql: ${TABLE}.cs_tracker_status__c ;;
  }

  dimension: current_risk__c {
    type: number
    sql: ${TABLE}.current_risk__c ;;
  }

  dimension: current_subscription_provider__c {
    type: string
    sql: ${TABLE}.current_subscription_provider__c ;;
  }

  dimension: current_tier__c {
    type: string
    sql: ${TABLE}.current_tier__c ;;
  }

  dimension: custom_packages__c {
    type: string
    sql: ${TABLE}.custom_packages__c ;;
  }

  dimension: custom_packages_true__c {
    type: yesno
    sql: ${TABLE}.custom_packages_true__c ;;
  }

  dimension: customer_segment__c {
    type: string
    sql: ${TABLE}.customer_segment__c ;;
  }

  dimension: customer_support_provider2__c {
    type: string
    sql: ${TABLE}.customer_support_provider2__c ;;
  }

  dimension: days_live__c {
    type: number
    sql: ${TABLE}.days_live__c ;;
  }

  dimension: days_to_launch__c {
    type: number
    sql: ${TABLE}.days_to_launch__c ;;
  }

  dimension: delightedinc__detractors__c {
    type: number
    sql: ${TABLE}.delightedinc__detractors__c ;;
  }

  dimension: delightedinc__nps__c {
    type: number
    sql: ${TABLE}.delightedinc__nps__c ;;
  }

  dimension: delightedinc__passives__c {
    type: number
    sql: ${TABLE}.delightedinc__passives__c ;;
  }

  dimension: delightedinc__promoters__c {
    type: number
    sql: ${TABLE}.delightedinc__promoters__c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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
      year,
      fiscal_quarter
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
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.dozisf__zoominfo_last_updated__c ;;
  }

  dimension: early_opt_out__c {
    type: yesno
    sql: ${TABLE}.early_opt_out__c ;;
  }

  dimension: early_opt_out_details__c {
    type: string
    sql: ${TABLE}.early_opt_out_details__c ;;
  }

  dimension: ecommerce_platform2__c {
    type: string
    sql: ${TABLE}.ecommerce_platform2__c ;;
  }

  dimension_group: effective_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.effective_date__c ;;
  }

  dimension: email_service_provider2__c {
    type: string
    sql: ${TABLE}.email_service_provider2__c ;;
  }

  dimension: email_technology__c {
    type: string
    sql: ${TABLE}.email_technology__c ;;
  }

  dimension: employee_range__c {
    type: string
    sql: ${TABLE}.employee_range__c ;;
  }

  dimension_group: end_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.end_date__c ;;
  }

  dimension: existing_custom_feature__c {
    type: yesno
    sql: ${TABLE}.existing_custom_feature__c ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension_group: gmv_end_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.gmv_end_date__c ;;
  }

  dimension: Annual_GMV_Days_Left {
    type: number
    sql: date_diff(${gmv_end_date__c_date},current_date(), DAY)  ;;
  }

  dimension: gmv_for_quadrants__c {
    type: string
    sql: ${TABLE}.gmv_for_quadrants__c ;;
  }

  dimension: gmv_overages__c {
    type: string
    sql: ${TABLE}.gmv_overages__c ;;
  }

  dimension: gmv_reset__c {
    type: string
    sql: ${TABLE}.gmv_reset__c ;;
  }

  dimension_group: gmv_start_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.gmv_start_date__c ;;
  }

  dimension: hq_phone__c {
    type: string
    sql: ${TABLE}.hq_phone__c ;;
  }

  dimension: implementation_fee__c {
    type: number
    sql: ${TABLE}.implementation_fee__c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: industry_category__c {
    type: string
    sql: ${TABLE}.industry_category__c ;;
  }

  dimension: integration_hours_included__c {
    type: number
    sql: ${TABLE}.integration_hours_included__c ;;
  }

  measure: integration_hours_included {
    type: max
    sql: ${integration_hours_included__c} ;;
  }

  dimension: is_parent_account__c {
    type: yesno
    sql: ${TABLE}.is_parent_account__c ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: isf_billing_terms__c {
    type: string
    sql: ${TABLE}.isf_billing_terms__c ;;
  }

  dimension: ispartner {
    type: yesno
    sql: ${TABLE}.ispartner ;;
  }

  dimension: jen_field__c {
    type: yesno
    sql: ${TABLE}.jen_field__c ;;
  }

  dimension: jigsawcompanyid {
    type: string
    sql: ${TABLE}.jigsawcompanyid ;;
  }

  dimension_group: last_qbr__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.last_qbr__c ;;
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
      year,
      fiscal_quarter
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
      year,
      fiscal_quarter
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
      year,
      fiscal_quarter
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
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.lastvieweddate ;;
  }

  dimension: lead_id__c {
    type: string
    sql: ${TABLE}.lead_id__c ;;
  }

  dimension: level_of_risk__c {
    type: string
    sql: ${TABLE}.level_of_risk__c ;;
  }

  dimension: lid__linkedin_company_id__c {
    type: string
    sql: ${TABLE}.lid__linkedin_company_id__c ;;
  }

  dimension: link_to_confluence_docs__c {
    type: string
    sql: ${TABLE}.link_to_confluence_docs__c ;;
  }

  dimension: logo__c {
    type: string
    sql: ${TABLE}.logo__c ;;
  }

  dimension: loyalty_promotions_provider2__c {
    type: string
    sql: ${TABLE}.loyalty_promotions_provider2__c ;;
  }

  dimension: marketing_automation_provider2__c {
    type: string
    sql: ${TABLE}.marketing_automation_provider2__c ;;
  }

  dimension: masterrecordid {
    type: string
    sql: ${TABLE}.masterrecordid ;;
  }

  dimension: merchant_id__c {
    type: number
    value_format_name: id
    sql: ${TABLE}.merchant_id__c ;;
  }

  dimension: migration_needed__c {
    type: string
    sql: ${TABLE}.migration_needed__c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "Account Name"
  }

  dimension: needs_shopify_scripts__c {
    type: string
    sql: ${TABLE}.needs_shopify_scripts__c ;;
  }

  dimension: new_arr__c {
    type: number
    sql: ${TABLE}.new_arr__c ;;
  }

  dimension: new_custom_feature__c {
    type: yesno
    sql: ${TABLE}.new_custom_feature__c ;;
  }

  dimension_group: next_gmv_auto_update__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.next_gmv_auto_update__c ;;
  }

  dimension_group: non_renewal_notice_end_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.non_renewal_notice_end_date__c ;;
  }

  dimension: number_of_stores__c {
    type: number
    sql: ${TABLE}.number_of_stores__c ;;
  }

  dimension: offers_technology__c {
    type: string
    sql: ${TABLE}.offers_technology__c ;;
  }

  dimension: og_legacy__c {
    type: yesno
    sql: ${TABLE}.og_legacy__c ;;
  }

  dimension_group: opt_out_beginning_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.opt_out_beginning_date__c ;;
  }

  dimension_group: opt_out_ending_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.opt_out_ending_date__c ;;
  }

  dimension: original_acv__c {
    type: number
    sql: ${TABLE}.original_acv__c ;;
  }

  dimension_group: original_signed_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter,
      fiscal_quarter_of_year
    ]
    sql: ${TABLE}.original_signed_date__c ;;
  }

  dimension: other_renewal_details__c {
    type: string
    sql: ${TABLE}.other_renewal_details__c ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}.parentid ;;
  }

  dimension: partner_account__c {
    type: string
    sql: ${TABLE}.partner_account__c ;;
  }

  dimension: partner_type__c {
    type: string
    sql: ${TABLE}.partner_type__c ;;
  }

  dimension: payment_processor2__c {
    type: string
    sql: ${TABLE}.payment_processor2__c ;;
  }

  dimension: payment_terms_net__c {
    type: string
    sql: ${TABLE}.payment_terms_net__c ;;
  }

  dimension: potential_revenue_for_quadrants__c {
    type: string
    sql: ${TABLE}.potential_revenue_for_quadrants__c ;;
  }

  dimension: power_of_1__c {
    type: number
    sql: ${TABLE}.power_of_1__c ;;
  }

  dimension: power_of_1_scaling__c {
    type: yesno
    sql: ${TABLE}.power_of_1_scaling__c ;;
  }

  dimension: pr__c {
    type: string
    sql: ${TABLE}.pr__c ;;
  }

  dimension_group: pr_start_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.pr_start_date__c ;;
  }

  dimension: practice_area_bigcommerce__c {
    type: yesno
    sql: ${TABLE}.practice_area_bigcommerce__c ;;
  }

  dimension: practice_area_magento__c {
    type: yesno
    sql: ${TABLE}.practice_area_magento__c ;;
  }

  dimension: practice_area_other__c {
    type: yesno
    sql: ${TABLE}.practice_area_other__c ;;
  }

  dimension: practice_area_sap_hybris__c {
    type: yesno
    sql: ${TABLE}.practice_area_sap_hybris__c ;;
  }

  dimension: practice_area_sfcc__c {
    type: yesno
    sql: ${TABLE}.practice_area_sfcc__c ;;
  }

  dimension: practice_area_shopify__c {
    type: yesno
    sql: ${TABLE}.practice_area_shopify__c ;;
  }

  dimension: primary_success_owner__c {
    type: string
    sql: ${TABLE}.primary_success_owner__c ;;
  }

  dimension: product__c {
    type: string
    sql: ${TABLE}.product__c ;;
  }

  dimension: program_service_fee_annual__c {
    type: string
    sql: ${TABLE}.program_service_fee_annual__c ;;
  }

  dimension_group: psf_billing_start_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.psf_billing_start_date__c ;;
  }

  dimension: psf_billing_terms__c {
    type: string
    sql: ${TABLE}.psf_billing_terms__c ;;
  }

  dimension: rate_card_acv__c {
    type: number
    sql: ${TABLE}.rate_card_acv__c ;;
  }

  measure: Total_Rate_Card_ACV {
    type: sum
    sql: ${rate_card_acv__c} ;;
  }

  dimension: rate_card_implementation_fee__c {
    type: number
    sql: ${TABLE}.rate_card_implementation_fee__c ;;
  }

  measure: Total_Rate_Card_Implementation_Fee {
    type: sum
    sql: ${rate_card_implementation_fee__c} ;;
  }

  dimension: imp_fee_rate_card__c {
    type: number
    sql: ${TABLE}.imp_fee_rate_card__c ;;
  }

  measure: Total_Implementation_Fee_Rate_Card {
    type: sum
    sql: ${imp_fee_rate_card__c} ;;
  }

  dimension: acv_rate_card__c {
    type: number
    sql: ${TABLE}.acv_rate_card__c ;;
  }

  measure: Total_ACV_Rate_Card {
    type: sum
    sql: ${acv_rate_card__c} ;;
  }

  dimension: rc_stage_current_point__c {
    type: string
    sql: ${TABLE}.rc_stage_current_point__c ;;
  }

  dimension: rc_stage_starting_point__c {
    type: string
    sql: ${TABLE}.rc_stage_starting_point__c ;;
  }

  dimension: reason_for_custom__c {
    type: string
    sql: ${TABLE}.reason_for_custom__c ;;
  }

  dimension: reason_for_custom_other_details__c {
    type: string
    sql: ${TABLE}.reason_for_custom_other_details__c ;;
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

  dimension: renewal_terms__c {
    type: string
    sql: ${TABLE}.renewal_terms__c ;;
  }

  dimension: revenue_range__c {
    type: string
    sql: ${TABLE}.revenue_range__c ;;
  }

  dimension: secondary_success_owner__c {
    type: string
    sql: ${TABLE}.secondary_success_owner__c ;;
  }

  dimension_group: signed_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter,
      fiscal_quarter_of_year
    ]
    sql: ${TABLE}.signed_date__c ;;
  }

  dimension: Months_Since_Signing {
    type: number
    sql: DATE_DIFF(Current_Date(), ${original_signed_date__c_date}, MONTH) ;;
  }

  dimension: smi_technology__c {
    type: string
    sql: ${TABLE}.smi_technology__c ;;
  }

  dimension: solutions_architect__c {
    type: string
    sql: ${TABLE}.solutions_architect__c ;;
  }

  dimension: solutions_contact__c {
    type: string
    sql: ${TABLE}.solutions_contact__c ;;
  }

  dimension: solutions_partner__c {
    type: string
    sql: ${TABLE}.solutions_partner__c ;;
  }

  dimension_group: start_date__c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.start_date__c ;;
  }

  dimension: strategic_account__c {
    type: string
    sql: ${TABLE}.strategic_account__c ;;
  }

  dimension: sub_vertical__c {
    type: string
    sql: ${TABLE}.sub_vertical__c ;;
  }

  dimension: support_hours_included__c {
    type: string
    sql: ${TABLE}.support_hours_included__c ;;
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
      year,
      fiscal_quarter
    ]
    sql: ${TABLE}.systemmodstamp ;;
  }

  dimension: target_integration_hours_internal__c {
    type: number
    sql: ${TABLE}.target_integration_hours_internal__c ;;
  }

  measure: target_integration_hours {
    type: sum
    sql: ${target_integration_hours_internal__c} ;;
  }

  dimension: technologies__c {
    type: string
    sql: ${TABLE}.technologies__c ;;
  }

  dimension: tickersymbol {
    type: string
    sql: ${TABLE}.tickersymbol ;;
  }

  dimension: tier_1_bonus__c {
    type: number
    sql: ${TABLE}.tier_1_bonus__c ;;
  }

  dimension: tier_1_gmv__c {
    type: number
    sql: ${TABLE}.tier_1_gmv__c ;;
  }

  dimension: tier_2_bonus__c {
    type: number
    sql: ${TABLE}.tier_2_bonus__c ;;
  }

  dimension: tier_2_gmv__c {
    type: number
    sql: ${TABLE}.tier_2_gmv__c ;;
  }

  dimension: tier_3_bonus__c {
    type: number
    sql: ${TABLE}.tier_3_bonus__c ;;
  }

  dimension: tier_3_gmv__c {
    type: number
    sql: ${TABLE}.tier_3_gmv__c ;;
  }

  dimension: tier_4_bonus__c {
    type: number
    sql: ${TABLE}.tier_4_bonus__c ;;
  }

  dimension: tier_4_gmv__c {
    type: number
    sql: ${TABLE}.tier_4_gmv__c ;;
  }

  dimension: total_funding__c {
    type: string
    sql: ${TABLE}.total_funding__c ;;
  }

  dimension: total_parent_base_acv__c {
    type: number
    sql: ${TABLE}.total_parent_base_acv__c ;;
  }

  dimension: travel_reimbursement__c {
    type: string
    sql: ${TABLE}.travel_reimbursement__c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: zoominfo_state__c {
    type: string
    sql: ${TABLE}.zoominfo_state__c ;;
  }

  dimension: Build_Your_Own_Bundle {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Build Your Own Bundle%' then 'yes' else 'no' end ;;
  }

  dimension: eCommerce_Platform_Integrations {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%eCommerce Platform Integrations%' then 'yes' else 'no' end ;;
  }

  dimension: Legacy_Advanced_Promos {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Legacy Advanced Promos%' then 'yes' else 'no' end ;;
  }

  dimension: Prepaid_Subscriptions {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Prepaid Subscriptions%' then 'yes' else 'no' end ;;
  }

  dimension: SMS_Reorder {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%SMS Reorder%' then 'yes' else 'no' end ;;
  }

  dimension: Customer_Group_Pricing_and_Promotions {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Customer Group Pricing and Promotions%' then 'yes' else 'no' end ;;
  }

  dimension: Subscribe_More_Save_More {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Subscribe More, Save More%' then 'yes' else 'no' end ;;
  }

  dimension: Dynamic_Shipping_Method_or_Rate {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Dynamic Shipping Method or Rate%' then 'yes' else 'no' end ;;
  }

  dimension: Legacy_Other {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Legacy Other%' then 'yes' else 'no' end ;;
  }

  dimension: Modify_SMI_Based_on_SKU_or_Logic {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Modify SMI Based on SKU or Logic%' then 'yes' else 'no' end ;;
  }

  dimension: SMS_Subscription_Management {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%SMS Subscription Management%' then 'yes' else 'no' end ;;
  }

  dimension: Gift_With_Purchase {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Gift With Purchase%' then 'yes' else 'no' end ;;
  }

  dimension: Custom_ESP_Integration {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Custom ESP Integration%' then 'yes' else 'no' end ;;
  }

  dimension: Account_Updater {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Account Updater%' then 'yes' else 'no' end ;;
  }

  dimension: Alternate_Payment_Methods {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Alternate Payment Methods%' then 'yes' else 'no' end ;;
  }

  dimension: Committed_Plans {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Committed Plans%' then 'yes' else 'no' end ;;
  }

  dimension: Discovery_Box_Clubs_Curation {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Discovery Box, Clubs & Curation%' then 'yes' else 'no' end ;;
  }

  dimension: Gifting {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Gifting%' then 'yes' else 'no' end ;;
  }

  dimension: Memberships_Custom {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Memberships Custom%' then 'yes' else 'no' end ;;
  }

  dimension: Price_Lock_at_Sub_Level {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Price Lock at Sub Level%' then 'yes' else 'no' end ;;
  }

  dimension: Subscribe_Anywhere_Pick_up_Anywhere_One_Time {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Subscribe Anywhere Pick up Anywhere One Time%' then 'yes' else 'no' end ;;
  }

  dimension: Subscribe_Anywhere_Pick_up_Anywhere_Full_Time {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Subscribe Anywhere Pick up Anywhere Full Time%' then 'yes' else 'no' end ;;
  }

  dimension: Temporarily_Out_of_Stock {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Temporarily Out of Stock%' then 'yes' else 'no' end ;;
  }

  dimension: Real_Time_Inventory  {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages__c} like '%Real Time Inventory %' then 'yes' else 'no' end ;;
  }

  dimension: Same_Brand_Multi_Site {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons__c} like '%Same Brand Multi-Site%' then 'yes' else 'no' end ;;
  }

  dimension: Multi_Language_Support {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons__c} like '%Multi-Language Support%' or ${add_ons__c} like '%Non-US Domain - Dual Language%' then 'yes' else 'no' end ;;
  }

  dimension: Advanced_Promos {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons__c} like '%Advanced Promos%' then 'yes' else 'no' end ;;
  }

  dimension: Non_US_Domain_Single_Language {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons__c} like '%Non-US Domain - Single Language%' then 'yes' else 'no' end ;;
  }

  dimension: Advanced_Configurations {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons__c} like '%Advanced Configurations%' then 'yes' else 'no' end ;;
  }

  dimension: Different_Brand_Multi_Site {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons__c} like '%Different Brand Multi-Site%' then 'yes' else 'no' end ;;
  }

  dimension: BigCommerce_Tax{
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons__c} like '%BigCommerce Tax%' then 'yes' else 'no' end ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, account_history.count, current_subscription_provider__c,opportunity.count,current_risk__c,level_of_risk__c,client_status_tracker__c.original_expected_launch_date__c_date,client_status_tracker__c.current_estimated_launch_date__c_date,client_status_tracker__c.project_slippage__c, client_status_tracker__c.stage__c, partner_account__c.name, actual_launch_date__c_date, current_risk__c, surveys__c.nps_question__c]
  }

  measure: avg_original_acv__c {
    type: average
    sql: ${original_acv__c} ;;
  }

  measure: annual_support_hours_max {
    type: max
    sql: ${annual_support_hours__c} ;;
  }

  measure: sum_original_acv__c {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${tier_1_bonus__c} ;;
    value_format: "$#,##0"
    drill_fields: [id,name,original_acv__c,actual_launch_date__c_date,churn_date_date]
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;}

  dimension: Days_to_Launch {
    type: number
    sql: case when ${client_status__c} = 'Live' and ${original_signed_date__c_date} is not null and ${actual_launch_date__c_date} is not null then DATE_DIFF( date(${actual_launch_date__c_date}), date(${original_signed_date__c_date}), DAY) else null end ;;
  }

  measure: Avg_Days_to_Launch{
    type: average
    sql: ${Days_to_Launch} ;;
    value_format: "0.0"
  }

  measure: total_implementation {
    type: sum
    sql: ${implementation_fee__c} ;;
  }

  measure: Forecast_Churn_Risk {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: case when ${level_of_risk__c} = '4' then ${current_risk__c}*0.5
         when ${level_of_risk__c} = '5 - High' then ${current_risk__c} end;;
    value_format: "$#,##0"

  }

  measure: sum_current_risk {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${current_risk__c} ;;
    value_format: "$#,##0"
    drill_fields: [id,name,original_acv__c,actual_launch_date__c_date,churn_date_date,partner_account__c.name, current_subscription_provider__c, customer_segment__c, level_of_risk__c, churn_date_date]
  }

  dimension: total_custom_features {
    type: number
    sql:     case when ${Account_Updater} = 'yes' then 1 else 0 end +
              case when ${Alternate_Payment_Methods} = 'yes' then 1 else 0 end +
              case when ${Build_Your_Own_Bundle} = 'yes' then 1 else 0 end +
              case when ${Custom_ESP_Integration} = 'yes' then 1 else 0 end +
              case when ${Customer_Group_Pricing_and_Promotions} = 'yes' then 1 else 0 end +
              case when ${Discovery_Box_Clubs_Curation} = 'yes' then 1 else 0 end +
              case when ${eCommerce_Platform_Integrations} = 'yes' then 1 else 0 end +
              case when ${Gift_With_Purchase} = 'yes' then 1 else 0 end +
              case when ${Gifting} = 'yes' then 1 else 0 end +
              case when ${Multi_Language_Support} = 'yes' then 1 else 0 end +
              case when ${Memberships_Custom} = 'yes' then 1 else 0 end +
              case when ${migration_needed__c} = 'yes' then 1 else 0 end +
              case when ${Modify_SMI_Based_on_SKU_or_Logic} = 'yes' then 1 else 0 end +
              case when ${Prepaid_Subscriptions} = 'yes' then 1 else 0 end +
              case when ${Price_Lock_at_Sub_Level} = 'yes' then 1 else 0 end +
              case when ${SMS_Reorder} = 'yes' then 1 else 0 end +
              case when ${Subscribe_Anywhere_Pick_up_Anywhere_Full_Time} = 'yes' then 1 else 0 end +
              case when ${Subscribe_More_Save_More} = 'yes' then 1 else 0 end;;

    }

  dimension: total_add_ons {
    type: number
    sql:     case when ${Same_Brand_Multi_Site} = 'yes' then 1 else 0 end +
              case when ${Multi_Language_Support} = 'yes' then 1 else 0 end +
              case when ${Advanced_Promos} = 'yes' then 1 else 0 end +
              case when ${Non_US_Domain_Single_Language} = 'yes' then 1 else 0 +
              case when ${Advanced_Configurations} = 'yes' then 1 else 0 end +
              case when ${Different_Brand_Multi_Site} = 'yes' then 1 else 0 end +
              case when ${BigCommerce_Tax} = 'yes' then 1 else 0 end
              end;;

    }
}
