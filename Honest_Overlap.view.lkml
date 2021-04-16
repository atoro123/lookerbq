view: honest_overlap {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select distinct customer_id as customer, count(case when product_id = 9302659 and live is TRUE then id end) as diaper_subs, count(case when product_id != 9302659 and live is TRUE then id end) as sis_subs
      from `production-202017.ogv2_production.subscription_subscription`
      where customer_id in (
      select a.customer
      from (
      select distinct customer_id as customer, max(live) as live
      from `production-202017.ogv2_production.subscription_subscription`
      where merchant_id = 243
      and product_id = 9302659
      group by 1
      having live is TRUE) a)
      and merchant_id = 243
      group by 1;;

      indexes: ["customer"]
    }

    dimension: customer_id{
      group_label: "Client Specific"
      type: number
      sql: ${TABLE}.customer ;;
    }

    dimension: diaper_subs_count {
      group_label: "Client Specific"
      type: number
      sql: ${TABLE}.diaper_subs ;;
    }

    dimension: sis_subs_count {
      group_label: "Client Specific"
      type: number
      sql: ${TABLE}.sis_subs ;;
    }

    measure: Mixed_Subscribers {
      group_label: "Client Specific"
      description: "Count of Subscribers with a D&W and SIS Subscription"
      type: count_distinct
      sql: ${customer_id} ;;
      filters: {
        field: sis_subs_count
        value: "NOT 5"
      }
    }

    measure: diapers_only_subscribers {
      group_label: "Client Specific"
      description: "Subscribers with only D&W Subscriptions"
      type: count_distinct
      sql: ${customer_id} ;;
      filters: {
        field: sis_subs_count
        value: "0"
      }
    }

    measure: customer_count {
      group_label: "Client Specific"
      type: count_distinct
      sql: ${customer_id} ;;
    }
  }
