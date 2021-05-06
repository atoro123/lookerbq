view: illy_program_subscribers {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql:select ss.customer_id, ss.merchant_id, min(case when ss.offer_id in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,5160,5428) then ss.created end) as coffee_creation,
      min(case when ss.offer_id in (2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714) then ss.created end) as machine_creation,
      min(case when ss.offer_id not in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714,5160,5428) then ss.created end) as pdp_creation,
      max(case when ss.offer_id in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,5160,5428) then ss.live end) as coffee_status,
      max(case when ss.offer_id in (2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714) then ss.live end) as machine_status,
      max(case when ss.offer_id not in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714,5160,5428) then ss.live end) as pdp_status,
      max(case when ss.offer_id in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,5160,5428) then ss.cancelled end) as coffee_cancel,
      max(case when ss.offer_id in (2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714) then ss.cancelled end) as machine_cancel,
      max(case when ss.offer_id not in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714,5160,5428) then ss.cancelled end) as pdp_cancel,
      count(case when ss.offer_id not in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714,5160,5428) and oo.status =5 then oi.id end) as pdp_successful_orders,
      count(case when ss.offer_id not in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,5160,5428) and oo.status =5 then oi.id end) as coffee_successful_orders,
      count(case when ss.offer_id not in (2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714) and oo.status =5 then oi.id end) as machine_successful_orders,
      sum(case when ss.offer_id not in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714,5160,5428) and oo.status =5 then oi.total_price end) as pdp_successful_revenue,
      sum(case when ss.offer_id not in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,5160,5428) and oo.status =5 then oi.total_price end) as coffee_successful_revenue,
      sum(case when ss.offer_id not in (2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714) and oo.status =5 then oi.total_price end) as machine_successful_revenue
      from ogv2_production.subscription_subscription ss
      left join ogv2_production.order_item oi
      on oi.subscription_id = ss.id
      left join ogv2_production.order_order oo
      on oo.id = oi.order_id
      where ss.merchant_id in (156,169,190,172,223,171,189,191,192)
      group by 1,2
       ;;

      indexes: ["customer_id"]
    }

    dimension: customer_id {
      type: number
      primary_key: yes
      hidden: yes
      sql: ${TABLE}.customer_id ;;
    }

    dimension: Coffee_Completed_Orders {
      type: number
      sql: ${TABLE}.coffee_successful_orders ;;
    }

  dimension: Machine_Completed_Orders {
    type: number
    sql: ${TABLE}.machine_successful_orders ;;
  }

  dimension: PDP_Completed_Orders {
    type: number
    sql: ${TABLE}.pdp_successful_orders ;;
  }

  dimension: Machine_Recurring_Revenue {
    type: number
    sql: ${TABLE}.machine_successful_revenue ;;
  }

  dimension: Coffee_Recurring_Revenue {
    type: number
    sql: ${TABLE}.coffee_successful_revenue ;;
  }

  dimension: PDP_Recurring_Revenue {
    type: number
    sql: ${TABLE}.pdp_successful_revenue ;;
  }

  measure: Total_PDP_Recurring_Revenue {
    type: sum
    sql: ${PDP_Recurring_Revenue} ;;
  }

  measure: Total_Machine_Recurring_Revenue {
    type: sum
    sql: ${Machine_Recurring_Revenue} ;;
  }

  measure: Total_Coffee_Recurring_Revenue {
    type: sum
    sql: ${Coffee_Recurring_Revenue} ;;
  }

    dimension: merchant_id {
      type: number
      sql: ${TABLE}.merchant_id ;;
    }

    dimension_group: created_coffee {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        month_name,
        quarter,
        year,
        day_of_month,
        month_num
      ]
      label: "Coffee Creation"
      sql: ${TABLE}.coffee_creation ;;
    }

    dimension_group: created_coffee_og {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        month_name,
        quarter,
        year,
        day_of_month,
        month_num
      ]
      label: "OG Coffee Creation"
      sql: ${TABLE}.og_coffee_creation ;;
    }

    dimension_group: created_machine {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        month_name,
        quarter,
        year,
        day_of_month,
        month_num
      ]
      label: "Machine Creation"
      sql: ${TABLE}.machine_creation ;;
    }

    dimension_group: created_pdp {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        month_name,
        quarter,
        year,
        day_of_month,
        month_num
      ]
      label: "PDP Creation"
      sql: ${TABLE}.pdp_creation ;;
    }

    dimension: coffee_status {
      type: yesno
      sql: ${TABLE}.coffee_status ;;
    }

    dimension: og_coffee_status {
      type: yesno
      sql: ${TABLE}.og_coffee_status ;;
    }

    dimension: machine_status {
      type: yesno
      sql: ${TABLE}.machine_status ;;
    }

    dimension: pdp_status {
      type: yesno
      sql: ${TABLE}.pdp_status ;;
    }

    dimension_group: cancelled_coffee {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        month_name,
        quarter,
        year,
        day_of_month,
        month_num
      ]
      label: "Coffee Cancelled"
      sql: ${TABLE}.coffee_cancel ;;
    }

    dimension_group: og_cancelled_coffee {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        month_name,
        quarter,
        year,
        day_of_month,
        month_num
      ]
      label: "OG Coffee Cancelled"
      sql: ${TABLE}.og_coffee_cancel ;;
    }

    dimension_group: cancelled_machine {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        month_name,
        quarter,
        year,
        day_of_month,
        month_num
      ]
      label: "Machine Cancelled"
      sql: ${TABLE}.machine_cancel ;;
    }

    dimension_group: cancelled_pdp {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        month_name,
        quarter,
        year,
        day_of_month,
        month_num
      ]
      label: "PDP Cancelled"
      sql: ${TABLE}.pdp_cancel ;;
    }

    measure: customer_count {
      type: count_distinct
      sql: ${TABLE}.customer_id ;;
    }
  }
