connection: "production_bq"

include: "*.view.lkml"
include: "/stitch_zendesk/*.view.lkml"
include: "/Salesforce/*.view.lkml"
include: "/Salesforce/Derived_Tables_sf/*.view.lkml"
include: "/JIRA/*.view.lkml"
fiscal_month_offset: 1

# include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }


# explore: order_item {}
datagroup: daily_refresh {
  sql_trigger: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*6)/(60*60*24)) ;;
  max_cache_age: "2 hours"
}
persist_for: "2 hours"

explore: order_order {
  view_label: "Order"
  persist_with: daily_refresh
  label: "1) Orders"
  access_filter: {field:merchant_id
    user_attribute:merchant_id}

  join: order_item {
    view_label: "Order Item"
    sql_on: ${order_order.id} = ${order_item.order_id} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: customer_payment {
    sql_on: ${customer_payment.id} = ${order_order.payment_id} ;;
  }

  join: subscription_subscription {
    view_label: "Subscription"
    sql_on: ${order_item.subscription_id} = ${subscription_subscription.id} ;;
    relationship: many_to_one

  }

  join: subscription_offer {
    view_label: "Subscription"
    from: offer_offer
    sql_on: ${subscription_offer.id} = ${subscription_subscription.offer_id};;
    relationship: one_to_many
  }

  join: order_offer {
    view_label: "Order Item"
    from: offer_offer
    sql_on: ${order_offer.id} = ${order_item.offer_id}  ;;
relationship: one_to_many

}

  join: order_placementfailure {
    view_label: "Order"
    type: inner
    sql_on: ${order_order.public_id} = ${order_placementfailure.order_public_id} ;;
    relationship: one_to_one
  }


  join: customer_customer {
    view_label: "Customer"
    sql_on: ${customer_customer.id} = ${subscription_subscription.customer_id}
    ;;
    relationship: many_to_one
  }

  join: customer_facts {
    type: left_outer
    view_label: "Customer"
    sql_on: ${customer_customer.id} = ${customer_facts.customer_id} ;;
    relationship: one_to_one
}

  join: recycle_ccexpirationdatelog {
    type: left_outer
    view_label: "Credit Card Recycling"
    sql_on: ${recycle_ccexpirationdatelog.order_id} = ${order_order.id} ;;
    relationship: one_to_many
  }


  join: product_product {
    view_label: "Product"
  sql_on: ${product_product.id} = ${order_item.product_id};;
    relationship: one_to_many
  }

  join: lovelyskin_brands {
    sql_on: ${lovelyskin_brands.sku} = ${product_product.sku} ;;
    relationship: one_to_one
  }

  join: subscription_product {
    from: product_product
    sql_on: ${subscription_product.id} = ${subscription_subscription.product_id} ;;
  }

  join: merchant_merchant {
    view_label: "Merchant"
    sql_on: ${merchant_merchant.id} = ${order_order.merchant_id};;
    relationship: one_to_many
  }

  join: subscription_monthly_summary {
    type: left_outer
    sql_on: ${subscription_monthly_summary.date_date} = ${subscription_subscription.created_date} ;;
    relationship: many_to_many
    }

  join: merchant_merchant_industries {
    view_label: "Merchant"
    sql_on: ${merchant_merchant.id} = ${merchant_merchant_industries.merchant_id};;
    relationship: one_to_one
  }

  join: merchant_industry {
    view_label: "Merchant"
    sql_on: ${merchant_merchant_industries.industry_id} = ${merchant_industry.id};;
    relationship: one_to_many
  }

  join: industry_info {
    sql_on: ${merchant_merchant.id} = ${industry_info.merchant_id} ;;
    relationship: one_to_many
  }

  join: customer_address {
    view_label: "Customer Address"
    sql_on: ${customer_address.customer_id} = ${order_order.customer_id} ;;
    relationship: many_to_one
  }

  join: BOPUS {
    from: customer_address
    sql_on: ${BOPUS.id} =  ${order_order.shipping_address_id} ;;
    relationship: many_to_one
    sql_where: ${BOPUS.store_public_id} is not null ;;
    fields: [BOPUS.id, BOPUS.customer_id, BOPUS.store_public_id]
  }


  join: product_product_categories {
    view_label: "Product"
    sql_on: ${product_product.id} = ${product_product_categories.product_id} ;;
    relationship: one_to_many
  }

  join: product_category {
    view_label: "Product"
    sql_on: ${product_product_categories.category_id} = ${product_category.id} ;;
    relationship: many_to_one
  }

  join: experience_experiencesetting {
    view_label: "Experience Setting"
    sql_on: ${customer_customer.merchant_user_id} = ${experience_experiencesetting.merchant_user_id} AND ${merchant_merchant.public_id} = ${experience_experiencesetting.merchant_public_id};;
    relationship: one_to_one
  }

  join: order_rejection {
    type: left_outer
    view_label: "1st Rejection"
    sql_on: ${order_rejection.customer_id} = ${order_order.customer_id} ;;
    relationship: many_to_one
  }

  join: order_placementlog {
    type: left_outer
    sql_on: ${order_order.id} = ${order_placementlog.order_id} ;;
    relationship: one_to_many
  }

  join: customers_impulse_upsell {
    type: left_outer
    sql_on: ${order_order.customer_id} = ${customers_impulse_upsell.customer_id} ;;
    relationship: one_to_one
  }

  join: honest_diaper_orders {
    type: left_outer
    view_label: "Honest"
    sql_on: ${honest_diaper_orders.order_id} = ${order_order.id} ;;
    relationship: one_to_one
  }

  join: honest_sis_orders {
    type: left_outer
    view_label: "Honest"
    sql_on: ${honest_sis_orders.order_id} = ${order_order.id} ;;
    relationship: one_to_one
  }

  join: honest_overlap {
    type: left_outer
    view_label: "Subscription"
    sql_on: ${honest_overlap.customer_id} = ${subscription_subscription.customer_id} ;;
    relationship: many_to_one
  }

  join: event_log {
    type: left_outer
    sql_on: ${customer_customer.id} = ${event_log.customer_id} ;;
    relationship: one_to_many
  }

  join: sms_mgmt_enrolled {
    type: left_outer
    sql_on: ${sms_mgmt_enrolled.merchant_user_id_test} = ${customer_customer.merchant_user_id} ;;
    relationship: one_to_one
  }

  join: vsi_email_bopus {
    sql_on: ${vsi_email_bopus.order_id} = ${order_order.id} ;;
    relationship: many_to_one
  }


  join: order_number {
    view_label: "Order"
    sql_on: ${order_order.id} = ${order_number.order_id} ;;
    relationship: one_to_many
    type: left_outer
  }


  join: cart_log {
    sql_on: ${customer_customer.id} = ${cart_log.customer_id} ;;
    relationship: many_to_one
    fields: [cart_log.logged_date,cart_log.session_id,cart_log.customer_id,cart_log.total,cart_log.merchant_id,cart_log.Distinct_Customers]
  }


  join: gmv_forecast {
    sql_on: ${gmv_forecast.merchant_id} = ${order_order.merchant_id} ;;
    relationship: one_to_one}

  join: harvest_merchant_mapping {
    type: left_outer
    sql_on: ${harvest_merchant_mapping.merchant_id} = ${order_order.merchant_id} ;;
    relationship: many_to_one
  }
  join: acv_tiers {
    type: left_outer
    sql_on: ${acv_tiers.merchant_id} = ${order_order.merchant_id} ;;
    relationship: many_to_one
  }
  join: coupon_onetimecoupon {
    sql_on: ${coupon_onetimecoupon.order_public_id} = ${order_order.public_id} AND ${coupon_onetimecoupon.merchant_public_id} = ${merchant_merchant.public_id} ;;
  }

  join: subscription_log {
  type: full_outer
  sql_on: date(${order_order.place_date}) = date(${subscription_log.logged_date}) and ${order_order.merchant_id} = ${subscription_log.merchant_id} ;;
  fields: [subscription_log.sum_total_price,subscription_log.event_id,subscription_log.subscription_type,subscription_log.logged_date,subscription_log.offer_id,subscription_log.customer_id,subscription_log.source_id]
  relationship: many_to_many
  }

  join: account {
    sql_on: ${account.merchant_id__c} = ${order_order.merchant_id} ;;
    relationship: one_to_one
  }

  join: user {
    view_label: "Primary Success Owner"
    sql_on: ${user.id} = ${account.primary_success_owner__c} ;;
  }

  join: parent_account {
    from: account
    sql_on: ${account.parentid} = ${parent_account.id};;
    fields: [parent_account.name]
  }
  }


explore: subscription_subscription {
  label: "2) Subscriptions"
  view_label: "Subscription"
  persist_with: daily_refresh
  access_filter: {field:merchant_id
    user_attribute:merchant_id}
  join: order_item {
    sql_on: ${subscription_subscription.id} = ${order_item.subscription_id} ;;
    relationship: many_to_many
    }
  join: product_product {
    view_label: "Product"
    sql_on: ${product_product.id} = ${subscription_subscription.product_id};;
    relationship: one_to_many
  }

  join: account {
    sql_on: ${acv_tiers.merchant_id} = ${account.merchant_id__c} ;;
  }

  join: subscription_order_count {
    sql_on: ${subscription_order_count.subscription_id} = ${subscription_subscription.id} ;;
    relationship: one_to_many
  }

  join: lv_brands {
    view_label: "Lucky Vitamin Brands"
    sql_on: ${lv_brands.sku} = ${product_product.sku} ;;
    relationship: one_to_one
  }

  join: lovelyskin_brands {
    sql_on: ${lovelyskin_brands.sku} = ${product_product.sku} ;;
    relationship: one_to_one
  }
  join: merchant_merchant {
    view_label: "Merchant"
    sql_on: ${merchant_merchant.id} = ${subscription_subscription.merchant_id};;
    relationship: one_to_many
  }
  join: customer_customer {
    view_label: "Customer"
    sql_on: ${customer_customer.id} = ${subscription_subscription.customer_id}
      ;;
    relationship: many_to_one
  }
  join: order_order {
    view_label: "Order"
    sql_on: ${order_item.order_id} = ${order_order.id} ;;
    relationship: many_to_many
  }

  join: recycle_ccexpirationdatelog {
    type: left_outer
    view_label: "Credit Card Recycling"
    sql_on: ${recycle_ccexpirationdatelog.order_id} = ${order_order.id} ;;
    relationship: one_to_many
  }

  join: honest_diaper_orders {
    type: left_outer
    view_label: "Honest"
    sql_on: ${honest_diaper_orders.order_id} = ${order_order.id} ;;
    relationship: one_to_one
  }

  join: honest_sis_orders {
    type: left_outer
    view_label: "Honest"
    sql_on: ${honest_sis_orders.order_id} = ${order_order.id} ;;
    relationship: one_to_one
  }

  join: honest_overlap {
    type: left_outer
    view_label: "Subscription"
    sql_on: ${honest_overlap.customer_id} = ${subscription_subscription.customer_id} ;;
    relationship: many_to_one
  }

  join: customer_facts {
    type: left_outer
    view_label: "Customer"
    sql_on: ${customer_customer.id} = ${customer_facts.customer_id} ;;
    relationship: one_to_one
  }
  join: order_offer {
    view_label: "Order"
    from: offer_offer
    sql_on: ${order_offer.id} = ${order_item.offer_id}  ;;
    relationship: one_to_many

  }
  join: subscription_offer {
    view_label: "Subscription"
    from: offer_offer
    sql_on: ${subscription_offer.id} = ${subscription_subscription.offer_id};;
    relationship: one_to_many
  }
  join: merchant_merchant_industries {
    view_label: "Merchant"
    sql_on: ${merchant_merchant.id} = ${merchant_merchant_industries.merchant_id};;
    relationship: one_to_one
  }

  join: merchant_industry {
    view_label: "Merchant"
    sql_on: ${merchant_merchant_industries.industry_id} = ${merchant_industry.id};;
    relationship: one_to_many
  }

  join: industry_info {
    sql_on: ${merchant_merchant.id} = ${industry_info.merchant_id} ;;
    relationship: one_to_many
  }

  join: order_over_order {
    view_label: "Subscription"
    sql_on: ${order_over_order.subscription_id} = ${subscription_subscription.id};;
    relationship: one_to_one
  }

  join: order_placementfailure {
    view_label: "Order"
    sql_on: ${order_order.public_id} = ${order_placementfailure.order_public_id} ;;
    relationship: one_to_one
  }

  join: product_product_categories {
    view_label: "Product"
    sql_on: ${product_product.id} = ${product_product_categories.product_id} ;;
    relationship: one_to_many
  }

  join: product_category {
    view_label: "Product"
    sql_on: ${product_product_categories.category_id} = ${product_category.id} ;;
    relationship: many_to_one
  }


  join: experience_experiencesetting {
    view_label: "Experience Setting"
    sql_on: ${customer_customer.merchant_user_id} = ${experience_experiencesetting.merchant_user_id} AND ${merchant_merchant.public_id} = ${experience_experiencesetting.merchant_public_id};;
    relationship: one_to_one
  }

  join: offer_offerprofile {
    view_label: "Offer Profile"
    sql_on: ${offer_offerprofile.id} = ${subscription_offer.offer_profile_id} ;;
    relationship: many_to_one
  }

  join: customer_address {
    view_label: "Customer Address"
    sql_on: ${customer_address.id} = ${subscription_subscription.shipping_address_id} ;;
    relationship: many_to_one
  }

  join: customers_impulse_upsell {
    type: left_outer
    sql_on: ${subscription_subscription.customer_id} = ${customers_impulse_upsell.customer_id} ;;
    relationship: many_to_one
  }

  join: event_log {
    type: left_outer
    sql_on: ${customer_customer.id} = ${event_log.customer_id} ;;
    relationship: one_to_many
  }

  join: vsi_email_bopus {
    sql_on: ${vsi_email_bopus.order_id} = ${order_order.id} ;;
    relationship: many_to_one
  }

  join: cart_log {
    sql_on: ${customer_customer.id} = ${cart_log.customer_id} ;;
    relationship: many_to_one
    fields: [cart_log.logged_date,cart_log.session_id,cart_log.customer_id,cart_log.total,cart_log.merchant_id,cart_log.Distinct_Customers]}

  join: final_oos {
    from: event_log
    type: left_outer
    sql_on: ${final_oos.OOS_Sub_ID} = ${subscription_subscription.id} ;;
    relationship: many_to_one
  }

  join: zombie_cancels {
    type: left_outer
    sql_on: ${zombie_cancels.zombie_subscription} = ${subscription_subscription.id} ;;
    relationship: one_to_one
  }

#     join: gamer_predictions {
#     sql_on: ${gamer_predictions.subscription_id} = ${subscription_subscription.id} ;;
#     relationship: one_to_one
#      }

  join: subscription_log {
    type: left_outer
    sql_on: ${subscription_log.subscription_id} = ${subscription_subscription.id} ;;
    sql_where: ${subscription_log.event_id} = 2 ;;
  }

  join: subscription_order {
    type: left_outer
    sql_on: ${subscription_order.subscription_id} = ${subscription_subscription.id} ;;
    relationship: one_to_one
  }

  join: acv_tiers {
    type: left_outer
    sql_on: ${acv_tiers.merchant_id} = ${subscription_log.merchant_id} ;;
    relationship: many_to_one
  }

  join: harvest_merchant_mapping {
    type: left_outer
    sql_on: ${harvest_merchant_mapping.merchant_id} = ${subscription_subscription.merchant_id} ;;
    relationship: many_to_one
  }
  }

explore: customer_customer {
  label: "3) Customers"
  view_label: "Customer"
  persist_with: daily_refresh
  access_filter: {field:merchant_id
    user_attribute:merchant_id}

  join: merchant_merchant {
    view_label: "Merchant"
    sql_on: ${customer_customer.merchant_id} = ${merchant_merchant.id} ;;
    relationship: many_to_one
  }

  join: experience_experiencesetting {
    view_label: "Experience Setting"
    sql_on: ${customer_customer.merchant_user_id} = ${experience_experiencesetting.merchant_user_id} AND ${merchant_merchant.public_id} = ${experience_experiencesetting.merchant_public_id};;
    relationship: one_to_one
  }
  join: customer_facts {
    type: left_outer
    view_label: "Customer"
    sql_on: ${customer_customer.id} = ${customer_facts.customer_id} ;;
    relationship: one_to_one
}

  join: subscription_subscription {
      view_label: "Subscription"
      sql_on: ${customer_customer.id} = ${subscription_subscription.customer_id} ;;
      relationship: many_to_one}

    join: product_product {
      sql_on: ${product_product.id} = ${subscription_subscription.product_id} ;;
      relationship: one_to_many
}
  join: order_order {
    view_label: "Order"
    sql_on: ${customer_facts.customer_id} = ${order_order.customer_id} ;;
    relationship: many_to_one

  }

  join: honest_diaper_orders {
    type: left_outer
    view_label: "Honest"
    sql_on: ${honest_diaper_orders.order_id} = ${order_order.id} ;;
    relationship: one_to_one
  }

  join: honest_sis_orders {
    type: left_outer
    view_label: "Honest"
    sql_on: ${honest_sis_orders.order_id} = ${order_order.id} ;;
    relationship: one_to_one
  }

  join: recycle_ccexpirationdatelog {
    type: left_outer
    view_label: "Credit Card Recycling"
    sql_on: ${recycle_ccexpirationdatelog.order_id} = ${order_order.id} ;;
    relationship: one_to_many
  }

  join: order_item {
    view_label: "Order Item"
    sql_on: ${order_order.id} = ${order_item.order_id} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: order_placementfailure {
    view_label: "Order"
    sql_on: ${order_order.public_id} = ${order_placementfailure.order_public_id} ;;
    relationship: one_to_one
  }

  join: subscription_offer {
    view_label: "Subscription"
    from: offer_offer
    sql_on: ${subscription_offer.id} = ${subscription_subscription.offer_id};;
    relationship: one_to_many
  }

  join: order_offer {
    view_label: "Order Item"
    from: offer_offer
    sql_on: ${order_offer.id} = ${order_item.offer_id}  ;;
    relationship: one_to_many

  }

  join: merchant_merchant_industries {
    view_label: "Merchant"
    sql_on: ${merchant_merchant.id} = ${merchant_merchant_industries.merchant_id};;
    relationship: one_to_one
  }

  join: merchant_industry {
    view_label: "Merchant"
    sql_on: ${merchant_merchant_industries.industry_id} = ${merchant_industry.id};;
    relationship: one_to_many
  }

  join: industry_info {
    sql_on: ${merchant_merchant.id} = ${industry_info.merchant_id} ;;
    relationship: one_to_many
  }

  join: customers_impulse_upsell {
    type: left_outer
    sql_on: ${customer_customer.id} = ${customers_impulse_upsell.customer_id} ;;
    relationship: one_to_one
  }

  join: event_log {
    type: left_outer
    sql_on: ${customer_customer.id} = ${event_log.customer_id} ;;
    sql_where: ${event_log.type_id} in (8,10,11,12,14,15,16,17,18,19,20,41,21,22,24,25,27,28) ;;
    relationship: one_to_many
    fields: [event_log.customer_id, event_log.id, event_log.logged_date, event_log.logged_month, event_log.logged_year, event_log.type_id]
  }

  join: customer_address {
    sql_on: ${customer_address.customer_id} = ${customer_customer.id} ;;
    relationship: one_to_one
  }

  join: vsi_email_bopus {
    sql_on: ${vsi_email_bopus.order_id} = ${order_order.id} ;;
    relationship: many_to_one
  }

  join: cart_log {
    sql_on: ${customer_customer.id} = ${cart_log.customer_id} ;;
    relationship: many_to_one
    fields: [cart_log.logged_date,cart_log.session_id,cart_log.customer_id,cart_log.total,cart_log.merchant_id,cart_log.Distinct_Customers]
    }

  join: order_check {
    from: order_order
    sql_on: ${cart_log.merchant_order_id} = ${order_check.order_merchant_id} ;;
    relationship: many_to_one
    fields: [order_check.order_merchant_id,order_check.in_cart_log]

  }

  join: harvest_merchant_mapping {
    type: left_outer
    sql_on: ${harvest_merchant_mapping.merchant_id} = ${merchant_merchant.id} ;;
    relationship: many_to_one
  }


  join: customer_IU_tracker {
    type: full_outer
    view_label: "Customer"
    sql_on: ${customer_IU_tracker.customer_id} = ${customer_customer.id} ;;
    relationship: one_to_one
  }

  join: subscription_log {
    sql_on: ${customer_customer.id} = ${subscription_log.customer_id} ;;
    relationship: many_to_one
    fields: [subscription_log.customer_id,subscription_log.total_price,subscription_log.subscription_type,subscription_log.sum_total_price,subscription_log.offer_id,subscription_log.source_id,subscription_log.event_id]
  }
}

explore: harvest_merchant_mapping {
  label: "Harvest"
  join: harvest_hours {
    sql_on: case when REGEXP_CONTAINS(client, "-") is TRUE then ${harvest_hours.merchant_id} = ${harvest_merchant_mapping.merchant_id} else
      ${harvest_hours.client} = ${harvest_merchant_mapping.account} end;;
    relationship: one_to_many
  }

  join: harvest {
    view_label: "New Harvest"
    sql_on: ${harvest.merchant_id} = ${harvest_merchant_mapping.merchant_id} ;;
    relationship: one_to_many
  }

  join: merchant_merchant {
    sql_on: ${merchant_merchant.id} = ${harvest_merchant_mapping.merchant_id} ;;
    relationship: one_to_one
  }

  join: industry_info {
    sql_on: ${merchant_merchant.id} = ${industry_info.merchant_id} ;;
    relationship: one_to_many
  }

  join: csd_tickets {
    sql_on: ${external_source_merchant_mapping.csd_name} = ${csd_tickets.project_name} ;;
  }

  join: jira_ticket {
    sql_on: ${external_source_merchant_mapping.csd_name} = ${jira_ticket.Project_Name} ;;
  }

  join: external_source_merchant_mapping {
    sql_on: ${harvest_merchant_mapping.merchant_id} = ${external_source_merchant_mapping.merchant_id} ;;
  }

  join: acv_tiers {
    sql_on: ${acv_tiers.merchant_id} = ${harvest_merchant_mapping.merchant_id} ;;
    relationship: one_to_one
  }

  join: gmv_weekly {
    sql_on: ${harvest_merchant_mapping.merchant_id} = ${gmv_weekly.merchant_id} ;;
    relationship: one_to_one
  }

  join: custom_deals {
    view_label: "Harvest Merchant Mapping"
    sql_on: ${custom_deals.merchant_id} = ${harvest_merchant_mapping.merchant_id} ;;
    relationship: one_to_many
  }


  join: custom_deals_pairs {
    view_label: "Harvest Merchant Mapping"
    sql_on: ${custom_deals_pairs.merchant_id} = ${harvest_merchant_mapping.merchant_id} ;;
    relationship: one_to_many
  }

  join: custom_deals_add_ons {
    view_label: "Harvest Merchant Mapping"
    sql_on: ${custom_deals_add_ons.merchant_id} = ${harvest_merchant_mapping.merchant_id} ;;
    relationship: many_to_one
  }


  join: custom_deals_add_on_pairs {
    view_label: "Harvest Merchant Mapping"
    sql_on: ${custom_deals_add_on_pairs.merchant_id} = ${harvest_merchant_mapping.merchant_id} ;;
    relationship: many_to_one
  }

  join: harvest_clients {
    view_label: "Harvest"
    type: inner
    sql_on: case when REGEXP_CONTAINS(${harvest_clients.name}, "-") is TRUE then ${harvest_clients.merchant_id} = ${harvest_merchant_mapping.merchant_id} else
      ${harvest_clients.name} = ${harvest_merchant_mapping.account} end;;
    relationship: one_to_one
  }

  join: harvest_time_entries {
    view_label: "Harvest"
    type: left_outer
    sql_on: ${harvest_time_entries.client_id} = ${harvest_clients.id};;
    relationship: one_to_many
  }

  join: harvest_tasks {
    view_label: "Harvest"
    type: left_outer
    sql_on: ${harvest_tasks.id} = ${harvest_time_entries.task_id} ;;
  }

  join: harvest_users {
    type: left_outer
    view_label: "Harvest"
    sql_on: ${harvest_users.id} = ${harvest_time_entries.user_id} ;;
    relationship: many_to_one
  }

  join: harvest_user_roles {
    view_label: "Harvest"
    type: left_outer
    sql_on: ${harvest_user_roles.user_id} = ${harvest_users.id} ;;
  }

  join: harvest_roles {
    view_label: "Harvest"
    type: left_outer
    sql_on: ${harvest_roles.id} = ${harvest_user_roles.role_id} ;;
  }

  join: harvest_projects {
    view_label: "Harvest"
    type: left_outer
    sql_on: ${harvest_projects.id} = ${harvest_time_entries.project_id} ;;
    relationship: many_to_one
  }

  join: account {
    sql_on: ${account.name} = ${harvest_merchant_mapping.account} ;;
    relationship: one_to_one
  }

  join: prospective_clients {
    sql_on: ${account.id} = ${prospective_clients.account_id} ;;
    relationship: one_to_one
  }

  join: client_status_tracker__c {
    sql_on: ${account.id} = ${client_status_tracker__c.account__c} ;;
  }

  join: parent_account {
    from: account
    sql_on: ${account.parentid} = ${parent_account.id};;
    fields: [parent_account.name]
  }

  join: user {
    view_label: "Primary Success Owner"
    sql_on: ${user.id} = ${account.primary_success_owner__c} ;;
  }

  join: Sales_Owner {
    from: user
    view_label: "Primary Sales Owner"
    sql_on: ${user.id} = ${account.ownerid} ;;
  }

  join: opportunity {
    sql_on: ${account.id} = ${opportunity.accountid} ;;
  }

  join: historical_information_google_sheet_connected {
    type:full_outer
    relationship: many_to_one
    sql_on: DATE_TRUNC(date(${opportunity.closedate_date}), month) = ${historical_information_google_sheet_connected.date_date} ;;
  }

  join: opportunity_record_type {
    from: record_type
    sql_on: ${opportunity.recordtypeid} = ${opportunity_record_type.id} ;;
  }

  join: partner_account__c {
    sql_on: ${account.ecommerce_platform2__c} = ${partner_account__c.id} ;;
    fields: [partner_account__c.id, partner_account__c.name]
  }
}

explore: event_log {
  label: "8) Event Log"
  from: event_log
  join: customer_customer {
    view_label: "Customer"
    sql_on: ${event_log.customer_id} = ${customer_customer.id};;
    fields: [customer_customer.id, customer_customer.created_date, customer_customer.created_month, customer_customer.created_time, customer_customer.created_week, customer_customer.created_year, customer_customer.live,
      customer_customer.merchant_id, customer_customer.merchant_user_id ]
    relationship: many_to_one
  }
  join: subscription_subscription {
    type: left_outer
    sql_on: ${subscription_subscription.customer_id} = ${customer_customer.id} ;;
    fields: [subscription_subscription.id, subscription_subscription.customer_id, subscription_subscription.merchant_id, subscription_subscription.product_id,
      subscription_subscription.quantity, subscription_subscription.Average_Frequency, subscription_subscription.Average_Lifetime, subscription_subscription.Average_Quantity,
      subscription_subscription.frequency_days, subscription_subscription.bucket_frequency, subscription_subscription.cancelled_date, subscription_subscription.cancelled_month,
      subscription_subscription.cancelled_day_of_month, subscription_subscription.cancelled_quarter, subscription_subscription.cancel_reason, subscription_subscription.offer_id,
      subscription_subscription.created_date, subscription_subscription.created_month, subscription_subscription.created_time, subscription_subscription.created_week,
      subscription_subscription.live, subscription_subscription.subscription_type, subscription_subscription.merchant_order_id, subscription_subscription.Guest_User, subscription_subscription.24_Hour_Cancels,
      subscription_subscription.24hr_Cancel, subscription_subscription.marketing_program_name]
    relationship: one_to_many
  }

  join: order_order {
    type: left_outer
    sql_on: ${order_order.customer_id} = ${customer_customer.id} ;;
    fields: [order_order.attempted_orders, order_order.Average_Order_Value, order_order.average_sub_total, order_order.cancelled_date,order_order.cancelled_month,order_order.cancelled_time,
      order_order.completed_orders, order_order.completed_orders_revenue,order_order.order_processing, order_order.id, order_order.merchant_id, order_order.customer_id,
      order_order.sub_total, order_order.created_date, order_order.created_month, order_order.created_time, order_order.place_date, order_order.place_month,
      order_order.place_time, order_order.status, order_order.rejected_message, order_order.rejected_orders, order_order.rejected_reason, order_order.Rejected_Reason_Code, order_order.attempted_orders,
      order_order.order_revenue, order_order.skipped_orders, order_order.skipped_orders_revenue, order_order.Max_Order_Date, order_order.Max_Completed__Order_Date, order_order.Order_Status_Name
      ]
    relationship: one_to_many
  }

  join: order_item {
    type: left_outer
    sql_on: ${order_item.order_id} = ${order_order.id} ;;
    fields: [order_item.offer_id, order_item.id, order_item.one_time, order_item.price, order_item.product_id, order_item.quantity, order_item.subscription_id,
      order_item.total_price, order_item.count, order_item.total_gmv, order_item.average_item_value, order_item.Total_Quantity, order_item.Pending_Revenue, order_item.Average_Quantity, order_item.Program,
      order_item.distinct_orders, order_item.order_id]
    relationship: one_to_many
  }

  join: subscription_product  {
    from: product_product
    type: left_outer
    sql_on: ${subscription_product.id} = ${subscription_subscription.product_id} ;;
  }

  join: merchant_merchant {
    sql_on: ${merchant_merchant.id} = ${customer_customer.merchant_id} ;;
    relationship: many_to_one
  }

  join: industry_info {
    sql_on: ${merchant_merchant.id} = ${industry_info.merchant_id} ;;
    relationship: one_to_many
  }

  }

  explore: oos_event_log {
   from: oos_event_log
    label: "4) Event Log - Order Item"
    persist_for: "60 minutes"
    join: customer_customer {
    sql_on: ${oos_event_log.customer_id} = ${customer_customer.id} ;;
    relationship: many_to_one
    fields: [customer_customer.count, customer_customer.created_date, customer_customer.created_month, customer_customer.created_year, customer_customer.id, customer_customer.live, customer_customer.merchant_id,
      customer_customer.merchant_user_id]
        }
      access_filter: {field:customer_customer.merchant_id
        user_attribute:merchant_id}

    join: order_item {
      sql_on: ${oos_event_log.object_id} = ${order_item.id} ;;
      relationship: many_to_one
    }
    join: subscription_subscription {
      sql_on: ${order_item.subscription_id} = ${subscription_subscription.id} ;;
      relationship: many_to_one
    }

    join: order_order {
      sql_on: ${order_order.id} = ${order_item.order_id};;
      relationship: many_to_one
      fields: [order_order.id, order_order.cancelled_date, order_order.cancelled_month, order_order.cancelled_time, order_order.cancelled_year, order_order.created_date,
        order_order.created_month, order_order.created_time, order_order.created_year, order_order.customer_id, order_order.merchant_id, order_order.place_date, order_order.place_month,order_order.place_year, order_order.place_week,
        order_order.place_time, order_order.rejected_message, order_order.shipping_address_id, order_order.status, order_order.Order_Status_Name, order_order.sub_total, order_order.Average_Order_Value,
        order_order.average_sub_total, order_order.rejected_reason, order_order.completed_orders, order_order.completed_orders_revenue, order_order.attempted_orders, order_order.Contains_IU, order_order.clean_order_place,
        order_order.order_revenue, order_order.skipped_orders, order_order.skipped_orders_revenue, order_order.order_processing, order_order.distinct_order_items, order_order.days, order_order.rejected_orders,
        order_order.Max_Order_Date, order_order.Max_Completed__Order_Date, order_order.Order_Status_Name, order_order.BOPUS_Order, order_order.VSI_Email_BOPUS, order_order.Distinct_Customers]
    }
    join: customer_facts {
      sql_on: ${oos_event_log.customer_id} = ${customer_facts.customer_id} ;;
      relationship: many_to_one
    }
    join: order_offer {
      from: offer_offer
      sql_on: ${order_offer.id} = ${order_item.offer_id}  ;;
      relationship: one_to_many
    }
    join: subscription_offer {
      from: offer_offer
      sql_on: ${subscription_offer.id} = ${subscription_subscription.offer_id};;
      relationship: one_to_many
    }
    join: product_product {
      sql_on: ${product_product.id} = ${subscription_subscription.product_id} ;;
      relationship: one_to_many
    }

    join: OOS_Flow_Product_Feed {
      from: product_product
      sql_on: ${oos_event_log.external_product_id} = ${OOS_Flow_Product_Feed.external_product_id}  ;;
    }
    join: order_placementfailure {
      sql_on: ${order_order.public_id} = ${order_placementfailure.order_public_id} ;;
      relationship: one_to_one
    }

    join: customer_address {
      sql_on: ${customer_address.customer_id} = ${order_order.customer_id} ;;
      relationship: many_to_one
    }

    join: vsi_email_bopus {
      sql_on: ${vsi_email_bopus.order_id} = ${order_order.id} ;;
      relationship: many_to_one
    }

    join: merchant_merchant {
      sql_on: ${merchant_merchant.id} = ${customer_customer.merchant_id} ;;
      relationship: many_to_one
    }

    join: industry_info {
      sql_on: ${merchant_merchant.id} = ${industry_info.merchant_id} ;;
      relationship: one_to_many
    }
  }

  explore: subscription_event_log {
    from: subscription_event_log
    label: "5) Event Log - Subscription"
    join: customer_customer {
      sql_on: ${subscription_event_log.customer_id} = ${customer_customer.id};;
      relationship: many_to_one
      fields: [customer_customer.count, customer_customer.created_date, customer_customer.created_month, customer_customer.created_year, customer_customer.id, customer_customer.live, customer_customer.merchant_id,
        customer_customer.merchant_user_id]
    }
    access_filter: {field:customer_customer.merchant_id
      user_attribute:merchant_id}

    join: subscription_subscription {
      sql_on: ${subscription_subscription.id} = ${subscription_event_log.object_id} ;;
      relationship: many_to_one
    }

    join: order_item {
      sql_on: ${order_item.subscription_id} = ${subscription_subscription.id} ;;
      relationship: one_to_many
    }

    join: order_order {
      sql_on: ${order_order.id} = ${order_item.order_id} ;;
      relationship: many_to_one
      fields: [order_order.id, order_order.cancelled_date, order_order.cancelled_month, order_order.cancelled_time, order_order.cancelled_year, order_order.created_date,
        order_order.created_month, order_order.created_time, order_order.created_year, order_order.customer_id, order_order.merchant_id, order_order.place_date, order_order.place_month,order_order.place_year,
        order_order.place_time, order_order.rejected_message, order_order.shipping_address_id, order_order.status, order_order.Order_Status_Name, order_order.sub_total, order_order.Average_Order_Value,
        order_order.average_sub_total, order_order.rejected_reason, order_order.completed_orders, order_order.completed_orders_revenue, order_order.attempted_orders, order_order.Contains_IU, order_order.clean_order_place,
        order_order.order_revenue, order_order.skipped_orders, order_order.skipped_orders_revenue, order_order.order_processing, order_order.distinct_order_items, order_order.days, order_order.rejected_orders,
        order_order.Max_Order_Date, order_order.Max_Completed__Order_Date, order_order.Order_Status_Name, order_order.BOPUS_Order, order_order.VSI_Email_BOPUS, order_order.Distinct_Customers]
    }

    join: product_product {
      sql_on: ${product_product.id} = ${subscription_subscription.product_id} ;;
      relationship: many_to_one
      fields: [product_product.autoship_enabled, product_product.autoship_by_default, product_product.discontinued, product_product.external_product_id, product_product.id,
        product_product.live, product_product.merchant_id, product_product.name, product_product.price, product_product.sku, product_product.subscription_eligible]
    }

    join: customer_facts {
      sql_on: ${customer_customer.id} = ${customer_facts.customer_id} ;;
      relationship: one_to_one
    }

    join: order_offer {
      from: offer_offer
      sql_on: ${order_offer.id} = ${order_item.offer_id}  ;;
      relationship: one_to_many
    }
    join: subscription_offer {
      from: offer_offer
      sql_on: ${subscription_offer.id} = ${subscription_subscription.offer_id};;
      relationship: one_to_many
    }

    join: order_placementfailure {
      sql_on: ${order_order.public_id} = ${order_placementfailure.order_public_id} ;;
      relationship: one_to_one
    }

    join: From_SKU_Swap_Product {
      view_label: "From SKU Swap"
      from: product_product
      sql_on: ${From_SKU_Swap_Product.id} = ${subscription_event_log.from_sku} ;;
      fields: [From_SKU_Swap_Product.external_product_id, From_SKU_Swap_Product.id, From_SKU_Swap_Product.autoship_enabled, From_SKU_Swap_Product.autoship_by_default, From_SKU_Swap_Product.discontinued, From_SKU_Swap_Product.name,
        From_SKU_Swap_Product.merchant_id, From_SKU_Swap_Product.price, From_SKU_Swap_Product.sku, From_SKU_Swap_Product.subscription_eligible]
      relationship: many_to_one
    }

    join: To_SKU_Swap_Product {
      view_label: "To SKU Swap"
      from: product_product
      sql_on: ${To_SKU_Swap_Product.id} = ${subscription_event_log.to_sku} ;;
      fields: [To_SKU_Swap_Product.external_product_id, To_SKU_Swap_Product.id, To_SKU_Swap_Product.autoship_enabled, To_SKU_Swap_Product.autoship_by_default, To_SKU_Swap_Product.discontinued, To_SKU_Swap_Product.name,
        To_SKU_Swap_Product.merchant_id, To_SKU_Swap_Product.price, To_SKU_Swap_Product.sku, To_SKU_Swap_Product.subscription_eligible]
      relationship: many_to_one
    }

    join: customer_address {
      sql_on: ${customer_address.customer_id} = ${order_order.customer_id} ;;
      relationship: many_to_one
    }

    join: vsi_email_bopus {
      sql_on: ${vsi_email_bopus.order_id} = ${order_order.id} ;;
      relationship: many_to_one
    }

    join: From_SKU_Silent_Swap {
      view_label: "From SKU Silent Swap"
      from: product_product
      sql_on: ${From_SKU_Silent_Swap.sku} = ${subscription_event_log.silent_sub_swap_sku_from} ;;
      fields: [From_SKU_Silent_Swap.external_product_id, From_SKU_Silent_Swap.id, From_SKU_Silent_Swap.autoship_enabled, From_SKU_Silent_Swap.autoship_by_default, From_SKU_Silent_Swap.discontinued, From_SKU_Silent_Swap.name,
        From_SKU_Silent_Swap.merchant_id, From_SKU_Silent_Swap.price, From_SKU_Silent_Swap.sku, From_SKU_Silent_Swap.subscription_eligible]
      relationship: many_to_one
    }

    join: To_SKU_Silent_Swap {
      view_label: "To SKU Silent Swap"
      from: product_product
      sql_on: ${To_SKU_Silent_Swap.sku} = ${subscription_event_log.silent_sub_swap_sku_to} ;;
      fields: [To_SKU_Silent_Swap.external_product_id, To_SKU_Silent_Swap.id, To_SKU_Silent_Swap.autoship_enabled, To_SKU_Silent_Swap.autoship_by_default, To_SKU_Silent_Swap.discontinued, To_SKU_Silent_Swap.name,
        To_SKU_Silent_Swap.merchant_id, To_SKU_Silent_Swap.price, To_SKU_Silent_Swap.sku, To_SKU_Silent_Swap.subscription_eligible]
      relationship: many_to_one
    }

    join: subscription_order {
      view_label: "Subscription Orders Data"
      sql_on: ${subscription_order.subscription_id} = ${subscription_subscription.id} ;;
      relationship: one_to_one
    }
    }

  explore: order_event_log {
    from:  order_event_log
    label: "6) Event Log - Order"
    join: customer_customer {
      sql_on: ${order_event_log.customer_id} = ${customer_customer.id} ;;
      relationship: many_to_one
      fields: [customer_customer.count, customer_customer.created_date, customer_customer.created_month, customer_customer.created_year, customer_customer.id, customer_customer.live, customer_customer.merchant_id,
        customer_customer.merchant_user_id]
    }
    access_filter: {field:customer_customer.merchant_id
      user_attribute:merchant_id}

    join: order_order {
      sql_on: ${order_order.id} = case when ${order_event_log.type_id} in (2,
3,
4,
6,
21,
22,
24,
25,
27,
28,
38,
42,
44,
56,
57,
58,
59,
74,
75,
76,
78,80) then ${order_event_log.object_id} else null end;;
      relationship: many_to_one
      fields: [order_order.id, order_order.cancelled_date, order_order.cancelled_month, order_order.cancelled_time, order_order.cancelled_year, order_order.created_date,
        order_order.created_month, order_order.created_time, order_order.created_year, order_order.customer_id, order_order.merchant_id, order_order.place_date, order_order.place_month,order_order.place_year,
        order_order.place_time, order_order.rejected_message, order_order.shipping_address_id, order_order.status, order_order.Order_Status_Name, order_order.sub_total, order_order.Average_Order_Value,
        order_order.average_sub_total, order_order.rejected_reason, order_order.completed_orders, order_order.completed_orders_revenue, order_order.attempted_orders, order_order.Contains_IU, order_order.clean_order_place,
        order_order.order_revenue, order_order.skipped_orders, order_order.skipped_orders_revenue, order_order.order_processing, order_order.distinct_order_items, order_order.days, order_order.rejected_orders,
        order_order.Max_Order_Date, order_order.Max_Completed__Order_Date, order_order.Order_Status_Name, order_order.BOPUS_Order, order_order.VSI_Email_BOPUS, order_order.Distinct_Customers, order_order.order_merchant_id, order_order.public_id,
        order_order.Order_Status_Name]
    }

    join: order_item_object {
      from: order_item
      sql_on: ${order_item_object.id} = case when ${order_event_log.type_id} in (23,31,32,33,49,50,72,77,87,89,93) then ${order_event_log.object_id} else null end ;;
      fields: [order_item_object.id, order_item_object.order_id, order_item_object.subscription_id, order_item_object.product_id, order_item_object.quantity,
        order_item_object.price, order_item_object.total_price, order_item_object.offer_id, order_item_object.price]
    }

    join: order_order_item {
      from: order_order
      sql_on: order_order_item.id= ${order_item_object.order_id} ;;
      fields: [order_order_item.id, order_order_item.merchant_id, order_order_item.customer_id, order_order_item.sub_total, order_order_item.created_date,
        order_order_item.place_date, order_order_item.cancelled_date, order_order_item.status, order_order_item.order_merchant_id, order_order_item.rejected_message,
        order_order_item.public_id]
    }

    join: product_product_item {
      from: product_product
      sql_on: ${product_product_item.id} = ${order_item_object.product_id} ;;
      relationship: many_to_one
    }

    join: sub_sub_item {
      from: subscription_subscription
      sql_on: ${order_item_object.subscription_id} = ${sub_sub_item.id} ;;
      relationship: many_to_one
    }

    join: prod_prod_sub_item {
      from: product_product
      sql_on: ${sub_sub_item.product_id} = ${prod_prod_sub_item.id} ;;
      relationship: many_to_one
    }

    join: order_item {
      sql_on: ${order_item.order_id} = ${order_order.id} ;;
      relationship: one_to_many
    }

    join: customer_facts {
      sql_on: ${customer_customer.id} = ${customer_facts.customer_id} ;;
      relationship: one_to_one
    }

    join: order_offer {
      from: offer_offer
      sql_on: ${order_offer.id} = ${order_item.offer_id}  ;;
      relationship: one_to_many
    }

    join: subscription_subscription {
      sql_on: ${subscription_subscription.id} = ${order_item.subscription_id} ;;
      relationship: many_to_one
    }

    join: prod_prod_sub_order {
      from: product_product
      sql_on: ${prod_prod_sub_order.id} = ${subscription_subscription.product_id} ;;
      relationship: many_to_one
    }

    join: subscription_offer {
      from: offer_offer
      sql_on: ${subscription_offer.id} = ${subscription_subscription.offer_id};;
      relationship: one_to_many
    }

    join: order_placementfailure {
      sql_on: ${order_order.public_id} = ${order_placementfailure.order_public_id} ;;
      relationship: one_to_one
    }

    join: product_product {
      sql_on: ${product_product.id} = ${order_item.product_id} ;;
      relationship: many_to_one
    }

    join: customer_address {
      sql_on: ${customer_address.id} =  ${order_order.shipping_address_id} ;;
      relationship: many_to_one
      sql_where: ${customer_address.store_public_id} is not null ;;
    }

    join: sms_mgmt_enrolled {
      type: left_outer
      sql_on: ${sms_mgmt_enrolled.merchant_user_id_test} = ${customer_customer.merchant_user_id} ;;
      relationship: one_to_one
    }

    join: vsi_email_bopus {
      sql_on: ${vsi_email_bopus.order_id} = ${order_order.id} ;;
      relationship: many_to_one
    }

    join: merchant_merchant {
      sql_on: ${customer_customer.merchant_id}= ${merchant_merchant.id} ;;
    }

    join: merchant_merchant_industries {
      sql_on: ${merchant_merchant_industries.merchant_id} = ${merchant_merchant.id} ;;
    }

    join: merchant_industry {
      sql_on: ${merchant_industry.id} = ${merchant_merchant_industries.industry_id} ;;
    }

    join: industry_info {
      sql_on: ${merchant_merchant.id} = ${industry_info.merchant_id} ;;
      relationship: one_to_many
    }
  }

  explore: product_product {
    label: "7) Product Feed"
    join: merchant_merchant {
      sql_on: ${merchant_merchant.id} = ${product_product.merchant_id} ;;
      relationship: many_to_one
    }

    join: product_product_categories {
      view_label: "Category"
      sql_on: ${product_product.id} = ${product_product_categories.product_id} ;;
      relationship: one_to_many
    }

    join: product_category {
      view_label: "Category"
      sql_on: ${product_product_categories.category_id} = ${product_category.id} ;;
      relationship: many_to_one
    }

    join: order_item {
      sql_on: ${order_item.product_id} = ${product_product.id} ;;
      fields: [order_item.id, order_item.offer_id, order_item.one_time, order_item.order_id, order_item.price, order_item.product_id, order_item.quantity, order_item.subscription_id
        , order_item.total_price, order_item.count, order_item.is_IU, order_item.total_IU_recurring_price, order_item.total_IU_onetime_price, order_item.total_recurring_price,
        order_item.total_gmv, order_item.sum_IU_onetime_quantity, order_item.sum_IU_Recurring_quantity, order_item.IU_One_Time, order_item.IU_Recurring, order_item.IU_Either, order_item.count,
        order_item.quickbuy_item, order_item.sms_item]
      relationship: one_to_many
    }

    join: order_order {
      sql_on: ${order_item.order_id} = ${order_order.id} ;;
      fields: [order_order.customer_id, order_order.merchant_id, order_order.place_date, order_order.place_month, order_order.status, order_order.sub_total,
        order_order.count, order_order.average_sub_total, order_order.rejected_reason, order_order.completed_orders]
      relationship: many_to_one
    }

    join: subscription_subscription {
      view_label: "Subscription"
      sql_on: ${order_item.subscription_id} = ${subscription_subscription.id} ;;
      fields: [subscription_subscription.id, subscription_subscription.customer_id, subscription_subscription.live, subscription_subscription.merchant_id,
        subscription_subscription.offer_id, subscription_subscription.subscription_type, ]
      relationship: many_to_one

    }

    join: subscription_offer {
      view_label: "Subscription"
      from: offer_offer
      sql_on: ${subscription_offer.id} = ${subscription_subscription.offer_id};;
      relationship: one_to_many
    }

    join: order_offer {
      view_label: "Order Item"
      from: offer_offer
      sql_on: ${order_offer.id} = ${order_item.offer_id}  ;;
      relationship: one_to_many

    }

    join: order_item_log {
      sql_on: ${product_product.id} = ${order_item_log.product_id} ;;
      relationship: one_to_many
    }

    join: vsi_iu_log {
      sql_on: ${vsi_iu_log.key} = ${order_item_log.vsi_iu_key} ;;
    }

    join: merchant_merchant_industries {
      sql_on: ${merchant_merchant_industries.merchant_id} = ${merchant_merchant.id} ;;
    }

    join: merchant_industry {
      sql_on: ${merchant_industry.id} = ${merchant_merchant_industries.industry_id} ;;
    }

    join: industry_info {
      sql_on: ${merchant_merchant.id} = ${industry_info.merchant_id} ;;
      relationship: one_to_many
    }

    join: harvest_merchant_mapping {
      type: left_outer
      sql_on: ${harvest_merchant_mapping.merchant_id} = ${product_product.merchant_id} ;;
      relationship: many_to_one
    }
  }

  explore: vsi_fraud {
    hidden: yes
  }

  explore:  log_conversationlog {
    label: "9) Conversation Log"
  }

  explore: order_reminder_cancels {
    label: "Order Reminder Cancels"
    hidden: yes
  }

  explore: order_export {
  from: order_order
  label: "Order Export"
  fields: [order_export.id, order_export.merchant_id, order_export.customer_id, order_export.sub_total, order_export.created_date, order_export.created_month, order_export.created_time, order_export.place_date, order_export.place_month, order_export.place_year, order_export.cancelled_date, order_export.cancelled_month, order_export.cancelled_year, order_export.status,
    order_export.Order_Status_Name,
    order_export.order_merchant_id, order_export.rejected_message, order_export.rejected_reason, order_export.Rejected_Reason_Code, order_item.id, order_item.product_id]
  join: order_item {
    type: left_outer
    sql_on: ${order_item.order_id} = ${order_export.id} ;;
  }
}

  explore: gmv_weekly {
    label: "Client Forecast"

    join: order_order {
      type: left_outer
      sql_on: ${gmv_weekly.merchant_id} = ${order_order.merchant_id} ;;
      fields: [order_order.id, order_order.merchant_id, order_order.customer_id, order_order.sub_total, order_order.created_date, order_order.place_date, order_order.place_month, order_order.place_year, order_order.cancelled_date,
        order_order.cancelled_month, order_order.cancelled_year, order_order.status, order_order.rejected_message, order_order.completed_orders_revenue]
    }

    join: subscription_log {
      type: left_outer
      sql_on: ${gmv_weekly.merchant_id} = ${subscription_log.merchant_id} ;;
      fields: [subscription_log.id, subscription_log.merchant_id, subscription_log.customer_id, subscription_log.subscription_id, subscription_log.subscription_type,
        subscription_log.product_id, subscription_log.quantity, subscription_log.price, subscription_log.offer_id, subscription_log.offer_profile_id,
        subscription_log.frequency_days, subscription_log.logged_date, subscription_log.logged_month, subscription_log.logged_year, subscription_log.event_id]
    }

    join: order_item {
      type: left_outer
      sql_on: ${order_item.order_id} = ${order_order.id} ;;
      fields: [order_item.id, order_item.order_id, order_item.subscription_id, order_item.product_id, order_item.quantity, order_item.price, order_item.total_price, order_item.offer_id]
    }
  }

  explore: article_stats {
    hidden: yes
  }

  explore: appcues_data {
  }
  explore:  temp_churn_performance_data {
    hidden: yes
  }

  explore:  product_combination{}

explore: industry_info{
  hidden: yes
}

explore: zendesk_tickets {
  join: zendesk_organizations {
    type: left_outer
    sql_on: ${zendesk_organizations.id} = ${zendesk_tickets.organization_id} ;;
    relationship: many_to_one
  }

  join: zendesk_groups {
    type: left_outer
    sql_on: ${zendesk_groups.id} = ${zendesk_tickets.group_id} ;;
    relationship: many_to_one
  }

  join: zendesk_ticket_metrics {
    type: left_outer
    sql_on: ${zendesk_ticket_metrics.ticket_id} = ${zendesk_tickets.id} ;;
    relationship: many_to_one
  }

  join: requester {
    from: zendesk_users
    sql_on: ${requester.id} = ${zendesk_tickets.requester_id} ;;
  }

  join: requester_organization {
    from: zendesk_organizations
    view_label: "Requester"
    sql_on: ${requester_organization.id} = ${requester.organization_id} ;;
    fields: [requester_organization.id, requester_organization.name]
    relationship: many_to_one
  }

  join: zendesk_ticket_custom_fields {
   type: left_outer
  sql_on: ${zendesk_ticket_custom_fields.Ticket_ID} = ${zendesk_tickets.id} ;;
  }

  join: zendesk_ticket_mapping {
    type: left_outer
    sql_on: ${zendesk_ticket_custom_fields.Merchant} = ${zendesk_ticket_mapping.zendesk_name} ;;
  }

  join: harvest_merchant_mapping {
    type: left_outer
    sql_on: ${harvest_merchant_mapping.merchant_id} = ${zendesk_ticket_mapping.merchant_id} ;;
  }

  join: account {
    type: left_outer
    sql_on: ${account.merchant_id__c} = ${zendesk_ticket_mapping.merchant_id};;
  }

  join: partner_account__c {
    sql_on: ${account.ecommerce_platform2__c} = ${partner_account__c.id} ;;
  }

  join: zendesk_ticket_comments {
    view_label: "Ticket Comments"
    type: left_outer
    sql_on: ${zendesk_ticket_comments.ticket_id} = ${zendesk_tickets.id} ;;
  }

  join: zendesk_users {
    view_label: "Ticket Comments"
    type: left_outer
    sql_on: ${zendesk_users.id} = ${zendesk_ticket_comments.author_id} ;;
    fields: [zendesk_users.id]
  }

  join: group_memberships {
    view_label: "Ticket Comments"
    type: left_outer
    sql_on: ${zendesk_users.id} = ${group_memberships.user_id} ;;
    fields: [group_memberships.user_id, group_memberships.group_id]
  }

  join: Commentor_Group {
    from: zendesk_groups
    view_label: "Ticket Comments"
    type: left_outer
    sql_on: ${Commentor_Group.id} = ${group_memberships.group_id} ;;
    fields: [Commentor_Group.id, Commentor_Group.name]
  }
}

  explore: merchant_merchant{
    hidden: yes
    join: merchant_merchant_industries {
      sql_on: ${merchant_merchant_industries.merchant_id} = ${merchant_merchant.id} ;;
    }

    join: merchant_industry {
      sql_on: ${merchant_industry.id} = ${merchant_merchant_industries.industry_id} ;;
    }

    join: harvest_merchant_mapping {
      type: left_outer
      sql_on: ${harvest_merchant_mapping.merchant_id} = ${merchant_merchant.id} ;;
      relationship: many_to_one
  }
  }

explore: account {
  persist_with: daily_refresh
  label: "Salesforce"

  join: opportunity {
    sql_on: ${account.id} = ${opportunity.accountid} ;;
  }

  join: opportunity_record_type {
    from: record_type
    sql_on: ${opportunity.recordtypeid} = ${opportunity_record_type.id} ;;
  }

  join: deal_committee__c {
    type: inner
    sql_on: case when ${deal_committee__c.opportunity_name__c} is not null then ${opportunity.id} else ${account.id} end = case when ${deal_committee__c.opportunity_name__c} is not null then ${deal_committee__c.opportunity_name__c} else ${deal_committee__c.account_name__c} end  ;;
  }

  join: deal_committee_lookup {
    from: opportunity
    sql_on: ${deal_committee__c.opportunity_name__c} =  ${deal_committee_lookup.id};;
    fields: [name]
  }

  join: partner_account__c {
    sql_on: ${account.ecommerce_platform2__c} = ${partner_account__c.id} ;;
  }

  join: parent_account {
    from: account
    sql_on: ${account.parentid} = ${parent_account.id};;
    fields: [parent_account.name]
  }

  join: user {
    view_label: "Primary Success Owner"
    sql_on: ${user.id} = ${account.primary_success_owner__c} ;;
  }

  join: custom_packages_sf {
  ###need to wait on prod in order to have derived tables
    view_label: "Custom Packages - Account"
    sql_on: ${custom_packages_sf.merchant_id__c} =  ${account.merchant_id__c} ;;
    relationship: one_to_many
  }

  join: custom_packages_sf_deal_committee {
    view_label: "Review Items - Deal Committee"
    sql_on: ${deal_committee__c.id} =  ${custom_packages_sf_deal_committee.id} ;;
    relationship: one_to_many
  }

  join: harvest_clients {
    type: inner
    sql_on: case when REGEXP_CONTAINS(${harvest_clients.name}, "-") is TRUE then ${harvest_clients.merchant_id} = ${account.merchant_id__c} else
    ${harvest_clients.name} = ${account.name} end;;
    relationship: one_to_one
  }

  join: harvest_time_entries {
    type: left_outer
    sql_on: ${harvest_time_entries.client_id} = ${harvest_clients.id};;
    relationship: one_to_many
  }

  join: harvest_merchant_mapping {
    type: left_outer
    sql_on: case when REGEXP_CONTAINS(name, "-") is TRUE then ${harvest_clients.merchant_id} = ${harvest_merchant_mapping.merchant_id} else
    ${harvest_clients.name} = ${harvest_merchant_mapping.account} end;;
  }

  join: harvest_tasks {
    type: left_outer
    sql_on: ${harvest_tasks.id} = ${harvest_time_entries.task_id} ;;
  }

  join: harvest_users {
    type: left_outer
    sql_on: ${harvest_users.id} = ${harvest_time_entries.user_id} ;;
    relationship: many_to_one
  }

  join: harvest_user_roles {
    view_label: "Harvest Roles"
    type: left_outer
    sql_on: ${harvest_user_roles.user_id} = ${harvest_users.id} ;;
  }

  join: harvest_roles {
    type: left_outer
    sql_on: ${harvest_roles.id} = ${harvest_user_roles.role_id} ;;
  }

  join: harvest_projects {
    type: left_outer
    sql_on: ${harvest_projects.id} = ${harvest_time_entries.project_id} ;;
    relationship: many_to_one
  }

  join: account_custom_packages_pairs {
      sql_on: ${account_custom_packages_pairs.merchant_id} = ${account.merchant_id__c} ;;
    relationship: one_to_many
  }

  join: account_add_ons_pairs {
    sql_on: ${account_add_ons_pairs.id} = ${account.id} ;;
    relationship: one_to_many
  }

  join: account_add_ons {
    sql_on: ${account_add_ons.id} = ${account.id} ;;
    relationship: one_to_many
  }

  join: merchant_merchant {
    sql_on: ${merchant_merchant.id} = ${account.merchant_id__c} ;;
  }

  join: client_status_tracker__c {
    sql_on: ${account.id} = ${client_status_tracker__c.account__c} ;;
  }

  join: opportunity_field_history {
    sql_on: ${opportunity.id} = ${opportunity_field_history.opportunityid} ;;
    relationship: one_to_many
  }

  join: external_source_merchant_mapping {
    sql_on: ${account.merchant_id__c} = ${external_source_merchant_mapping.merchant_id} ;;
  }

  join: csd_tickets {
    sql_on: ${external_source_merchant_mapping.csd_name} = ${csd_tickets.project_name} ;;
  }

  join: jira_ticket {
    sql_on: ${external_source_merchant_mapping.csd_name} = ${jira_ticket.Project_Name} ;;
  }

  # join: contact {
  #   sql_on: ${account.id} = ${contact.accountid} ;;
  # }

  # join: campaign_member {
  #   sql_on: ${contact.id} = ${campaign_member.id} ;;
  # }

  # join: lead {
  #   sql_on: ${lead.id} = ${campaign_member.leadid} ;;
  # }

  join: downsell_record__c {
    sql_on: ${downsell_record__c.account__c} = ${account.id} ;;
  }

  # join: opportunity_downsell {
  #   from: downsell_record__c
  #   type: full_outer
  #   sql_on: ${opportunity.closedate_date} = ${downsell_record__c.downsell_date__c_date} ;;
  # }

  join: historical_information_google_sheet_connected {
    type:full_outer
    relationship: many_to_one
    sql_on: DATE_TRUNC(date(${opportunity.closedate_date}), month) = ${historical_information_google_sheet_connected.date_date} ;;
  }
}

explore: ltv_predict_164_to_delete {}

explore: opportunity_downsell_aggregations {
  join: account {
    type: left_outer
    relationship: many_to_one
    sql: ${account.id} = ${opportunity_downsell_aggregations.custom_id} ;;
  }
}

explore: Salesforce_leads {
  from: lead

  join: historical_information_google_sheet_connected {
    type:full_outer
    relationship: many_to_one
    sql_on: ${Salesforce_leads.dynamic_timeframe} = ${historical_information_google_sheet_connected.dynamic_created_timeframe};;
  }
}

explore:   historical_information_google_sheet_connected {
}

explore: illy_program_subscribers {
  label: "illy Programs Subscribers"
  view_label: "illy Programs Subscribers"
  hidden: yes
}

explore: kind_susbcription_bundle {
  hidden: yes
}

explore: shopify_competitor_info {}

explore: email_daily_summary {
  }

  explore: illy_us_capsule_subscribers {
    hidden: yes
  }
