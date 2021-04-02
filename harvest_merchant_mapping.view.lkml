view: harvest_merchant_mapping {
  sql_table_name: `production-202017.ogv2_consumerinsight.harvest_merchant_mapping`
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

  dimension_group: signed_date {
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
      fiscal_year
    ]
    sql: TIMESTAMP(${TABLE}.signed_date) ;;
  }

  dimension: contract_signed_date {
    type: date
    sql: TIMESTAMP(${TABLE}.contract_signed_date) ;;
  }

  dimension_group: original_signed_date {
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
      fiscal_year
    ]
    sql: TIMESTAMP(${TABLE}.Original_Signed_Date) ;;
  }

  dimension: launch_date {
    type: date
    sql: ${TABLE}.launch_date ;;
  }

  dimension_group: launch_date {
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
      fiscal_year
    ]
    sql: TIMESTAMP(${TABLE}.launch_date) ;;
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

  measure: Total_Implementation {
    type: sum
    sql: ${implementation_fee} ;;
  }

  dimension: percent_completed_integration {
    type: number
    sql: ${TABLE}.Integration_Checklist ;;
  }

  measure: Intergration_Percent_Complete {
    type: sum
    sql: case when ${percent_completed_integration} is not null then cast(${percent_completed_integration} as FLOAT64) else 0 end ;;
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

  dimension: Custom_ESP_Integration {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Custom ESP Integration%' then 'yes' else 'no' end ;;
  }

  dimension: Account_Updater {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Account Updater%' then 'yes' else 'no' end ;;
  }

  dimension: Alternate_Payment_Methods {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Alternate Payment Methods%' then 'yes' else 'no' end ;;
  }

  dimension: Committed_Plans {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Committed Plans%' then 'yes' else 'no' end ;;
  }

  dimension: Discovery_Box_Clubs_Curation {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Discovery Box, Clubs & Curation%' then 'yes' else 'no' end ;;
  }

  dimension: Gifting {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Gifting%' then 'yes' else 'no' end ;;
  }

  dimension: Memberships_Custom {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Memberships Custom%' then 'yes' else 'no' end ;;
  }

  dimension: Price_Lock_at_Sub_Level {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Price Lock at Sub Level%' then 'yes' else 'no' end ;;
  }

  dimension: Subscribe_Anywhere_Pick_up_Anywhere_One_Time {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Subscribe Anywhere Pick up Anywhere One Time%' then 'yes' else 'no' end ;;
  }

  dimension: Subscribe_Anywhere_Pick_up_Anywhere_Full_Time {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Subscribe Anywhere Pick up Anywhere Full Time%' then 'yes' else 'no' end ;;
  }

  dimension: Temporarily_Out_of_Stock {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Temporarily Out of Stock%' then 'yes' else 'no' end ;;
  }

 dimension: Real_Time_Inventory  {
    type: string
    group_label: "Custom Packages List"
    sql: case when ${custom_packages} like '%Real Time Inventory %' then 'yes' else 'no' end ;;
  }

  dimension: Original_ACV {
    type: number
    sql: ${TABLE}.Original_ACV ;;
  }

  measure: Total_Original_ACV {
    type: sum
    sql: ${Original_ACV} ;;
    value_format: "$#,##0"
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
    sql: case when ${add_ons} like '%Multi-Language Support%' or ${add_ons} like '%Non-US Domain - Dual Language%' then 'yes' else 'no' end ;;
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

  dimension: Different_Brand_Multi_Site {
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons} like '%Different Brand Multi-Site%' then 'yes' else 'no' end ;;
  }

  dimension: BigCommerce_Tax{
    type: string
    group_label: "Add Ons List"
    sql: case when ${add_ons} like '%BigCommerce Tax%' then 'yes' else 'no' end ;;
  }


  dimension: Current_Subscription_Provider {
    type: string
    sql: ${TABLE}.Current_Subscription_Provider ;;
  }

  dimension: Contract_Type {
  type: string
  sql: ${TABLE}.Contract_Type ;;
}

  measure: hours_bought_total {
    type: max
    sql: ${hours_bought} ;;
  }

  dimension: Custom_deal_components {
    type: number
    sql:(CHAR_LENGTH(${custom_packages}) -
CHAR_LENGTH(REPLACE(${custom_packages}, ';', '')) + 1);;
  }

  dimension: Custom_deal_add_ons {
    type: number
    sql:if(${add_ons} is null, null, (CHAR_LENGTH(${add_ons}) -
      CHAR_LENGTH(REPLACE(${add_ons}, ';', '')) + 1));;
  }

  dimension: Solutions_Contact {
    type: string
    sql: ${TABLE}.Solutions_Contact ;;
  }

  dimension: Target_Integration_Hours {
    type: number
    sql: ${TABLE}.Target_Integration_Hours ;;
  }

  dimension: Success_Owner {
    type: string
    sql: ${TABLE}.Success_Owner ;;
  }

  dimension: Days_to_Launch {
    type: number
    sql: case when ${client_status} = 'Live' and ${original_signed_date_date} is not null and ${launch_date_date} is not null then DATE_DIFF( date(${launch_date_date}), date(${original_signed_date_date}), DAY) else null end ;;
  }

  measure: Avg_Days_to_Launch{
    type: average
    sql: ${Days_to_Launch} ;;
    value_format: "0.0"
  }

  dimension: Imp_Rate_Card_Fee {
    type: number
    sql: ${TABLE}.Imp_Fee_Rate_Card ;;
  }

  dimension: Imp_Fee_Rate_Card {
    type: number
    sql: ${TABLE}.Imp_Fee_Rate_Card ;;
  }

  measure: Total_Imp_Fee_Rate_Card {
    type: sum
    sql: ${Imp_Fee_Rate_Card} ;;
  }

  dimension: Rate_Card_ACV {
    type: number
    sql: ${TABLE}.Rate_Card_ACV ;;
  }

  measure: Total_Rate_Card_ACV {
    type: sum
    sql: ${ACV_Rate_Card} ;;
  }

  measure: Total_Rate_Card_Implementation_Fee {
    type: sum
    sql: ${Rate_Card_Implementation_Fee} ;;
  }

  dimension: Rate_Card_Implementation_Fee {
    type: number
    sql: ${TABLE}.Rate_Card_Implementation_Fee ;;
  }

  dimension: ACV_Rate_Card {
    type: number
    sql: ${TABLE}.ACV_Rate_Card ;;
  }

  dimension: Target_Hrs_Override_Notes {
    type: string
    sql: ${TABLE}.Target_Hrs_Override_Notes ;;
  }
}
