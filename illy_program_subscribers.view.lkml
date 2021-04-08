view: illy_program_subscribers {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql:select customer_id, merchant_id, min(case when offer_id in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,5160,5428) then created end) as coffee_creation,
      min(case when offer_id in (2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714) then created end) as machine_creation,
      min(case when offer_id not in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714,5160,5428) then created end) as pdp_creation,
      max(case when offer_id in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,5160,5428) then live end) as coffee_status,
      max(case when offer_id in (2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714) then live end) as machine_status,
      max(case when offer_id not in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714,5160,5428) then live end) as pdp_status,
      max(case when offer_id in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,5160,5428) then cancelled end) as coffee_cancel,
      max(case when offer_id in (2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714) then cancelled end) as machine_cancel,
      max(case when offer_id not in (2347,2348,4356,2750,2762,2347,3895,2498,2491,2489,2492,2490,2488,3724,2498,3034,4591,4792,2346,3061,3221,3232,3369,3327,2751,2763,2496,2493,2497,2494,2495,4714,5160,5428) then cancelled end) as pdp_cancel
      from ogv2_production.subscription_subscription
      where merchant_id in (156,169,190,172,223,171,189,191,192)
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
