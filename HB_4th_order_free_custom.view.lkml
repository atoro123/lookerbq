view: hb_4th_order_free_custom {
    derived_table: {
      sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
      sql:
      select oi.subscription_id, oo.place, oo.id as order_id,oo.status, pp.SKU, pp.name, oi.quantity, if(oi.quantity is null, ss.quantity, oi.quantity)  AS order_item_quantity_all, oi.total_price,round(a.Free_Order_Quantity_average,1) as Free_Order_Quantity_average,round(a.Non_Free_Order_Quantity_average,1) as Non_Free_Order_Quantity_average
   FROM
          `production-202017.ogv2_production.order_item` AS oi
      LEFT JOIN `production-202017.ogv2_production.order_order` AS oo ON oo.id = oi.order_id
      LEFT JOIN `production-202017.ogv2_production.subscription_subscription` AS ss ON oi.subscription_id = ss.id
      LEFT JOIN `production-202017.ogv2_production.product_product` AS pp ON ss.product_id = pp.id

      LEFT JOIN (select oi.subscription_id, AVG(case when total_price = 0 then if(oi.quantity is null, ss.quantity, oi.quantity) else null end) as Free_Order_Quantity_average, AVG(case when total_price <> 0 then if(oi.quantity is null, ss.quantity, oi.quantity) else null end) as Non_Free_Order_Quantity_average
   FROM
          `production-202017.ogv2_production.order_item` AS oi
      LEFT JOIN `production-202017.ogv2_production.order_order` AS oo ON oo.id = oi.order_id
      LEFT JOIN `production-202017.ogv2_production.subscription_subscription` AS ss ON oi.subscription_id = ss.id
      LEFT JOIN `production-202017.ogv2_production.product_product` AS pp ON ss.product_id = pp.id
       where oo.merchant_id = 164 group by 1)  a on a.subscription_id = oi.subscription_id
   where oo.merchant_id = 164 and oo.status = 1 and total_price = 0;;
  }

  dimension: subscription_id {
    sql: ${TABLE}.subscription_id ;;
  }

  dimension_group: place {
    type: time
    timeframes: [
      date,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP(${TABLE}.place) ;;
     }

  dimension: order_id {
    sql: ${TABLE}.order_id ;;
  }

  dimension: status {
    sql: ${TABLE}.status ;;
  }

  dimension: SKU {
    sql: ${TABLE}.SKU ;;
  }

  dimension: product_name {
    sql: ${TABLE}.name ;;
  }

  dimension: order_item_quantity {
    sql: ${TABLE}.quantity ;;
  }

  dimension: order_item_quantity_all {
    sql: ${TABLE}.order_item_quantity_all ;;
  }

  dimension: Free_Order_Quantity_average {
    sql: ${TABLE}.Free_Order_Quantity_average ;;
  }

  dimension: Non_Free_Order_Quantity_average {
    sql: ${TABLE}.Non_Free_Order_Quantity_average ;;
  }


}
