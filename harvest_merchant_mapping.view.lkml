view: harvest_merchant_mapping {
  sql_table_name: `production-202017.ogv2_consumerinsight.new_harvest_merchant_mapping`
    ;;

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: hours_bought {
    type: number
    sql: ${TABLE}.post_live_hours ;;
  }

  dimension: client_status {
    type: string
    sql: ${TABLE}.client_status ;;
  }

  dimension: product_level {
    type: string
    sql: ${TABLE}.product_level ;;
  }

  dimension: signed_date {
    type: date
    sql: ${TABLE}.signed_date ;;
  }

  dimension: contract_signed_date {
    type: date
    sql: ${TABLE}.contract_signed_date ;;
  }

  dimension: launch_date {
    type: date
    sql: ${TABLE}.launch_date ;;
  }

  dimension: launch_date_filter {
    type: date_time
    hidden: yes
    sql: timestamp(${launch_date}) ;;
  }

  dimension: client_stage {
    type: string
    sql: ${TABLE}.client_stage ;;
  }

  dimension: merchant_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: parent_account {
    type: string
    sql: ${TABLE}.parent_account ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: annual_target_hours {
    type: number
    sql: ${TABLE}.Target_Hours ;;
  }

  dimension: client_status_tracker_id {
    type: string
    sql: ${TABLE}.client_status_tracker_id ;;
  }

  dimension: integratioh_start_date {
    type: date
    sql: ${TABLE}.integration_date ;;
  }

  dimension: integration_hours {
    type: number
    sql: ${TABLE}.integration_hours ;;
  }

  dimension: days_since_contract {
    type: number
    sql: ${TABLE}.days_since_contract ;;
  }

  dimension: integration_effort {
    type: string
    sql: ${TABLE}.integration_effort ;;
  }

  dimension: integration_hours_target {
    type: number
    sql: case when ${integration_hours} = 0 then 0
    else ${integration_hours} end;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: project_slippage {
    type: number
    sql: ${TABLE}.project_slippage ;;
  }

  dimension: remaining_launch_outlook {
    type: string
    sql: ${TABLE}.remaining_launch_outlook ;;
  }

  dimension: current_estimated_launch_date {
    type: date
    sql: ${TABLE}.current_estimated_launch_date ;;
  }

  dimension: risk_level {
    type: string
    sql: ${TABLE}.level_of_risk ;;
  }

  dimension: status_notes {
    type: string
    sql: ${TABLE}.status_notes ;;
  }

  dimension: original_expected_launch_date {
    type: date
    sql: ${TABLE}.original_expected_launch_date ;;
  }

  dimension: Industry {
    type: string
    sql: ${TABLE}.Industry ;;
  }

  dimension: Sub_Industry {
    type: string
    sql: ${TABLE}.Sub_Industry ;;
  }

  dimension: implementation_fee {
    type: number
    sql: ${TABLE}.implementation_fee ;;
  }

  dimension: percent_completed_integration {
    type: number
    sql: ${TABLE}.Integration_Checklist ;;
  }

  measure: Sub_Industry_list {
    type: list
    list_field: Sub_Industry
  }

  dimension: today {
    type: date
    hidden: yes
    sql: CURRENT_DATE() ;;
  }

  dimension: Integration_Percent_Complete {
    type: number
    sql: ${TABLE}.Integration_Checklist ;;
    value_format: "0\%"
  }

  measure: Days_Since_start_of_Integration{
    type:number
    sql: date_diff(
            case when ${launch_date} is null then CURRENT_DATE()
              else Date(EXTRACT(YEAR FROM ${launch_date}),EXTRACT(MONTH FROM ${launch_date}),EXTRACT(DAY FROM ${launch_date}))
              end,
            DATE(EXTRACT(YEAR FROM ${integratioh_start_date}),EXTRACT(MONTH FROM ${integratioh_start_date}),EXTRACT(DAY FROM ${integratioh_start_date})),
            DAY) ;;
  }

  measure: Launch_Day{
    type:string
    sql: max(${launch_date_filter});;
  }

  measure: Pre_Live_Contracted_Hours {
    type: sum_distinct
    sql_distinct_key: ${merchant_id} ;;
    sql: ${integration_hours} ;;
  }

  dimension: add_ons {
    type: string
    sql: ${TABLE}.`add_ons` ;;
  }

  dimension: custom_packages {
    type: string
    sql: ${TABLE}.`custom_packages` ;;
  }


  dimension: Build_Your_Own_Bundle {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Build Your Own Bundle%' then 'yes' else 'no' end ;;
  }

  dimension: eCommerce_Platform_Integrations {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%eCommerce Platform Integrations%' then 'yes' else 'no' end ;;
  }

  dimension: Legacy_Advanced_Promos {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Legacy Advanced Promos%' then 'yes' else 'no' end ;;
  }

  dimension: Prepaid_Subscriptions {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Prepaid Subscriptions%' then 'yes' else 'no' end ;;
  }

  dimension: SMS_Reorder {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%SMS Reorder%' then 'yes' else 'no' end ;;
  }

  dimension: Customer_Group_Pricing_and_Promotions {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Customer Group Pricing and Promotions%' then 'yes' else 'no' end ;;
  }

  dimension: Subscribe_More_Save_More {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Subscribe More, Save More%' then 'yes' else 'no' end ;;
  }

  dimension: Dynamic_Shipping_Method_or_Rate {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Dynamic Shipping Method or Rate%' then 'yes' else 'no' end ;;
  }
  dimension: Legacy_Other {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Legacy Other%' then 'yes' else 'no' end ;;
  }
  dimension: Modify_SMI_Based_on_SKU_or_Logic {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Modify SMI Based on SKU or Logic%' then 'yes' else 'no' end ;;
  }
  dimension: SMS_Subscription_Management {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%SMS Subscription Management%' then 'yes' else 'no' end ;;
  }

  dimension: Gift_With_Purchase {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Gift With Purchase%' then 'yes' else 'no' end ;;
  }

  dimension: Customer_Segment {
    type: string
    sql: ${TABLE}.Customer_Segment ;;
  }

  dimension: Migration_Needed {
    type: yesno
    sql: ${TABLE}.Migration_Needed ;;
  }

  dimension: calculated_product {
    type: string
    sql: ${TABLE}.calculated_product ;;
  }

  dimension: Same_Brand_Multi_Site {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons} like '%Same Brand Multi-Site%' then 'yes' else 'no' end ;;
  }

  dimension: Multi_Language_Support {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons} like '%Multi-Language Support%' then 'yes' else 'no' end ;;
  }

  dimension: Advanced_Promos {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons} like '%Advanced Promos%' then 'yes' else 'no' end ;;
  }

  dimension: Non_US_Domain_Single_Language {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons} like '%Non-US Domain - Single Language%' then 'yes' else 'no' end ;;
  }

  dimension: Advanced_Configurations {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons} like '%Advanced Configurations%' then 'yes' else 'no' end ;;
  }

  dimension: Non_US_Domain_Dual_Language {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons} like '%Non-US Domain - Dual Language%' then 'yes' else 'no' end ;;
  }

  dimension: Different_Brand_Multi_Site {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons} like '%Different Brand Multi-Site%' then 'yes' else 'no' end ;;
  }
}
