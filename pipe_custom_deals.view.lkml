view: pipe_custom_deals {
  sql_table_name: `production-202017.ogv2_consumerinsight.Pipe_Custom_Deals`
    ;;

  dimension: annual_contract_value__acv_ {
    type: number
    sql: ${TABLE}.Annual_Contract_Value__ACV_ ;;
  }

  measure: Total_Contract_Value_ACV {
    type: number
    sql: ${annual_contract_value__acv_} ;;
  }

  dimension: Account_Name {
    type: string
    sql: ${TABLE}.Account_Name ;;
  }

  dimension_group: close {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter,
      fiscal_year,
      fiscal_quarter_of_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Close_Date ;;
  }

  dimension: Close_Quarter {
    type: string
    sql: ${TABLE}.Close_Quarter ;;
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

  measure: Total_Implementation_Fee {
    type: number
    sql: ${implementation_fee} ;;
  }

  measure: Implementation_Percent_Of_ACv {
    type: number
    sql: ${implementation_fee}/${annual_contract_value__acv_} ;;
    value_format: "0.00%"
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

  dimension: ACV_Rate_Card {
    type: number
    sql: ${TABLE}.ACV_Rate_Card ;;
  }

  dimension: Implementation_Fee_Rate_Card {
    type: number
    sql: ${TABLE}.Implementation_Fee_Rate_Card ;;
  }

  measure: count {
    type: count
    drill_fields: [opportunity_name, product_name]
  }
}
