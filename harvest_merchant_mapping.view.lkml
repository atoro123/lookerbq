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
    sql: ${TABLE}.client_stats ;;
  }

  dimension: product_level {
    type: string
    sql: ${TABLE}.product_level ;;
  }

  dimension: signed_date {
    type: date
    sql: ${TABLE}.signed_date ;;
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
    sql: ${TABLE}.target_hours ;;
  }

  dimension: integration_start_date {
    type: date
    sql: ${TABLE}.integration_date ;;
  }

  dimension: integration_hours {
    type: number
    sql: ${TABLE}.intergration_hours ;;
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

  dimension: Industry {
    type: string
    sql: ${TABLE}.Industry ;;
  }

  dimension: Sub_Industry {
    type: string
    sql: ${TABLE}.Sub_Industry ;;
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

  measure: Days_Since_start_of_Integration{
    type:number
    sql: date_diff(
            case when ${launch_date} is null then CURRENT_DATE()
              else Date(EXTRACT(YEAR FROM ${launch_date}),EXTRACT(MONTH FROM ${launch_date}),EXTRACT(DAY FROM ${launch_date}))
              end,
            DATE(EXTRACT(YEAR FROM ${integration_start_date}),EXTRACT(MONTH FROM ${integration_start_date}),EXTRACT(DAY FROM ${integration_start_date})),
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

}
