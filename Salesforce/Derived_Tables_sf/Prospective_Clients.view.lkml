view: prospective_clients {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select distinct accountid, name, stagename, fiscalquarter, fiscal, fiscalyear, annual_contract_value_acv__c,
    estimated_close_quarter__c, isclosed, customer_segment__c,
ecommerce_partner__c, ownerid, implementation_fee_rate_card__c, setup_fee__c, acv_rate_card__c
from `stitch-poc-306316.salesforce.Opportunity`
where setup_fee__c is not null
  ;;
    indexes: ["accountid"]
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.accountid ;;
  }

dimension: oppurtunity_name {
  type: string
  sql: ${TABLE}.name ;;
}

dimension: ACV_Rate_Card {
  type: number
  sql: ${TABLE}.acv_rate_card__c ;;
}

measure: Total_ACV_Rate_Card {
  type: sum
  sql: ${ACV_Rate_Card} ;;
}

dimension: oppurtunity_stage {
  type: string
  sql: ${TABLE}.stagename ;;
}

dimension: fiscal_quarter {
  type: number
  sql: ${TABLE}.fiscalquarter ;;
}

dimension: fiscal_year_quarter {
  type: string
  sql: ${TABLE}.fiscal ;;
}

dimension: fiscalyear {
  type: number
  sql: ${TABLE}.fiscalyear ;;
}

dimension: acv {
  type: number
  sql: ${TABLE}.annual_contract_value_acv__c ;;
}

dimension: implementation_fee {
  type: number
  sql: ${TABLE}.setup_fee__c ;;
}

dimension: Estimated_Close_Quarter {
  type: string
  sql: ${TABLE}.estimated_close_quarter__c ;;
}

dimension: is_closed {
  type: yesno
  sql: ${TABLE}.isclosed ;;
}

dimension: customer_segment {
  type: string
  sql: ${TABLE}.customer_segment__c ;;
}

dimension: ecommerce_partner_id {
  type: string
  sql: ${TABLE}.ecommerce_partner__c ;;
}

dimension: salesid {
  type: string
  sql: ${TABLE}.ownerid ;;
}

dimension: implementation_fee_rate_card {
  type: number
  sql: ${TABLE}.implementation_fee_rate_card__c ;;
}

measure: Total_Imp_Fee_Rate_Card {
  type: sum
  sql: ${implementation_fee_rate_card} ;;
}

measure: Total_ACV {
  type: sum
  sql: ${acv} ;;
}

measure: Total_Implementation_Fee {
  type: sum
  sql: ${implementation_fee} ;;
}

measure: Account_Count {
  type: count_distinct
  sql: ${account_id} ;;
}
}
