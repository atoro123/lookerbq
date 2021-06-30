view: opportunity {
  sql_table_name: `stitch-poc-306316.salesforce.Opportunity`
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

  dimension: secondary_cateogry {
    sql: case when ${recordtypeid} in ('0121A000000CCahQAG','0121A000000GV5xQAG','0120h000000IB51AAG') then 'Expansion' else '' end ;;
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

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: accountid {
    type: string
    # hidden: yes
    sql: ${TABLE}.accountid ;;
  }

  dimension: acv_year_1__c {
    type: number
    sql: ${TABLE}.acv_year_1__c ;;
  }

  dimension: acv_year_2__c {
    type: number
    sql: ${TABLE}.acv_year_2__c ;;
  }

  dimension: acv_year_3__c {
    type: number
    sql: ${TABLE}.acv_year_3__c ;;
  }

  dimension: acv_year_4__c {
    type: number
    sql: ${TABLE}.acv_year_4__c ;;
  }

  dimension: acv_year_5__c {
    type: number
    sql: ${TABLE}.acv_year_5__c ;;
  }

  dimension: add_ons__c {
    type: string
    sql: ${TABLE}.add_ons__c ;;
  }

  dimension: aligned_top3_priority_this_fq__c {
    type: yesno
    sql: ${TABLE}.aligned_top3_priority_this_fq__c ;;
  }

  dimension: aligned_top_3_priority_this_fq_points__c {
    type: number
    sql: ${TABLE}.aligned_top_3_priority_this_fq_points__c ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: annual_contract_value_acv__c {
    type: number
    sql: ${TABLE}.annual_contract_value_acv__c ;;
  }

  dimension: annual_included_volume__c {
    type: number
    sql: ${TABLE}.annual_included_volume__c ;;
  }

  dimension: annual_orders__c {
    type: number
    sql: ${TABLE}.annual_orders__c ;;
  }

  dimension: annual_revenue_previous_year__c {
    type: string
    sql: ${TABLE}.annual_revenue_previous_year__c ;;
  }

  dimension: annual_unique_customers__c {
    type: number
    sql: ${TABLE}.annual_unique_customers__c ;;
  }

  dimension_group: anticipated_launch_date__c {
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
    sql: ${TABLE}.anticipated_launch_date__c ;;
  }

  dimension: aov__c {
    type: string
    sql: ${TABLE}.aov__c ;;
  }

  dimension: auto_renewal__c {
    type: string
    sql: ${TABLE}.auto_renewal__c ;;
  }

  dimension_group: auto_renewal_date__c {
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
    sql: ${TABLE}.auto_renewal_date__c ;;
  }

  dimension: bdr_lead__c {
    type: yesno
    sql: ${TABLE}.bdr_lead__c ;;
  }

  dimension: bi_analytics_provider2__c {
    type: string
    sql: ${TABLE}.bi_analytics_provider2__c ;;
  }

  dimension: bill_to_currencies__c {
    type: string
    sql: ${TABLE}.bill_to_currencies__c ;;
  }

  dimension: billing_terms__c {
    type: string
    sql: ${TABLE}.billing_terms__c ;;
  }

  dimension: biz_case_attached__c {
    type: yesno
    sql: ${TABLE}.biz_case_attached__c ;;
  }

  dimension: bundles__c {
    type: yesno
    sql: ${TABLE}.bundles__c ;;
  }

  dimension: campaignid {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaignid ;;
  }

  dimension: champion__c {
    type: string
    sql: ${TABLE}.champion__c ;;
  }

  dimension: champion_tested__c {
    type: yesno
    sql: ${TABLE}.champion_tested__c ;;
  }

  dimension: champion_tested_points__c {
    type: number
    sql: ${TABLE}.champion_tested_points__c ;;
  }

  dimension: client_hosted_enrollment__c {
    type: yesno
    sql: ${TABLE}.client_hosted_enrollment__c ;;
  }

  dimension: client_hosted_msi__c {
    type: string
    sql: ${TABLE}.client_hosted_msi__c ;;
  }

  dimension: client_hosted_offers__c {
    type: string
    sql: ${TABLE}.client_hosted_offers__c ;;
  }

  dimension: client_hosted_other_experience__c {
    type: string
    sql: ${TABLE}.client_hosted_other_experience__c ;;
  }

  dimension: client_success_specialist__c {
    type: string
    sql: ${TABLE}.client_success_specialist__c ;;
  }

  dimension: close_date_difference__c {
    type: number
    sql: ${TABLE}.close_date_difference__c ;;
  }

  dimension: close_quarter__c {
    type: number
    sql: ${TABLE}.close_quarter__c ;;
  }

  dimension: closed_lost_notes__c {
    type: string
    sql: ${TABLE}.closed_lost_notes__c ;;
  }

  dimension: closed_lost_reason2__c {
    type: string
    sql: ${TABLE}.closed_lost_reason2__c ;;
  }

  dimension: closed_lost_reason__c {
    type: string
    sql: ${TABLE}.closed_lost_reason__c ;;
  }

  dimension: closed_lost_sub_reason__c {
    type: string
    sql: ${TABLE}.closed_lost_sub_reason__c ;;
  }

  dimension_group: closedate {
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
    sql: ${TABLE}.closedate ;;
  }

  dimension: co_sell_partner__c {
    type: string
    sql: ${TABLE}.co_sell_partner__c ;;
  }

  dimension: co_selling_notes__c {
    type: string
    sql: ${TABLE}.co_selling_notes__c ;;
  }

  dimension: co_selling_sfcc_type__c {
    type: string
    sql: ${TABLE}.co_selling_sfcc_type__c ;;
  }

  dimension: co_selling_status__c {
    type: string
    sql: ${TABLE}.co_selling_status__c ;;
  }

  dimension: competitor_solutions__c {
    type: string
    sql: ${TABLE}.competitor_solutions__c ;;
  }

  dimension_group: contract_end_date_calc__c {
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
    sql: ${TABLE}.contract_end_date_calc__c ;;
  }

  dimension_group: contract_start_date__c {
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
    sql: ${TABLE}.contract_start_date__c ;;
  }

  dimension: contract_term_months__c {
    type: number
    sql: ${TABLE}.contract_term_months__c ;;
  }

  dimension: contract_term_years__c {
    type: number
    sql: ${TABLE}.contract_term_years__c ;;
  }

  dimension: cosell_rep__c {
    type: string
    sql: ${TABLE}.cosell_rep__c ;;
  }

  dimension: created_prior_to_q1__c {
    type: yesno
    sql: ${TABLE}.created_prior_to_q1__c ;;
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

  dimension: currencies_required__c {
    type: string
    sql: ${TABLE}.currencies_required__c ;;
  }

  dimension: current_subscriptions_provider__c {
    type: string
    sql: ${TABLE}.current_subscriptions_provider__c ;;
  }

  dimension: custom_packages__c {
    type: string
    sql: ${TABLE}.custom_packages__c ;;
  }

  dimension: customer_acquisition_cost__c {
    type: string
    sql: ${TABLE}.customer_acquisition_cost__c ;;
  }

  dimension: customer_category__c {
    type: string
    sql: ${TABLE}.customer_category__c ;;
  }

  dimension: customer_segment__c {
    type: string
    sql: ${TABLE}.customer_segment__c ;;
  }

  dimension: customer_support_provider2__c {
    type: string
    sql: ${TABLE}.customer_support_provider2__c ;;
  }

  dimension: customer_type_points__c {
    type: number
    sql: ${TABLE}.customer_type_points__c ;;
  }

  dimension: customer_type_proposal_scoring__c {
    type: string
    sql: ${TABLE}.customer_type_proposal_scoring__c ;;
  }

  dimension: dashboardsgsp__amount_won__c {
    type: number
    sql: ${TABLE}.dashboardsgsp__amount_won__c ;;
  }

  dimension: dashboardsgsp__close_date_extensions__c {
    type: number
    sql: ${TABLE}.dashboardsgsp__close_date_extensions__c ;;
  }

  dimension: dashboardsgsp__close_date_month_extensions__c {
    type: number
    sql: ${TABLE}.dashboardsgsp__close_date_month_extensions__c ;;
  }

  dimension_group: dashboardsgsp__date_opportunity_was_closed__c {
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
    sql: ${TABLE}.dashboardsgsp__date_opportunity_was_closed__c ;;
  }

  dimension: dashboardsgsp__days_open__c {
    type: number
    sql: ${TABLE}.dashboardsgsp__days_open__c ;;
  }

  dimension: dashboardsgsp__days_since_last_stage_change__c {
    type: number
    sql: ${TABLE}.dashboardsgsp__days_since_last_stage_change__c ;;
  }

  dimension_group: dashboardsgsp__last_stage_change_date__c {
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
    sql: ${TABLE}.dashboardsgsp__last_stage_change_date__c ;;
  }

  dimension_group: date_contract_ends__c {
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
    sql: ${TABLE}.date_contract_ends__c ;;
  }

  dimension_group: date_into_forecast__c {
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
    sql: ${TABLE}.date_into_forecast__c ;;
  }

  dimension_group: date_into_pipeline__c {
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
    sql: ${TABLE}.date_into_pipeline__c ;;
  }

  dimension_group: date_time_entered_evaluation__c {
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
    sql: ${TABLE}.date_time_entered_evaluation__c ;;
  }

  dimension_group: date_time_entered_negotiation__c {
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
    sql: ${TABLE}.date_time_entered_negotiation__c ;;
  }

  dimension_group: date_time_entered_solution_design__c {
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
    sql: ${TABLE}.date_time_entered_solution_design__c ;;
  }

  dimension_group: date_time_left_evaluation__c {
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
    sql: ${TABLE}.date_time_left_evaluation__c ;;
  }

  dimension_group: date_time_left_negotiation__c {
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
    sql: ${TABLE}.date_time_left_negotiation__c ;;
  }

  dimension_group: date_time_left_solution_design__c {
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
    sql: ${TABLE}.date_time_left_solution_design__c ;;
  }

  dimension: days_in_sql__c {
    type: number
    sql: ${TABLE}.days_in_sql__c ;;
  }

  dimension: decision_criteria__c {
    type: string
    sql: ${TABLE}.decision_criteria__c ;;
  }

  dimension: decision_process__c {
    type: string
    sql: ${TABLE}.decision_process__c ;;
  }

  dimension: describe_the_economic_buyers_priority__c {
    type: string
    sql: ${TABLE}.describe_the_economic_buyers_priority__c ;;
  }

  dimension: ecommerce_partner__c {
    type: string
    sql: ${TABLE}.ecommerce_partner__c ;;
  }

  dimension: ecommerce_platform_detail__c {
    type: string
    sql: ${TABLE}.ecommerce_platform_detail__c ;;
  }

  dimension: ecommerce_platform_other__c {
    type: string
    sql: ${TABLE}.ecommerce_platform_other__c ;;
  }

  dimension: ecommerce_provider__c {
    type: string
    sql: ${TABLE}.ecommerce_provider__c ;;
  }

  dimension: ecommerce_provider_points__c {
    type: number
    sql: ${TABLE}.ecommerce_provider_points__c ;;
  }

  dimension: ecommerce_revenue__c {
    type: string
    sql: ${TABLE}.ecommerce_revenue__c ;;
  }

  dimension: ecommerce_revenue_points__c {
    type: number
    sql: ${TABLE}.ecommerce_revenue_points__c ;;
  }

  dimension: economic_buyer__c {
    type: string
    sql: ${TABLE}.economic_buyer__c ;;
  }

  dimension: email_service_provider2__c {
    type: string
    sql: ${TABLE}.email_service_provider2__c ;;
  }

  dimension: esp__c {
    type: string
    sql: ${TABLE}.esp__c ;;
  }

  dimension: esp_integration_requested__c {
    type: string
    sql: ${TABLE}.esp_integration_requested__c ;;
  }

  dimension: estimated_close_date_notes__c {
    type: string
    sql: ${TABLE}.estimated_close_date_notes__c ;;
  }

  dimension: estimated_close_quarter__c {
    type: string
    sql: ${TABLE}.estimated_close_quarter__c ;;
  }

  dimension: evaluation_stage__c {
    type: string
    sql: ${TABLE}.evaluation_stage__c ;;
  }

  dimension: executive_alignment_plan__c {
    type: string
    sql: ${TABLE}.executive_alignment_plan__c ;;
  }

  dimension: executive_alignment_with_eb_points__c {
    type: number
    sql: ${TABLE}.executive_alignment_with_eb_points__c ;;
  }

  dimension: executive_alignment_with_economic_buyer__c {
    type: yesno
    sql: ${TABLE}.executive_alignment_with_economic_buyer__c ;;
  }

  dimension: existing_program__c {
    type: string
    sql: ${TABLE}.existing_program__c ;;
  }

  dimension: existing_program_points__c {
    type: number
    sql: ${TABLE}.existing_program_points__c ;;
  }

  dimension: fiscal {
    type: string
    sql: ${TABLE}.fiscal ;;
  }

  dimension: fiscalquarter {
    type: number
    sql: ${TABLE}.fiscalquarter ;;
  }

  dimension: fiscalyear {
    type: number
    sql: ${TABLE}.fiscalyear ;;
  }

  dimension: flat_renewal__c {
    type: yesno
    sql: ${TABLE}.flat_renewal__c ;;
  }

  dimension: forecast_age__c {
    type: number
    sql: ${TABLE}.forecast_age__c ;;
  }

  dimension: forecast_probability__c {
    type: number
    sql: ${TABLE}.forecast_probability__c ;;
  }

  dimension: forecast_revenue_current_year__c {
    type: string
    sql: ${TABLE}.forecast_revenue_current_year__c ;;
  }

  dimension: forecastcategory {
    type: string
    sql: ${TABLE}.forecastcategory ;;
  }

  dimension: forecastcategoryname {
    type: string
    sql: ${TABLE}.forecastcategoryname ;;
  }

  dimension: hasopenactivity {
    type: yesno
    sql: ${TABLE}.hasopenactivity ;;
  }

  dimension: hasopportunitylineitem {
    type: yesno
    sql: ${TABLE}.hasopportunitylineitem ;;
  }

  dimension: hasoverduetask {
    type: yesno
    sql: ${TABLE}.hasoverduetask ;;
  }

  dimension: how_is_og_suited__c {
    type: string
    sql: ${TABLE}.how_is_og_suited__c ;;
  }

  dimension: implementation_domain__c {
    type: string
    sql: ${TABLE}.implementation_domain__c ;;
  }

  dimension: implementation_fee_notes__c {
    type: string
    sql: ${TABLE}.implementation_fee_notes__c ;;
  }

  dimension: important_notes__c {
    type: string
    sql: ${TABLE}.important_notes__c ;;
  }

  dimension: industry__c {
    type: string
    sql: ${TABLE}.industry__c ;;
  }

  dimension: internationalization_required__c {
    type: string
    sql: ${TABLE}.internationalization_required__c ;;
  }

  dimension: is_this_a_pain_or_an_opportunity__c {
    type: string
    sql: ${TABLE}.is_this_a_pain_or_an_opportunity__c ;;
  }

  dimension: isclosed {
    type: yesno
    sql: ${TABLE}.isclosed ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: isexcludedfromterritory2filter {
    type: yesno
    sql: ${TABLE}.isexcludedfromterritory2filter ;;
  }

  dimension: iswon {
    type: yesno
    sql: ${TABLE}.iswon ;;
  }

  dimension: language_requirements__c {
    type: string
    sql: ${TABLE}.language_requirements__c ;;
  }

  dimension_group: last_meddic_update__c {
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
    sql: ${TABLE}.last_meddic_update__c ;;
  }

  dimension: last_stage_before_closed_lost__c {
    type: string
    sql: ${TABLE}.last_stage_before_closed_lost__c ;;
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

  dimension_group: launch_date__c {
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
    sql: ${TABLE}.launch_date__c ;;
  }

  dimension: launch_next_steps__c {
    type: string
    sql: ${TABLE}.launch_next_steps__c ;;
  }

  dimension: launch_stall_details__c {
    type: string
    sql: ${TABLE}.launch_stall_details__c ;;
  }

  dimension: launch_status__c {
    type: string
    sql: ${TABLE}.launch_status__c ;;
  }

  dimension: lead_source_detail__c {
    type: string
    sql: ${TABLE}.lead_source_detail__c ;;
  }

  dimension: lead_source_lookup__c {
    type: string
    sql: ${TABLE}.lead_source_lookup__c ;;
  }

  dimension: leadsource {
    type: string
    sql: ${TABLE}.leadsource ;;
  }

  dimension: lid__is_influenced__c {
    type: yesno
    sql: ${TABLE}.lid__is_influenced__c ;;
  }

  dimension: link_to_pcd__c {
    type: string
    sql: ${TABLE}.link_to_pcd__c ;;
  }

  dimension: logo__c {
    type: string
    sql: ${TABLE}.logo__c ;;
  }

  dimension: loyalty_program__c {
    type: string
    sql: ${TABLE}.loyalty_program__c ;;
  }

  dimension: loyalty_promotions_provider2__c {
    type: string
    sql: ${TABLE}.loyalty_promotions_provider2__c ;;
  }

  dimension: loyalty_promotions_provider__c {
    type: string
    sql: ${TABLE}.loyalty_promotions_provider__c ;;
  }

  dimension: margins__c {
    type: string
    sql: ${TABLE}.margins__c ;;
  }

  dimension: margins_points__c {
    type: number
    sql: ${TABLE}.margins_points__c ;;
  }

  dimension: marketing_automation_provider__c {
    type: string
    sql: ${TABLE}.marketing_automation_provider__c ;;
  }

  dimension: metrics__c {
    type: string
    sql: ${TABLE}.metrics__c ;;
  }

  dimension_group: mnda_signed__c {
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
    sql: ${TABLE}.mnda_signed__c ;;
  }

  dimension_group: msa_delivery_date__c {
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
    sql: ${TABLE}.msa_delivery_date__c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "Opportunity Name"
  }

  dimension: next_steps__c {
    type: string
    sql: ${TABLE}.next_steps__c ;;
  }

  dimension: nextstep {
    type: string
    sql: ${TABLE}.nextstep ;;
  }

  dimension: of_sku_s__c {
    type: string
    sql: ${TABLE}.of_sku_s__c ;;
  }

  dimension: of_skus_points__c {
    type: number
    sql: ${TABLE}.of_skus_points__c ;;
  }

  dimension: old_ecommerce_platform__c {
    type: string
    sql: ${TABLE}.old_ecommerce_platform__c ;;
  }

  dimension_group: opened_date__c {
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
    sql: ${TABLE}.opened_date__c ;;
  }

  dimension: opp_influenced_by__c {
    type: string
    sql: ${TABLE}.opp_influenced_by__c ;;
  }

  dimension: opportunity__c {
    type: number
    sql: ${TABLE}.opportunity__c ;;
  }

  dimension: opt_out_clause__c {
    type: string
    sql: ${TABLE}.opt_out_clause__c ;;
  }

  dimension_group: opt_out_date__c {
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
    sql: ${TABLE}.opt_out_date__c ;;
  }

  dimension: opt_out_months__c {
    type: number
    sql: ${TABLE}.opt_out_months__c ;;
  }

  dimension: orders_per_customer_per_year__c {
    type: number
    sql: ${TABLE}.orders_per_customer_per_year__c ;;
  }

  dimension_group: original_close_date__c {
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
    sql: ${TABLE}.original_close_date__c ;;
  }

  dimension: other_competitor__c {
    type: string
    sql: ${TABLE}.other_competitor__c ;;
  }

  dimension: other_technology_partner2__c {
    type: string
    sql: ${TABLE}.other_technology_partner2__c ;;
  }

  dimension: other_technology_partner__c {
    type: string
    sql: ${TABLE}.other_technology_partner__c ;;
  }

  dimension: outreach_first_primary_contact_sequence__c {
    type: string
    sql: ${TABLE}.outreach_first_primary_contact_sequence__c ;;
  }

  dimension: overage__c {
    type: number
    sql: ${TABLE}.overage__c ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: partner__c {
    type: string
    sql: ${TABLE}.partner__c ;;
  }

  dimension: partner_notes__c {
    type: string
    sql: ${TABLE}.partner_notes__c ;;
  }

  dimension: payment_gate_processor__c {
    type: string
    sql: ${TABLE}.payment_gate_processor__c ;;
  }

  dimension: payment_gateway__c {
    type: string
    sql: ${TABLE}.payment_gateway__c ;;
  }

  dimension: payment_processor__c {
    type: string
    sql: ${TABLE}.payment_processor__c ;;
  }

  dimension: payment_tokenization__c {
    type: string
    sql: ${TABLE}.payment_tokenization__c ;;
  }

  dimension: payment_wallet__c {
    type: string
    sql: ${TABLE}.payment_wallet__c ;;
  }

  dimension: paypal2__c {
    type: string
    sql: ${TABLE}.paypal2__c ;;
  }

  dimension: paypal_support_required__c {
    type: string
    sql: ${TABLE}.paypal_support_required__c ;;
  }

  dimension: percentage_of_qualified_revenue__c {
    type: number
    sql: ${TABLE}.percentage_of_qualified_revenue__c ;;
  }

  dimension: pipeline_age__c {
    type: number
    sql: ${TABLE}.pipeline_age__c ;;
  }

  dimension: platform__c {
    type: string
    sql: ${TABLE}.platform__c ;;
  }

  dimension: platform_version__c {
    type: string
    sql: ${TABLE}.platform_version__c ;;
  }

  dimension: power_of_1__c {
    type: number
    sql: ${TABLE}.power_of_1__c ;;
  }

  dimension: power_of_1_lost__c {
    type: number
    sql: ${TABLE}.power_of_1_lost__c ;;
  }

  dimension: power_of_1_signed__c {
    type: number
    sql: ${TABLE}.power_of_1_signed__c ;;
  }

  dimension: power_of_1_sqo__c {
    type: number
    sql: ${TABLE}.power_of_1_sqo__c ;;
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

  dimension: press_release__c {
    type: string
    sql: ${TABLE}.press_release__c ;;
  }

  dimension: pricebook2id {
    type: string
    # hidden: yes
    sql: ${TABLE}.pricebook2id ;;
  }

  dimension: primary_campaign_source__c {
    type: string
    sql: ${TABLE}.primary_campaign_source__c ;;
  }

  dimension: primary_vertical__c {
    type: string
    sql: ${TABLE}.primary_vertical__c ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

  dimension: product__c {
    type: string
    sql: ${TABLE}.product__c ;;
  }

  dimension: product_dependency__c {
    type: string
    sql: ${TABLE}.product_dependency__c ;;
  }

  dimension: program_type__c {
    type: string
    sql: ${TABLE}.program_type__c ;;
  }

  dimension: project_revenue_from_subscriptions__c {
    type: number
    sql: ${TABLE}.project_revenue_from_subscriptions__c ;;
  }

  dimension: projected_annual_growth_percentage__c {
    type: number
    sql: ${TABLE}.projected_annual_growth_percentage__c ;;
  }

  dimension_group: proposal_delivery_date__c {
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
    sql: ${TABLE}.proposal_delivery_date__c ;;
  }

  dimension: proposal_delivery_date_points__c {
    type: number
    sql: ${TABLE}.proposal_delivery_date_points__c ;;
  }

  dimension: proposal_reviewed__c {
    type: yesno
    sql: ${TABLE}.proposal_reviewed__c ;;
  }

  dimension: proposal_scoring_points__c {
    type: number
    sql: ${TABLE}.proposal_scoring_points__c ;;
  }

  dimension: quantify_the_business_impact__c {
    type: string
    sql: ${TABLE}.quantify_the_business_impact__c ;;
  }

  dimension: quarter_created__c {
    type: string
    sql: ${TABLE}.quarter_created__c ;;
  }

  dimension: ramp_contract__c {
    type: string
    sql: ${TABLE}.ramp_contract__c ;;
  }

  dimension: reason_for_custom__c {
    type: string
    sql: ${TABLE}.reason_for_custom__c ;;
  }

  dimension: reason_for_custom_other_details__c {
    type: string
    sql: ${TABLE}.reason_for_custom_other_details__c ;;
  }

  dimension: reasons_we_ll_lose_the_deal__c {
    type: string
    sql: ${TABLE}.reasons_we_ll_lose_the_deal__c ;;
  }

  dimension: recommendation_engine__c {
    type: string
    sql: ${TABLE}.recommendation_engine__c ;;
  }

  dimension: recommended_acv__c {
    type: string
    sql: ${TABLE}.recommended_acv__c ;;
  }

  dimension: recordtypeid {
    type: string
    sql: ${TABLE}.recordtypeid ;;
  }

  dimension: redlines_complete__c {
    type: yesno
    sql: ${TABLE}.redlines_complete__c ;;
  }

  dimension: redlines_complete_points__c {
    type: number
    sql: ${TABLE}.redlines_complete_points__c ;;
  }

  dimension: referral_partner_type__c {
    type: string
    sql: ${TABLE}.referral_partner_type__c ;;
  }

  dimension: referred_by_contact__c {
    type: string
    sql: ${TABLE}.referred_by_contact__c ;;
  }

  dimension: referred_by_partner__c {
    type: string
    sql: ${TABLE}.referred_by_partner__c ;;
  }

  dimension: replatform__c {
    type: yesno
    sql: ${TABLE}.replatform__c ;;
  }

  dimension: risk_level__c {
    type: string
    sql: ${TABLE}.risk_level__c ;;
  }

  dimension: sales_notes__c {
    type: string
    sql: ${TABLE}.sales_notes__c ;;
  }

  dimension: sales_process_probability_percentage__c {
    type: number
    sql: ${TABLE}.sales_process_probability_percentage__c ;;
  }

  dimension: sales_process_scoring_points__c {
    type: number
    sql: ${TABLE}.sales_process_scoring_points__c ;;
  }

  dimension: secondary_verticals__c {
    type: string
    sql: ${TABLE}.secondary_verticals__c ;;
  }

  dimension: setup_fee__c {
    type: number
    sql: ${TABLE}.setup_fee__c ;;
  }

  dimension: sfcc_avp__c {
    type: string
    sql: ${TABLE}.sfcc_avp__c ;;
  }

  dimension: sfcc_core_ae__c {
    type: string
    sql: ${TABLE}.sfcc_core_ae__c ;;
  }

  dimension: ship_to_countries__c {
    type: string
    sql: ${TABLE}.ship_to_countries__c ;;
  }

  dimension: signature_type__c {
    type: string
    sql: ${TABLE}.signature_type__c ;;
  }

  dimension: size__c {
    type: string
    sql: ${TABLE}.size__c ;;
  }

  dimension: solutions_architect__c {
    type: string
    sql: ${TABLE}.solutions_architect__c ;;
  }

  dimension: solutions_partner__c {
    type: string
    sql: ${TABLE}.solutions_partner__c ;;
  }

  dimension: stagename {
    type: string
    sql: ${TABLE}.stagename ;;
  }

  dimension: sub_industry__c {
    type: string
    sql: ${TABLE}.sub_industry__c ;;
  }

  dimension: subscriber_import_required__c {
    type: string
    sql: ${TABLE}.subscriber_import_required__c ;;
  }

  dimension: subscriptions__c {
    type: yesno
    sql: ${TABLE}.subscriptions__c ;;
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

  dimension: systems_integrator__c {
    type: string
    sql: ${TABLE}.systems_integrator__c ;;
  }

  dimension: tcv__c {
    type: number
    sql: ${TABLE}.tcv__c ;;
  }

  dimension: technical_flag__c {
    type: string
    sql: ${TABLE}.technical_flag__c ;;
  }

  dimension: technical_notes__c {
    type: string
    sql: ${TABLE}.technical_notes__c ;;
  }

  dimension: technical_win_points__c {
    type: number
    sql: ${TABLE}.technical_win_points__c ;;
  }

  dimension: technical_win_sow_accepted__c {
    type: yesno
    sql: ${TABLE}.technical_win_sow_accepted__c ;;
  }

  dimension: technology_partner__c {
    type: string
    sql: ${TABLE}.technology_partner__c ;;
  }

  dimension: term_months2__c {
    type: number
    sql: ${TABLE}.term_months2__c ;;
  }

  dimension: tier__c {
    type: string
    sql: ${TABLE}.tier__c ;;
  }

  dimension: total_age__c {
    type: number
    sql: ${TABLE}.total_age__c ;;
  }

  dimension: total_days_open__c {
    type: number
    sql: ${TABLE}.total_days_open__c ;;
  }

  dimension: total_time_in_evaluation__c {
    type: number
    sql: ${TABLE}.total_time_in_evaluation__c ;;
  }

  dimension: total_time_in_negotiation__c {
    type: number
    sql: ${TABLE}.total_time_in_negotiation__c ;;
  }

  dimension: total_time_in_solution_design__c {
    type: number
    sql: ${TABLE}.total_time_in_solution_design__c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: weighted_acv__c {
    type: number
    sql: ${TABLE}.weighted_acv__c ;;
  }

  dimension: weighted_implementation_fee__c {
    type: number
    sql: ${TABLE}.weighted_implementation_fee__c ;;
  }

  dimension: what_are_the_corporate_growth_objectives__c {
    type: string
    sql: ${TABLE}.what_are_the_corporate_growth_objectives__c ;;
  }

  dimension: what_are_the_industry_trends__c {
    type: string
    sql: ${TABLE}.what_are_the_industry_trends__c ;;
  }

  dimension: what_are_the_initiatives__c {
    type: string
    sql: ${TABLE}.what_are_the_initiatives__c ;;
  }

  dimension: whats_the_impact__c {
    type: string
    sql: ${TABLE}.whats_the_impact__c ;;
  }

  dimension: who_is_to_thank__c {
    type: string
    sql: ${TABLE}.who_is_to_thank__c ;;
  }

  dimension: who_was_the_competition__c {
    type: string
    sql: ${TABLE}.who_was_the_competition__c ;;
  }

  dimension: why_do_something__c {
    type: string
    sql: ${TABLE}.why_do_something__c ;;
  }

  dimension: why_not_keep_doing_what_you_re_doing__c {
    type: string
    sql: ${TABLE}.why_not_keep_doing_what_you_re_doing__c ;;
  }

  dimension: why_now__c {
    type: string
    sql: ${TABLE}.why_now__c ;;
  }

  dimension: why_ordergroove__c {
    type: string
    sql: ${TABLE}.why_ordergroove__c ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_acv {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${annual_contract_value_acv__c} ;;
    value_format: "$#,##0.00"
    drill_fields: [id,name,closedate_date,account.name,annual_contract_value_acv__c]
  }

  measure: avg_acv {
    type: average
    sql: ${annual_contract_value_acv__c} ;;
    value_format: "$#,##0.00"
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;}

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

  dimension: category {
    type: string
    sql: case when ${recordtypeid} in ('012C0000000QLHVIA4','0121A000000CCahQAG','0121A000000GV5xQAG','0120h000000IB51AAG') then 'New ACV' else null end ;;
  }

  measure: goal {
    type: sum_distinct
    sql_distinct_key: case when ${recordtypeid} = "012C0000000QLHVIA4" then cast(${historical_information_google_sheet_connected.goal__new_acv___new_bus} as numeric)
    when ${recordtypeid} = "0121A000000CCahQAG" then cast(${historical_information_google_sheet_connected.goal__new_acv_goal___upsells} as numeric)
    when ${recordtypeid} = "0121A000000GV5xQAG" then cast(${historical_information_google_sheet_connected.goal__new_acv_goal___upsells} as numeric)
    when ${recordtypeid} = "0120h000000IB51AAG" then cast(${historical_information_google_sheet_connected.goal__new_acv_goal___upsells} as numeric)
    else 0 end ;;
    sql: case when ${recordtypeid} = "012C0000000QLHVIA4" then cast(${historical_information_google_sheet_connected.goal__new_acv___new_bus} as numeric)
    when ${recordtypeid} = "0121A000000CCahQAG" then cast(${historical_information_google_sheet_connected.goal__new_acv_goal___upsells} as numeric)
    when ${recordtypeid} = "0121A000000GV5xQAG" then cast(${historical_information_google_sheet_connected.goal__new_acv_goal___upsells} as numeric)
    when ${recordtypeid} = "0120h000000IB51AAG" then cast(${historical_information_google_sheet_connected.goal__new_acv_goal___upsells} as numeric)
    else 0 end ;;
  }

  measure: Platform_transaction_goal {
    type: sum_distinct
    sql_distinct_key:  case when ${partner_account__c.ECommerce_Platform_grouped} = 'Shopify' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___of_Transactions___Shopify} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Other' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___of_Transactions___Other} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'BigCommerce' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___of_Transactions___Big_Commerce} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Magento 2' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___of_Transactions___Magento} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Salesforce Commerce Cloud' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___of_Transactions___Salesforce} as numeric) end
         ;;
    sql: case when ${partner_account__c.ECommerce_Platform_grouped} = 'Shopify' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___of_Transactions___Shopify} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Other' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___of_Transactions___Other} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'BigCommerce' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___of_Transactions___Big_Commerce} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Magento 2' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___of_Transactions___Magento} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Salesforce Commerce Cloud' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___of_Transactions___Salesforce} as numeric) end
        ;;
  }

  measure: Platform_ASP_goal {
    type: sum_distinct
    sql_distinct_key: case when ${partner_account__c.ECommerce_Platform_grouped} = 'Shopify' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV_ASP___Shopify} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Other' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV_ASP___Other} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'BigCommerce' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV_ASP___Big_Commerce} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Magento 2' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV_ASP___Magento} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Salesforce Commerce Cloud' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV_ASP___Salesforce} as numeric) end
  ;;
    sql: case when ${partner_account__c.ECommerce_Platform_grouped} = 'Shopify' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV_ASP___Shopify} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Other' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV_ASP___Other} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'BigCommerce' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV_ASP___Big_Commerce} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Magento 2' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV_ASP___Magento} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Salesforce Commerce Cloud' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV_ASP___Salesforce} as numeric) end
        ;;
  }

  measure: Platform_goal {
    type: sum_distinct
    sql_distinct_key:  case when ${partner_account__c.ECommerce_Platform_grouped} = 'Shopify' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___Shopify} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Other' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___Other} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'BigCommerce' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___Big_Commerce} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Magento 2' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___Magento} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Salesforce Commerce Cloud' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___Salesforce} as numeric) end
 ;;
    sql: case when ${partner_account__c.ECommerce_Platform_grouped} = 'Shopify' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___Shopify} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Other' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___Other} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'BigCommerce' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___Big_Commerce} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Magento 2' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___Magento} as numeric)
              when ${partner_account__c.ECommerce_Platform_grouped} = 'Salesforce Commerce Cloud' then cast(${historical_information_google_sheet_connected.GOAL__New_ACV___Salesforce} as numeric) end
        ;;
  }

  measure: new_acv_goal {
    type: max
    sql: ${historical_information_google_sheet_connected.goal__new_acv} ;;
  }

  dimension: dynamic_created_timeframe {
    type: string
    sql:
    case when {% parameter timeframe_picker %} = 'Date' then date(${closedate_date})
    when {% parameter timeframe_picker %} = 'Week' then date(${closedate_week})
    when {% parameter timeframe_picker %} = 'Month' then date(FORMAT_TIMESTAMP('%Y-%m-01', ${closedate_date}))
    when {% parameter timeframe_picker %} = 'Quarter' then DATE_ADD(date((FORMAT_TIMESTAMP('%Y-%m-01', TIMESTAMP_TRUNC(CAST(CAST(DATETIME_ADD(CAST(TIMESTAMP_TRUNC(CAST(opportunity.closedate  AS TIMESTAMP), MONTH) AS DATETIME), INTERVAL -1 MONTH) AS TIMESTAMP) AS TIMESTAMP), QUARTER)))), INTERVAL 1 MONTH)
    when {% parameter timeframe_picker %} = 'Year' then date(FORMAT_TIMESTAMP('%Y-01-01', ${closedate_date}))
    end ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      forecastcategoryname,
      name,
      stagename,
      pricebook2.name,
      pricebook2.id,
      account.id,
      account.name,
      campaign.id,
      campaign.name,
      opportunity_field_history.count,
      opportunity_history.count,
      opportunity_line_item.count
    ]
  }
}
