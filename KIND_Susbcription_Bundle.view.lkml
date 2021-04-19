view: kind_susbcription_bundle {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: select subscription_subscription.id as OG_SubID, customer_customer.merchant_user_id as KIND_Customer_ID, product_product.sku as Component_SKU, product_product.name as Product_Name, subscription_subscription.live
              from ogv2_production.customer_customer
              join ogv2_production.subscription_subscription on customer_customer.id = subscription_subscription.customer_id
              join ogv2_production.subscription_subscriptionxproduct on subscription_subscription.id = subscription_subscriptionxproduct.subscription_id
              join ogv2_production.product_product on subscription_subscriptionxproduct.product_id = product_product.id
              where customer_customer.merchant_id = 209
              and subscription_subscription.product_id in (9219464, 9219466);;
    indexes: ["OG_SubID"]
  }


  dimension: OG_SubID {
    type: string
    sql: ${TABLE}.OG_SubID ;;
  }


  dimension: KIND_Customer_ID {
    type: string
    sql: ${TABLE}.KIND_Customer_ID ;;
  }


  dimension: Component_SKU {
    type: string
    sql: ${TABLE}.Component_SKU ;;
  }

  dimension: Product_Name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  measure: count {
    type: count
    sql: ${TABLE}.OG_SubID ;;
  }
}
