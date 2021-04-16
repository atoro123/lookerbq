view: honest_sis_orders {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select distinct oi.order_id as order_id
      from `production-202017.ogv2_production.order_item` oi
      left join `production-202017.ogv2_production.order_order` oo
      on oo.id = oi.order_id
      left join `production-202017.ogv2_production.subscription_subscription` ss
      on ss.id = oi.subscription_id
      where oo.merchant_id = 243
      and ss.offer_id = 4683
      and oo.status = 5 ;;

      indexes: ["order_id"]
    }

    dimension: order_id {
      hidden: yes
      type: number
      sql: ${TABLE}.order_id ;;
    }
  }
