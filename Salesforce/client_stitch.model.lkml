connection: "stitch_data_harvest_bq"

include: "/Salesforce/*.view.lkml"
fiscal_month_offset: 1


datagroup: daily_refresh {
  sql_trigger: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24)) ;;
  max_cache_age: "24 hours"
}
persist_for: "24 hours"


explore: account {
  persist_with: daily_refresh
  label: "Salesforce"

  join: opportunity {
    sql_on: ${account.id} = ${opportunity.accountid} ;;
    fields: [-goal,-new_acv_goal]
  }

  join: deal_committee__c {
    type: inner
    sql_on: case when ${deal_committee__c.opportunity_name__c} is not null then ${opportunity.id} else ${account.id} end = case when ${deal_committee__c.opportunity_name__c} is not null then ${deal_committee__c.opportunity_name__c} else ${deal_committee__c.account_name__c} end  ;;
  }

  join: deal_committee_lookup {
    from: opportunity
    sql_on: ${deal_committee__c.opportunity_name__c} =  ${deal_committee_lookup.id};;
    fields: [name]
  }


  # join: custom_packages_sf {
  # ###need to wait on prod in order to have derived tables
  #   view_label: "Custom Packages"
  #   sql_on: ${custom_packages_sf.merchant_id__c} =  ${account.merchant_id__c} ;;
  #   relationship: one_to_many
  # }


}
