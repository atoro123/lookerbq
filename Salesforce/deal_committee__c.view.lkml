view: deal_committee__c {
  sql_table_name: `stitch-poc-306316.salesforce.Deal_Committee__c`
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

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: account_executive__c {
    type: string
    sql: ${TABLE}.account_executive__c ;;
  }

  dimension: account_name__c {
    type: string
    sql: ${TABLE}.account_name__c ;;
  }

  dimension: account_updater__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.account_updater__c ;;
  }

  dimension: account_updater_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.account_updater_csd_pts__c ;;
  }

  dimension: account_updater_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.account_updater_solution_hrs__c ;;
  }

  dimension: account_updater_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.account_updater_success_hrs__c ;;
  }

  dimension: acv__c {
    type: number
    sql: ${TABLE}.acv__c ;;
  }

  dimension: alternate_payment_methods__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.alternate_payment_methods__c ;;
  }

  dimension: alternate_payment_methods_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.alternate_payment_methods_csd_pts__c ;;
  }

  dimension: alternate_payment_methods_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.alternate_payment_methods_solution_hrs__c ;;
  }

  dimension: alternate_payment_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.alternate_payment_success_hrs__c ;;
  }

  dimension: bigcommerce__c {
    type: string
    sql: ${TABLE}.bigcommerce__c ;;
  }

  dimension: build_your_own_bundle__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.build_your_own_bundle__c ;;
  }

  dimension: build_your_own_bundle_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.build_your_own_bundle_csd_pts__c ;;
  }

  dimension: build_your_own_bundle_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.build_your_own_bundle_solution_hrs__c ;;
  }

  dimension: build_your_own_bundle_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.build_your_own_bundle_success_hrs__c ;;
  }

  dimension: closed_lost_reason__c {
    type: string
    sql: ${TABLE}.closed_lost_reason__c ;;
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

  dimension: current_subscription_platform__c {
    type: string
    sql: ${TABLE}.current_subscription_platform__c ;;
  }

  dimension: custom__c {
    type: string
    sql: ${TABLE}.custom__c ;;
  }

  dimension: custom_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.custom_csd_pts__c ;;
  }

  dimension: custom_esp_integration__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.custom_esp_integration__c ;;
  }

  dimension: custom_esp_integration_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.custom_esp_integration_csd_pts__c ;;
  }

  dimension: custom_esp_integration_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.custom_esp_integration_solution_hrs__c ;;
  }

  dimension: custom_esp_integration_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.custom_esp_integration_success_hrs__c ;;
  }

  dimension: custom_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.custom_solution_hrs__c ;;
  }

  dimension: customer_group_pricing_and_promotions__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.customer_group_pricing_and_promotions__c ;;
  }

  dimension: customer_group_pricing_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.customer_group_pricing_csd_pts__c ;;
  }

  dimension: customer_group_pricing_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.customer_group_pricing_solution_hrs__c ;;
  }

  dimension: customer_group_pricing_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.customer_group_pricing_success_hrs__c ;;
  }

  dimension: customer_segment__c {
    type: string
    sql: ${TABLE}.customer_segment__c ;;
  }

  dimension: discovery_box_clubs_curation_csd_p__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.discovery_box_clubs_curation_csd_p__c ;;
  }

  dimension: discovery_box_clubs_curation_custo__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.discovery_box_clubs_curation_custo__c ;;
  }

  dimension: discovery_box_clubs_curation_solut__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.discovery_box_clubs_curation_solut__c ;;
  }

  dimension: discovery_box_custom_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.discovery_box_custom_success_hrs__c ;;
  }

  dimension: ecommerce_platform__c {
    type: string
    sql: ${TABLE}.ecommerce_platform__c ;;
  }

  dimension: ecommerce_platform_integrations__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.ecommerce_platform_integrations__c ;;
  }

  dimension: ecommerce_platform_integrations_csd_pt__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.ecommerce_platform_integrations_csd_pt__c ;;
  }

  dimension: ecommerce_platform_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.ecommerce_platform_solution_hrs__c ;;
  }

  dimension: ecommerce_platform_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.ecommerce_platform_success_hrs__c ;;
  }

  dimension: gift_with_purchase__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.gift_with_purchase__c ;;
  }

  dimension: gift_with_purchase_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.gift_with_purchase_csd_pts__c ;;
  }

  dimension: gift_with_purchase_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.gift_with_purchase_solution_hrs__c ;;
  }

  dimension: gift_with_purchase_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.gift_with_purchase_success_hrs__c ;;
  }

  dimension: gifting__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.gifting__c ;;
  }

  dimension: gifting_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.gifting_csd_pts__c ;;
  }

  dimension: gifting_solutions_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.gifting_solutions_hrs__c ;;
  }

  dimension: gifting_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.gifting_success_hrs__c ;;
  }

  dimension: implementation_fee__c {
    type: number
    sql: ${TABLE}.implementation_fee__c ;;
  }

  dimension: industry__c {
    type: string
    sql: ${TABLE}.industry__c ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: language__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.language__c ;;
  }

  dimension: language_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.language_csd_pts__c ;;
  }

  dimension: language_solutions_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.language_solutions_hrs__c ;;
  }

  dimension: language_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.language_success_hrs__c ;;
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

  dimension: lead_source__c {
    type: string
    sql: ${TABLE}.lead_source__c ;;
  }

  dimension_group: meeting_review_date__c {
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
    sql: ${TABLE}.meeting_review_date__c ;;
  }

  dimension: memberships_custom__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.memberships_custom__c ;;
  }

  dimension: memberships_custom_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.memberships_custom_csd_pts__c ;;
  }

  dimension: memberships_custom_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.memberships_custom_solution_hrs__c ;;
  }

  dimension: memberships_custom_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.memberships_custom_success_hrs__c ;;
  }

  dimension: migration_needed__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.migration_needed__c ;;
  }

  dimension: missing_estimates__c {
    type: yesno
    sql: ${TABLE}.missing_estimates__c ;;
  }

  dimension: modify_smi_based_on_sku_or_logic__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.modify_smi_based_on_sku_or_logic__c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: next_steps__c {
    type: string
    sql: ${TABLE}.next_steps__c ;;
  }

  dimension: nth_order__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.nth_order__c ;;
  }

  dimension: opportunity_name__c {
    type: string
    sql: ${TABLE}.opportunity_name__c ;;
  }

  dimension: opportunity_stage__c {
    type: string
    sql: ${TABLE}.opportunity_stage__c ;;
  }

  dimension: other_2__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.other_2__c ;;
  }

  dimension: other_2_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.other_2_csd_pts__c ;;
  }

  dimension: other_2_solutions_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.other_2_solutions_hrs__c ;;
  }

  dimension: other_2_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.other_2_success_hrs__c ;;
  }

  dimension: other_3__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.other_3__c ;;
  }

  dimension: other_3_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.other_3_csd_pts__c ;;
  }

  dimension: other_3_solutions_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.other_3_solutions_hrs__c ;;
  }

  dimension: other_3_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.other_3_success_hrs__c ;;
  }

  dimension: other__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.other__c ;;
  }

  dimension: other_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.other_csd_pts__c ;;
  }

  dimension: other_description_2__c {
    type: string
    sql: ${TABLE}.other_description_2__c ;;
  }

  dimension: other_description_3__c {
    type: string
    sql: ${TABLE}.other_description_3__c ;;
  }

  dimension: other_description__c {
    type: string
    sql: ${TABLE}.other_description__c ;;
  }

  dimension: other_important_notes__c {
    type: string
    sql: ${TABLE}.other_important_notes__c ;;
  }

  dimension: other_pricing__c {
    type: string
    sql: ${TABLE}.other_pricing__c ;;
  }

  dimension: other_pricing_details__c {
    type: string
    sql: ${TABLE}.other_pricing_details__c ;;
  }

  dimension: other_solutions_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.other_solutions_hrs__c ;;
  }

  dimension: other_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.other_success_hrs__c ;;
  }

  dimension: other_timing__c {
    type: string
    sql: ${TABLE}.other_timing__c ;;
  }

  dimension: other_timing_details__c {
    type: string
    sql: ${TABLE}.other_timing_details__c ;;
  }

  dimension: overall_deal_committee_decision__c {
    type: string
    sql: ${TABLE}.overall_deal_committee_decision__c ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: prepaid_subscriptions__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.prepaid_subscriptions__c ;;
  }

  dimension: prepaid_subscriptions_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.prepaid_subscriptions_csd_pts__c ;;
  }

  dimension: prepaid_subscriptions_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.prepaid_subscriptions_solution_hrs__c ;;
  }

  dimension: prepaid_subscriptions_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.prepaid_subscriptions_success_hrs__c ;;
  }

  dimension: price_lock_at_sub_level__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.price_lock_at_sub_level__c ;;
  }

  dimension: price_lock_at_sub_level_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.price_lock_at_sub_level_csd_pts__c ;;
  }

  dimension: price_lock_at_sub_level_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.price_lock_at_sub_level_solution_hrs__c ;;
  }

  dimension: price_lock_at_sub_level_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.price_lock_at_sub_level_success_hrs__c ;;
  }

  dimension: product_specific_promo_solutions_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.product_specific_promo_solutions_hrs__c ;;
  }

  dimension: product_specific_promo_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.product_specific_promo_success_hrs__c ;;
  }

  dimension: psi_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.psi_csd_pts__c ;;
  }

  dimension: psis__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.psis__c ;;
  }

  dimension: recordtypeid {
    type: string
    sql: ${TABLE}.recordtypeid ;;
  }

  dimension: review_items__c {
    type: string
    sql: ${TABLE}.review_items__c ;;
  }

  dimension: sms_reorder__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.sms_reorder__c ;;
  }

  dimension: sms_reorder_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.sms_reorder_csd_pts__c ;;
  }

  dimension: sms_reorder_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.sms_reorder_solution_hrs__c ;;
  }

  dimension: sms_reorder_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.sms_reorder_success_hrs__c ;;
  }

  dimension: solutions_architect__c {
    type: string
    sql: ${TABLE}.solutions_architect__c ;;
  }

  dimension: status__c {
    type: string
    sql: ${TABLE}.status__c ;;
  }

  dimension: subscribe_anywhere_pickup_anywhere_ful__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.subscribe_anywhere_pickup_anywhere_ful__c ;;
  }

  dimension: subscribe_more_save_more__c {
    type: string
    group_label: "Custom Packages List"
    sql: ${TABLE}.subscribe_more_save_more__c ;;
  }

  dimension: subscribe_more_save_more_csd_pts__c {
    group_label: "Custom Package CSD PTS"
    type: number
    sql: ${TABLE}.subscribe_more_save_more_csd_pts__c ;;
  }

  dimension: subscribe_more_save_more_solution_hrs__c {
    group_label: "Custom Package Solution Hrs"
    type: number
    sql: ${TABLE}.subscribe_more_save_more_solution_hrs__c ;;
  }

  dimension: subscribe_more_success_hrs__c {
    group_label: "Custom Package Success Hrs"
    type: number
    sql: ${TABLE}.subscribe_more_success_hrs__c ;;
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

  dimension: target_launch_date__c {
    type: string
    sql: ${TABLE}.target_launch_date__c ;;
  }

  dimension: target_sign_date_compelling_event__c {
    type: string
    sql: ${TABLE}.target_sign_date_compelling_event__c ;;
  }

  dimension: type_of_request__c {
    type: string
    sql: ${TABLE}.type_of_request__c ;;
  }

  dimension: weighted_acv__c {
    type: number
    sql: ${TABLE}.weighted_acv__c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, name]
  }

  measure: acv_sum {
    type: sum
    sql: ${acv__c} ;;
    value_format: "$#,##0.00"
  }

  measure: acv_avg {
    type: average
    sql: ${acv__c} ;;
    value_format: "$#,##0.00"
  }

  measure: Total_CSD_Points {
    type: sum
    sql:${account_updater_csd_pts__c},${alternate_payment_methods_csd_pts__c},${build_your_own_bundle_csd_pts__c},${custom_csd_pts__c}, ${custom_esp_integration_csd_pts__c}, ${customer_group_pricing_csd_pts__c},${discovery_box_clubs_curation_csd_p__c},${gifting_csd_pts__c},${ecommerce_platform_integrations_csd_pt__c}, ${language_csd_pts__c}, ${gift_with_purchase_csd_pts__c}, ${other_2_csd_pts__c},${other_3_csd_pts__c}, ${other_csd_pts__c},${memberships_custom_csd_pts__c}, ${psi_csd_pts__c}, ${prepaid_subscriptions_csd_pts__c}, ${sms_reorder_csd_pts__c}, ${price_lock_at_sub_level_csd_pts__c}, ${subscribe_more_save_more_csd_pts__c};;
  }

  measure: Total_Success_Hours{
    type: sum
    sql: ${account_updater_success_hrs__c}, ${alternate_payment_success_hrs__c}, ${build_your_own_bundle_success_hrs__c},${custom_esp_integration_success_hrs__c},${customer_group_pricing_success_hrs__c}, ${discovery_box_custom_success_hrs__c}, ${gifting_success_hrs__c}, ${ecommerce_platform_success_hrs__c},${gift_with_purchase_success_hrs__c}, ${language_success_hrs__c},${memberships_custom_success_hrs__c},${other_2_success_hrs__c},${other_3_success_hrs__c},${other_success_hrs__c},${prepaid_subscriptions_success_hrs__c},${price_lock_at_sub_level_success_hrs__c},${sms_reorder_success_hrs__c},${product_specific_promo_success_hrs__c},${subscribe_more_success_hrs__c};;
  }

  measure: Total_Solutions_Hours{
    type: sum
    sql: ${account_updater_solution_hrs__c},${alternate_payment_methods_solution_hrs__c},${build_your_own_bundle_solution_hrs__c},${custom_solution_hrs__c},${custom_esp_integration_solution_hrs__c},${customer_group_pricing_solution_hrs__c},${discovery_box_clubs_curation_solut__c},${gifting_solutions_hrs__c},${ecommerce_platform_solution_hrs__c},${gift_with_purchase_solution_hrs__c},${language_solutions_hrs__c},${memberships_custom_solution_hrs__c},${other_2_solutions_hrs__c},${other_3_solutions_hrs__c},${other_solutions_hrs__c},${prepaid_subscriptions_solution_hrs__c},${sms_reorder_solution_hrs__c},${price_lock_at_sub_level_solution_hrs__c},${product_specific_promo_solutions_hrs__c},${subscribe_more_save_more_solution_hrs__c} ;;
    }
}
