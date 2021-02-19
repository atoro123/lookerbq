view: pipe_custom_deals {
  sql_table_name: `production-202017.ogv2_consumerinsight.Pipe_Custom_Deals`
    ;;

  dimension: annual_contract_value__acv_ {
    type: number
    sql: ${TABLE}.Annual_Contract_Value__ACV_ ;;
  }

  dimension_group: close {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Close_Date ;;
  }

  dimension: current_subscription_provider {
    type: string
    sql: ${TABLE}.Current_Subscription_Provider ;;
  }

  dimension: e_commerce_platform {
    type: string
    sql: ${TABLE}.eCommerce_Platform ;;
  }

  dimension: implementation_fee {
    type: number
    sql: ${TABLE}.Implementation_Fee ;;
  }

  dimension: migration_needed {
    type: yesno
    sql: ${TABLE}.Migration_Needed ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.Opportunity_Name ;;
  }

  dimension: opportunity_record_type {
    type: string
    sql: ${TABLE}.Opportunity_Record_Type ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }

  dimension: stage {
    type: string
    sql: ${TABLE}.Stage ;;
  }

  dimension: weighted_acv {
    type: number
    sql: ${TABLE}.Weighted_ACV ;;
  }

  dimension: weighted_implementation_fee {
    type: number
    sql: ${TABLE}.Weighted_Implementation_Fee ;;
  }

  measure: count {
    type: count
    drill_fields: [opportunity_name, product_name]
  }
}
