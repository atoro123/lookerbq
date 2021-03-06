view: historical_information_google_sheet_connected {
  sql_table_name: `production-202017.ogv2_consumerinsight.Historical_Information_Google_Sheet_connected`
    ;;

  dimension: primary {
    hidden: yes
    primary_key: yes
    sql:  concat(${date_date},"PK") ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter
    ]
    sql: TIMESTAMP(${TABLE}.Date) ;;
  }

  dimension: __of_brands {
    type: number
    sql: ${TABLE}.__of_Brands ;;
  }

  dimension: __of_brands_by_platform_atg {
    type: string
    sql: ${TABLE}.__of_Brands_by_Platform_ATG ;;
  }

  dimension: __of_brands_by_platform_big_c {
    type: string
    sql: ${TABLE}.__of_Brands_by_Platform_BigC ;;
  }

  dimension: __of_brands_by_platform_magento {
    type: string
    sql: ${TABLE}.__of_Brands_by_Platform_Magento ;;
  }

  dimension: __of_brands_by_platform_others {
    type: string
    sql: ${TABLE}.__of_Brands_by_Platform_Others ;;
  }

  dimension: __of_brands_by_platform_sfcc {
    type: string
    sql: ${TABLE}.__of_Brands_by_Platform_SFCC ;;
  }

  dimension: __of_brands_by_platform_shopify {
    type: string
    sql: ${TABLE}.__of_Brands_by_Platform_Shopify ;;
  }

  dimension: acv_by_platform_atg {
    type: number
    sql: ${TABLE}.ACV_by_Platform_ATG ;;
  }

  dimension: acv_by_platform_big_c {
    type: number
    sql: ${TABLE}.ACV_by_Platform_BigC ;;
  }

  dimension: acv_by_platform_magento {
    type: number
    sql: ${TABLE}.ACV_by_Platform_Magento ;;
  }

  dimension: acv_by_platform_others {
    type: number
    sql: ${TABLE}.ACV_by_Platform_Others ;;
  }

  dimension: acv_by_platform_sfcc {
    type: number
    sql: ${TABLE}.ACV_by_Platform_SFCC ;;
  }

  dimension: acv_by_platform_shopify {
    type: number
    sql: ${TABLE}.ACV_by_Platform_Shopify ;;
  }

  dimension: asp {
    type: string
    sql: ${TABLE}.ASP ;;
  }

  dimension: average_contract_length {
    type: string
    sql: ${TABLE}.Average_Contract_Length ;;
  }

  dimension: beginning_acv {
    type: number
    sql: ${TABLE}.Beginning_ACV ;;
  }

  dimension: churn_ {
    type: number
    sql: ${TABLE}.Churn_ ;;
  }

  dimension: cost_of_revenue_expenses___pro_serve {
    type: string
    sql: ${TABLE}.Cost_of_Revenue_Expenses___Pro_Serve ;;
  }

  measure: sum_cost_of_revenue_expenses___pro_serve {
    type: sum_distinct
    sql_distinct_key: ${dynamic_created_timeframe} ;;
    sql: ${goal__cost_of_revenue_expenses___pro_serve};;
    value_format: "$#,##0"
  }

  dimension: downsells {
    type: number
    sql: ${TABLE}.Downsells ;;
  }

  dimension: ending_acv {
    type: number
    sql: ${TABLE}.Ending_ACV ;;
  }

  dimension: goal__churn_budget {
    type: number
    sql: ${TABLE}.GOAL__Churn_Budget ;;
  }

  dimension: goal__cost_of_revenue_expenses___pro_serve {
    type: number
    sql: ${TABLE}.GOAL__Cost_of_Revenue_Expenses___Pro_Serve ;;
  }

  dimension: goal__current_q_qualified_pipe__unweighted_acv_ {
    type: number
    sql: ${TABLE}.GOAL__Current_Q_Qualified_Pipe__unweighted_ACV_ ;;
  }

  dimension: goal__current_q_qualified_pipe__weighted_acv_ {
    type: number
    sql: ${TABLE}.GOAL__Current_Q_Qualified_Pipe__weighted_ACV_ ;;
  }

  dimension: goal__ending_acv {
    type: number
    sql: ${TABLE}.GOAL__Ending_ACV ;;
  }

  dimension: goal__gmv_collected_goal_ {
    type: number
    sql: ${TABLE}.GOAL__GMV_Collected_Goal_ ;;
  }

  dimension: goal_monthly_gmv_runrate {
    type: number
    sql: ${goal__gmv_collected_goal_}*12 ;;
    value_format: "$#,##0"
  }

  measure: gmv_goal_runrate {
    type: sum
    label: "GMV Goal Run Rate"
    sql: ${goal_monthly_gmv_runrate} ;;
    value_format: "$#,##0"
  }

  dimension: goal__launches {
    type: number
    sql: ${TABLE}.GOAL__Launches ;;
  }

  measure: Launch_Goal {
    type: sum
    sql: ${goal__launches} ;;
  }

  dimension: goal__net_new_acv {
    type: number
    sql: cast(${TABLE}.GOAL__Net_New_ACV as numeric) ;;
  }

  dimension: goal__new_acv {
    type: number
    sql: cast(${TABLE}.GOAL__New_ACV as numeric) ;;
  }

  dimension: goal__new_acv___new_bus {
    type: number
    sql: cast(${TABLE}.GOAL__New_ACV___New_Bus as numeric);;
  }

  dimension: goal__new_acv_goal___cross_sells {
    type: number
    sql:  cast(${TABLE}.GOAL__New_ACV_Goal___Cross_Sells as numeric) ;;
  }


  dimension: goal__new_acv_goal___upsells {
    type: number
    sql:  ${TABLE}.GOAL__New_ACV_Goal___Upsells ;;
  }

  dimension: goal__next_q_qualified_pipe__unweighted_acv_ {
    type: number
    sql: ${TABLE}.GOAL__Next_Q_Qualified_Pipe__unweighted_ACV_ ;;
  }

  dimension: goal__next_q_qualified_pipe__weighted_acv_ {
    type: number
    sql: ${TABLE}.GOAL__Next_Q_Qualified_Pipe__weighted_ACV_ ;;
  }

  dimension: goal__pro_serve_fee {
    type: number
    sql: ${TABLE}.GOAL__Pro_Serve_Fee ;;
  }

  dimension: goal__sqls {
    type: number
    sql: ${TABLE}.GOAL__SQLs ;;
  }

  dimension: new_acv__cross_sells_ {
    type: number
    sql: ${TABLE}.New_ACV__Cross_Sells_ ;;
  }

  dimension: new_acv__new_sales_ {
    type: number
    sql: ${TABLE}.New_ACV__New_Sales_ ;;
  }

  dimension: new_acv__upsells_ {
    type: number
    sql: ${TABLE}.New_ACV__Upsells_ ;;
  }

  dimension: other_acv {
    type: number
    sql: ${TABLE}.Other_ACV ;;
  }

  dimension: pro_serve_fees_billable_ {
    type: string
    sql: ${TABLE}.Pro_Serve_Fees_Billable_ ;;
  }

  dimension: ytd_gross_retention {
    type: number
    sql: ${TABLE}.YTD_Gross_Retention ;;
    value_format: "0%"
  }

  dimension: ytd_net_retention {
    type: number
    sql: ${TABLE}.YTD_Net_Retention ;;
    value_format: "0%"
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: Beginning_ACV_sum{
    type: sum
    sql: ${beginning_acv} ;;
    value_format: "$#,##0"
  }

  measure:New_ACV_new_sales_sum{
    type: sum
    sql: ${new_acv__new_sales_} ;;
    value_format: "$#,##0"
  }

  measure: New_ACV_cross_sells_sum{
    type: sum
    sql: ${new_acv__cross_sells_} ;;
    value_format: "$#,##0"
  }

  measure: New_ACV_upsells_sum{
    type: sum
    sql: ${new_acv__upsells_} ;;
    value_format: "$#,##0"
  }

  measure: Churn_sum {
    type: sum
    sql: ${churn_} ;;
    value_format: "$#,##0"
  }

  measure: Downsells_sum {
    type: sum
    sql: ${downsells} ;;
    value_format: "$#,##0"
  }

  measure: Other_ACV_Sum{
    type: sum
    sql: ${other_acv} ;;
    value_format: "$#,##0"
  }

  measure: Ending_ACV_Sum {
    type: sum
    sql: ${ending_acv} ;;
    value_format: "$#,##0"
  }

  dimension: goal__uqls {
    type: number
    sql: ${TABLE}.GOAL__UQLs ;;
  }

  measure: SQL_Goal {
    type: max
    sql: ${goal__sqls};;
  }

  measure: UQL_Goal {
    type: max
    sql: ${goal__uqls};;
  }

  measure: Churn_goal {
    type: max
    sql: abs(${goal__churn_budget}) ;;
    value_format: "$#,##0"
  }

  dimension: net_new_acv_goal {
    type: number
    sql: ${goal__new_acv}-${goal__churn_budget} ;;
  }

  dimension:  GOAL__New_ACV___of_Transactions___Shopify {
    sql: ${TABLE}.GOAL__New_ACV___of_Transactions___Shopify ;;
  }

  dimension:  GOAL__New_ACV___of_Transactions___Other {
    sql: ${TABLE}.GOAL__New_ACV___of_Transactions___Other ;;
  }

  dimension:  GOAL__New_ACV___of_Transactions___Big_Commerce {
    sql: ${TABLE}.GOAL__New_ACV___of_Transactions___Big_Commerce ;;
  }

  dimension:  GOAL__New_ACV___of_Transactions___Magento {
    sql: ${TABLE}.GOAL__New_ACV___of_Transactions___Magento ;;
  }

  dimension:  GOAL__New_ACV___of_Transactions___Salesforce {
    sql: ${TABLE}.GOAL__New_ACV___of_Transactions___Salesforce ;;
  }

  dimension:  GOAL__New_ACV_ASP___Shopify {
    sql: ${TABLE}.GOAL__New_ACV_ASP___Shopify ;;
  }

  dimension:  GOAL__New_ACV_ASP___Salesforce {
    sql: ${TABLE}.GOAL__New_ACV_ASP___Salesforce ;;
  }

  dimension:  GOAL__New_ACV_ASP___Magento {
    sql: ${TABLE}.GOAL__New_ACV_ASP___Magento ;;
  }

  dimension:  GOAL__New_ACV_ASP___Big_Commerce {
    sql: ${TABLE}.GOAL__New_ACV_ASP___Big_Commerce ;;
  }

  dimension:  GOAL__New_ACV_ASP___Other {
    sql: ${TABLE}.GOAL__New_ACV_ASP___Other ;;
  }

  dimension:  GOAL__New_ACV___Shopify {
    sql: ${TABLE}.GOAL__New_ACV___Shopify ;;
  }

  dimension:  GOAL__New_ACV___Salesforce {
    sql: ${TABLE}.GOAL__New_ACV___Salesforce ;;
  }

  dimension:  GOAL__New_ACV___Magento {
    sql: ${TABLE}.GOAL__New_ACV___Magento ;;
  }

  dimension:  GOAL__New_ACV___Big_Commerce {
    sql: ${TABLE}.GOAL__New_ACV___Big_Commerce ;;
  }

  dimension:  GOAL__New_ACV___Other {
    sql: ${TABLE}.GOAL__New_ACV___Other ;;
  }

  measure: net_new_acv_goal_max {
    type: max
    sql: abs(${net_new_acv_goal}) ;;
  }


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

  dimension: dynamic_created_timeframe {
    type: string
    sql:
    case when {% parameter timeframe_picker %} = 'Date' then date(${date_date})
    when {% parameter timeframe_picker %} = 'Week' then date(${date_date})
    when {% parameter timeframe_picker %} = 'Month' then date(FORMAT_TIMESTAMP('%Y-%m-01', ${date_date}))
    when {% parameter timeframe_picker %} = 'Quarter' then DATE_ADD(date((FORMAT_TIMESTAMP('%Y-%m-01', TIMESTAMP_TRUNC(CAST(CAST(DATETIME_ADD(CAST(TIMESTAMP_TRUNC(CAST(${date_date} AS TIMESTAMP), MONTH) AS DATETIME), INTERVAL -1 MONTH) AS TIMESTAMP) AS TIMESTAMP), QUARTER)))), INTERVAL 1 MONTH)
    when {% parameter timeframe_picker %} = 'Year' then date(FORMAT_TIMESTAMP('%Y-01-01', ${date_date}))
    end ;;
  }
}
