connection: "production_bq"

include: "*.view.lkml"                       # include all views in this project
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

datagroup: daily_refresh {
  sql_trigger: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24)) ;;
  max_cache_age: "24 hours"
}
persist_for: "24 hours"

explore: subscription_log {  access_filter: {field:merchant_id
    user_attribute:merchant_id}
    persist_with: daily_refresh

    join: product_product {
      sql_on: ${subscription_log.product_id} = ${product_product.id} ;;
      relationship: many_to_one
    }

    join: lovelyskin_brands {
      sql_on: ${lovelyskin_brands.sku} = ${product_product.sku} ;;
      relationship: one_to_one
    }

    join: customer_customer {
      sql_on: ${customer_customer.id} = ${subscription_log.customer_id} ;;
      relationship: many_to_one
      fields: [customer_customer.id, customer_customer.merchant_id, customer_customer.merchant_id, customer_customer.live, customer_customer.created_date, customer_customer.created_month,
        customer_customer.created_week, customer_customer.price_code, customer_customer.merchant_user_id]
    }

    join: merchant_merchant {
      sql_on: ${merchant_merchant.id} = ${subscription_log.merchant_id} ;;
      relationship: many_to_one
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

    join: subscription_subscription {
      sql_on: ${subscription_log.subscription_id} = ${subscription_subscription.id} ;;
      relationship: many_to_one
      fields: [subscription_subscription.id, subscription_subscription.customer_id, subscription_subscription.merchant_id, subscription_subscription.product_id, subscription_subscription.quantity, subscription_subscription.frequency_days,
        subscription_subscription.cancel_reason, subscription_subscription.cancelled_date, subscription_subscription.cancelled_month, subscription_subscription.offer_id, subscription_subscription.created_date, subscription_subscription.created_month,
        subscription_subscription.live, subscription_subscription.subscription_type,subscription_subscription.is_min_created, subscription_subscription.Lifetime, subscription_subscription.extra_data, subscription_subscription.store_id, subscription_subscription.In_Store,
        subscription_subscription.public_id,subscription_subscription.Program]
    }

    join: customer_facts {
      type: left_outer
      sql_on: ${customer_customer.id} = ${customer_facts.customer_id} ;;
      relationship: one_to_one
      fields: [customer_facts.Cancelled_date, customer_facts.Cancelled_month, customer_facts.customer_creation_count, customer_facts.customer_id,
        customer_facts.Customer_Live, customer_facts.created_date, customer_facts.created_month, customer_facts.merchant_id]
    }

    join: acv_tiers {
      type: left_outer
      sql_on: ${acv_tiers.merchant_id} = ${subscription_log.merchant_id} ;;
      relationship: many_to_one
    }

    join: tracking_event {
      type: left_outer
      sql_on: ${subscription_log.event_id} = ${tracking_event.id} ;;
      relationship: many_to_one
    }

    join: harvest_merchant_mapping {
      type: left_outer
      sql_on: ${subscription_log.merchant_id} = ${harvest_merchant_mapping.merchant_id} ;;
      relationship: many_to_one
    }
}

explore: customer_experience_log {  access_filter: {field:merchant_id
    user_attribute:merchant_id}
  label: "Customer Experience Log"
  view_label: "Customer Experience Log"
    persist_with: daily_refresh

   join: enrolled_customer_experience_log {
      relationship: many_to_one
      view_label: "Customer Experience Log"
      sql_on: ${customer_experience_log.merchant_user_id} = ${enrolled_customer_experience_log.merchant_user_id_test};;
}
  join: sms_mgmt_enrolled {
    relationship: many_to_one
    view_label: "Customer Experience Log"
    sql_on: ${customer_experience_log.merchant_user_id} = ${sms_mgmt_enrolled.merchant_user_id_test} ;;
  }

  join: customer_customer {
    relationship: many_to_one
    sql_on: ${customer_experience_log.merchant_user_id} = ${customer_customer.merchant_user_id} ;;
    fields: [customer_customer.id, customer_customer.created_date, customer_customer.created_month, customer_customer.created_time, customer_customer.created_week, customer_customer.created_year, customer_customer.live,
      customer_customer.merchant_id, customer_customer.merchant_user_id ]
  }

  join: order_order {
    relationship: one_to_many
    sql_on: ${customer_customer.id} = ${order_order.customer_id} ;;
    fields: [order_order.id, order_order.cancelled_date, order_order.cancelled_month, order_order.customer_id, order_order.merchant_id,
      order_order.place_month, order_order.place_date, order_order.rejected_message, order_order.status, order_order.sub_total, order_order.rejected_reason, order_order.completed_orders,
      order_order.completed_orders_revenue, order_order.skipped_orders_revenue, order_order.order_revenue, order_order.skipped_orders, order_order.order_processing, order_order.Average_Order_Value, order_order.Order_Status_Name, order_order.count]
  }

  join: order_item_log {
    relationship: one_to_many
    sql_on: ${customer_customer.id} = ${order_item_log.customer_id} ;;
  }

  join: order_item {
    relationship: one_to_many
    sql_on: ${order_order.id} = ${order_item.order_id} ;;
    fields: [order_item.id, order_item.order_id, order_item.subscription_id, order_item.product_id, order_item.quantity, order_item.price, order_item.total_price, order_item.offer_id, order_item.count]
  }

  join: product_product {
    relationship: many_to_one
    sql_on: ${order_item.product_id} = ${product_product.id} ;;
    fields: [product_product.autoship_enabled, product_product.discontinued, product_product.external_product_id, product_product.autoship_by_default, product_product.id,
      product_product.merchant_id, product_product.name, product_product.price, product_product.subscription_eligible, product_product.sku]
  }

  join: IU_Add_Product_Feed {
    from: product_product
    sql_on: ${order_item_log.product_id} = ${IU_Add_Product_Feed.id} ;;
    fields: [IU_Add_Product_Feed.discontinued, IU_Add_Product_Feed.external_product_id, IU_Add_Product_Feed.autoship_by_default, IU_Add_Product_Feed.autoship_enabled,
      IU_Add_Product_Feed.id, IU_Add_Product_Feed.merchant_id, IU_Add_Product_Feed.name, IU_Add_Product_Feed.price, IU_Add_Product_Feed.subscription_eligible, IU_Add_Product_Feed.sku]
    relationship: many_to_one
  }

  join: customer_facts {
    sql_on: ${customer_customer.id} = ${customer_facts.customer_id} ;;
    relationship: one_to_one
  }
}

explore: ds_reorder_outcomes_log {  access_filter: {field:merchant_id
    user_attribute:merchant_id}
    label: "Reorder Outcomes Log"
    persist_with: daily_refresh
    join: ds_reorder_streaming_decision_log {
      sql_on: ${ds_reorder_streaming_decision_log.id} = ${ds_reorder_outcomes_log.decision_id};;
      relationship: many_to_one
    }
    access_filter: {field:ds_reorder_outcomes_log.merchant_id
      user_attribute:merchant_id}
    }


explore: ds_reorder_streaming_decision_log {  access_filter: {field:merchant_id
    user_attribute:merchant_id}
  label: "Reorder Decisions Log"
    persist_with: daily_refresh
  join: ds_reorder_outcomes_log {
    sql_on: ${ds_reorder_streaming_decision_log.id} = ${ds_reorder_outcomes_log.decision_id};;
    relationship: one_to_many
  }
  access_filter: {field:ds_reorder_streaming_decision_log.merchant_id
    user_attribute:merchant_id}
}

explore: cart_log {
  access_filter: {field:merchant_id
    user_attribute:merchant_id}

  join: product_product {
    sql_on: ${cart_log.product_id} = ${product_product.id} ;;
    relationship: many_to_one
  }

  join: offer_offer {
    sql_on: ${cart_log.offer_id} = ${offer_offer.id} ;;
    relationship: many_to_one
  }

  join: subscription_subscription {
    sql_on: ${subscription_subscription.id} = ${cart_log.subscription_id} ;;
    relationship: one_to_one
    fields: [subscription_subscription.id, subscription_subscription.customer_id, subscription_subscription.merchant_id, subscription_subscription.product_id, subscription_subscription.quantity, subscription_subscription.frequency_days,
      subscription_subscription.cancel_reason, subscription_subscription.cancelled_date, subscription_subscription.cancelled_month, subscription_subscription.offer_id, subscription_subscription.created_date, subscription_subscription.created_month,
      subscription_subscription.live, subscription_subscription.subscription_type, subscription_subscription.created_logic, subscription_subscription.is_min_created]
  }

  join: cart_log_mixed {
    sql_on: ${cart_log_mixed.session} = ${cart_log.session_id} ;;
    relationship: many_to_one
  }

  join: cart_log_no_subscription {
    type: left_outer
    sql_on: ${cart_log_no_subscription.session_id} = ${cart_log.session_id} ;;
    relationship: many_to_one
  }

  join: Customer_Subscription {
    from: subscription_subscription
    type: left_outer
    sql_on: ${cart_log.customer_id} = ${Customer_Subscription.customer_id} ;;
    relationship: many_to_many
    fields: [Customer_Subscription.id, Customer_Subscription.customer_id, Customer_Subscription.merchant_id, Customer_Subscription.product_id, Customer_Subscription.quantity, Customer_Subscription.frequency_days,
      Customer_Subscription.cancel_reason, Customer_Subscription.cancelled_date, Customer_Subscription.cancelled_month, Customer_Subscription.offer_id, Customer_Subscription.created_date, Customer_Subscription.created_month,
      Customer_Subscription.live, Customer_Subscription.subscription_type]
  }

  join: customer_facts {
    type: left_outer
    sql_on: ${cart_log.customer_id} = ${customer_facts.customer_id} ;;
    relationship: many_to_one
    fields: [customer_facts.customer_creation_count, customer_facts.customer_id, customer_facts.created_month, customer_facts.created_month,
      customer_facts.Customer_Live, customer_facts.merchant_id, customer_facts.Cancelled_date, customer_facts.Cancelled_month, customer_facts.Subscriber_lifetime,
      customer_facts.Bucket_Lifetime, customer_facts.Average_Subscriber_Lifetime, customer_facts.First_Subscription_ID, customer_facts.Total_Orders,
      customer_facts.Completed_Orders]
  }

  join: order_order {
    type: left_outer
    sql_on: ${cart_log.merchant_order_id} =  ${order_order.order_merchant_id} ;;
    relationship: many_to_one
    fields: [order_order.id, order_order.merchant_id, order_order.customer_id, order_order.sub_total, order_order.place_date, order_order.place_month, order_order.cancelled_date,
      order_order.cancelled_month, order_order.status, order_order.order_merchant_id, order_order.rejected_message, order_order.public_id]
  }

  join: merchant_merchant {
    sql_on: ${cart_log.merchant_id} = ${merchant_merchant.id} ;;
  }
}

explore: order_item_log {access_filter: {field:merchant_id
    user_attribute:merchant_id}
  persist_with: daily_refresh
  join: product_product {
    sql_on: ${product_product.id} = ${order_item_log.product_id} ;;
    relationship: many_to_one
  }

  join: customer_customer {
    type: left_outer
    sql_on: ${customer_customer.id} = ${order_item_log.customer_id} ;;
    fields: [customer_customer.id, customer_customer.created_date, customer_customer.created_month, customer_customer.created_time, customer_customer.created_week, customer_customer.created_year, customer_customer.live,
      customer_customer.merchant_id, customer_customer.merchant_user_id ]
    relationship: many_to_one
  }

  join: order_order {
    type: left_outer
    sql_on: ${order_order.id} = ${order_item_log.order_id} ;;
    relationship: many_to_one
    fields: [order_order.cancelled_time, order_order.created_time, order_order.status, order_order.place_time, order_order.id, order_order.customer_id, order_order.merchant_id,
      order_order.order_merchant_id, order_order.sub_total, order_order.rejected_message, order_order.Order_Status_Name]
  }

  join: offer_offer {
    type: left_outer
    sql_on: ${order_item_log.offer_id} = ${offer_offer.id} ;;
    relationship: many_to_one
    fields: [offer_offer.id, offer_offer.js_name, offer_offer.merchant_id, offer_offer.offer_live, offer_offer.offer_name]
  }

  join: order_log {
    type: left_outer
    sql_on: ${order_item_log.order_id} = ${order_log.order_id} ;;
    relationship: many_to_many
  }

  join: merchant_merchant_industries {
    sql_on: ${merchant_merchant_industries.merchant_id} = ${order_item_log.merchant_id} ;;
  }

  join: merchant_industry {
    sql_on: ${merchant_industry.id} = ${merchant_merchant_industries.industry_id} ;;
  }

}

explore: order_log {access_filter: {field:merchant_id
    user_attribute:merchant_id}
  persist_with: daily_refresh

  join: order_item_log {
    sql_on: ${order_item_log.order_id} = ${order_log.order_id} ;;
    relationship: many_to_many
  }}

explore: impulse_upsell_adds {access_filter: {field:merchant_id
    user_attribute:merchant_id}
  persist_with: daily_refresh}

    explore: Cart_Log_Mixed_Session {
      from: cart_log_mixed
    }
