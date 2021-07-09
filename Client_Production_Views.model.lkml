connection: "production_bq"

include: "*.view.lkml"
include: "/stitch_zendesk/*.view.lkml"
include: "/Salesforce/*.view.lkml"
include: "/Salesforce/Derived_Tables_sf/*.view.lkml"
include: "/JIRA/*.view.lkml"
include: "/Production_Views_Tables/*.view.lkml"
fiscal_month_offset: 1


explore: order_order_views {

 join: order_item_views {
   type: left_outer
  sql_on: ${order_order_views.id} = ${order_item_views.order_id} ;;
  relationship: one_to_many
 }

 join: subscription_subscription_views {
   type: left_outer
  sql_on: ${subscription_subscription_views.id} = ${order_item_views.subscription_id} ;;
 }

 join: customer_customer_views {
   type: left_outer
  sql_on: ${customer_customer_views.id} = ${order_order_views.customer_id} ;;
 }

join: product_product_views {
  type: left_outer
  sql_on: ${product_product_views.id} = ${order_item_views.product_id} ;;
}
}

explore: subscription_subscription_views {

  join: product_product_views {
    type: left_outer
    sql_on: ${product_product_views.id} = ${subscription_subscription_views.product_id} ;;
  }

  join: order_item_views {
    type: left_outer
    sql_on: ${order_item_views.subscription_id} = ${subscription_subscription_views.id} ;;
  }

  join: order_order_views {
    type: left_outer
    sql_on: ${order_order_views.id} = ${order_item_views.order_id} ;;
  }

  join: offer_offer_views {
    type: left_outer
    sql_on: ${offer_offer_views.id} = ${subscription_subscription_views.offer_id} ;;
  }

  join: merchant_merchant_views {
    sql_on: ${merchant_merchant_views.id} = ${subscription_subscription_views.merchant_id} ;;
  }

  join: customer_customer_views {
    sql_on: ${customer_customer_views.id} = ${subscription_subscription_views.customer_id} ;;
  }
}

explore: event_log_views {

  join: customer_customer_views {
    sql_on: ${event_log_views.customer_id} = ${customer_customer_views.id} ;;
  }
}
