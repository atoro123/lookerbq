view: illy_us_capsule_subscribers {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql:select ss.customer_id, ss.product_id as product_id, pp.sku as SKU,
    pp.name as Product_Name, min(ss.created) as creation,
      max(ss.live) as status,
      max(ss.cancelled) as cancel,
      count(oo.id) as successful_orders,
      sum(case when oo.status =5 then oi.total_price end) as successful_revenue,
      sum(case when oo.status =5 then oo.sub_total end) as successful_overall_order_revenue
      from ogv2_production.subscription_subscription ss
      left join ogv2_production.order_item oi
      on oi.subscription_id = ss.id
      left join ogv2_production.order_order oo
      on oo.id = oi.order_id
      left join ogv2_production.product_product pp
      on pp.id = ss.product_id
      where ss.merchant_id = 169
      and ss.product_id in (9188467, 9214774, 9214775, 9217502, 9610357)
      group by 1,2,3,4
       ;;

      indexes: ["customer_id"]
    }

    dimension: customer_id {
      type: number
      primary_key: yes
      sql: ${TABLE}.customer_id ;;
    }

    dimension: SKU {
      type: string
      sql: ${TABLE}.SKU ;;
    }

    measure: AOV {
      type: number
      sql: ${Recurring_Revenue_Overall}/${Completed_Orders} ;;
      value_format: "$0.00"
    }

    measure: Total_Orders {
      type: sum
      sql: ${Completed_Orders} ;;
    }

    dimension: Product_Name {
      type: string
      sql: ${TABLE}.Product_Name ;;
    }

    dimension: product_id {
      type: number
      sql: ${TABLE}.product_id ;;
    }

    dimension: Completed_Orders {
      type: number
      sql: ${TABLE}.successful_orders ;;
    }

    dimension: Recurring_Revenue {
      type: number
      sql: ${TABLE}.successful_revenue ;;
    }

  dimension: Recurring_Revenue_Overall {
    type: number
    sql: ${TABLE}.successful_overall_order_revenue ;;
  }

  measure: Total_Overall_Recurring_Revenue {
    type: sum
    sql: ${Recurring_Revenue_Overall} ;;
  }

    measure: Total_Recurring_Revenue {
      type: sum
      sql: ${Recurring_Revenue} ;;
    }

    dimension: merchant_id {
      type: number
      sql: ${TABLE}.merchant_id ;;
    }

    dimension_group: created {
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
      label: "Capsule Creation"
      sql: ${TABLE}.creation ;;
    }

    dimension: status {
      type: yesno
      sql: ${TABLE}.status ;;
    }


    dimension_group: cancelled {
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
      label: "Capsule Cancelled"
      sql: ${TABLE}.cancel ;;
    }



    dimension: Lifetime {
      description: "Lifetime of Capsule Subscribers"
      type: number
      sql:if(${cancelled_date} is null,DATE_DIFF(CURRENT_DATE(),${created_date}, MONTH) , DATE_DIFF(${cancelled_date},${created_date}, MONTH)) ;;
    }



    measure: customer_count {
      type: count_distinct
      sql: ${TABLE}.customer_id ;;
    }
  }
