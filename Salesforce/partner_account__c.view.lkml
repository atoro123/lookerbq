view: partner_account__c {
  sql_table_name: `stitch-poc-306316.salesforce.Partner_Account__c`
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

  dimension: account_mapping_link__c {
    type: string
    sql: ${TABLE}.account_mapping_link__c ;;
  }

  dimension: agreement_executed__c {
    type: yesno
    sql: ${TABLE}.agreement_executed__c ;;
  }

  dimension: bigcommerce__c {
    type: yesno
    sql: ${TABLE}.bigcommerce__c ;;
  }

  dimension: brands__c {
    type: string
    sql: ${TABLE}.brands__c ;;
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

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension_group: last_onboarding_update__c {
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
    sql: ${TABLE}.last_onboarding_update__c ;;
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

  dimension: magento__c {
    type: yesno
    sql: ${TABLE}.magento__c ;;
  }

  dimension_group: marketing_intro_call__c {
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
    sql: ${TABLE}.marketing_intro_call__c ;;
  }

  dimension: marketing_intro_notes_url__c {
    type: string
    sql: ${TABLE}.marketing_intro_notes_url__c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "ECommerce Platform"
  }

  dimension: ECommerce_Platform_grouped {
    type: string
    sql: case when ${name} in ('Shopify','Salesforec Commerce Cloud','Magento 2','BigCommerce') then ${name} else 'Other' end ;;
  }

  dimension: notes__c {
    type: string
    sql: ${TABLE}.notes__c ;;
  }

  dimension: og_listed_on_site__c {
    type: string
    sql: ${TABLE}.og_listed_on_site__c ;;
  }

  dimension: onboarding_notes__c {
    type: string
    sql: ${TABLE}.onboarding_notes__c ;;
  }

  dimension: opportunities__c {
    type: string
    sql: ${TABLE}.opportunities__c ;;
  }

  dimension: other__c {
    type: string
    sql: ${TABLE}.other__c ;;
  }

  dimension: ownerid {
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: parent_account__c {
    type: string
    sql: ${TABLE}.parent_account__c ;;
  }

  dimension: partner_directory_live__c {
    type: yesno
    sql: ${TABLE}.partner_directory_live__c ;;
  }

  dimension: partner_listing_url__c {
    type: string
    sql: ${TABLE}.partner_listing_url__c ;;
  }

  dimension: partner_merchant_account__c {
    type: yesno
    sql: ${TABLE}.partner_merchant_account__c ;;
  }

  dimension: partner_merchant_account_name__c {
    type: string
    sql: ${TABLE}.partner_merchant_account_name__c ;;
  }

  dimension: partner_merchant_account_platform__c {
    type: string
    sql: ${TABLE}.partner_merchant_account_platform__c ;;
  }

  dimension: partner_notes__c {
    type: string
    sql: ${TABLE}.partner_notes__c ;;
  }

  dimension: partners_listed_on_site__c {
    type: string
    sql: ${TABLE}.partners_listed_on_site__c ;;
  }

  dimension: postal_code_2__c {
    type: string
    sql: ${TABLE}.postal_code_2__c ;;
  }

  dimension: postal_code__c {
    type: string
    sql: ${TABLE}.postal_code__c ;;
  }

  dimension: rating_tier__c {
    type: number
    sql: ${TABLE}.rating_tier__c ;;
  }

  dimension: recharge__c {
    type: yesno
    sql: ${TABLE}.recharge__c ;;
  }

  dimension: recordtypeid {
    type: string
    sql: ${TABLE}.recordtypeid ;;
  }

  dimension: sfcc__c {
    type: yesno
    sql: ${TABLE}.sfcc__c ;;
  }

  dimension: shopify__c {
    type: yesno
    sql: ${TABLE}.shopify__c ;;
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

  dimension: website__c {
    type: string
    sql: ${TABLE}.website__c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
