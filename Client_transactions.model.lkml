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

}

explore: customer_experience_log {  access_filter: {field:merchant_id
    user_attribute:merchant_id}
  label: "Customer Experience Log"
  view_label: "Customer Experience Log"
    persist_with: daily_refresh
    fields: [-order_order.subtracted_days_for_original,  ]

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
    sql_on: ${customer_customer.merchant_user_id} = ${customer_experience_log.merchant_user_id} ;;
  }

  join: order_order {
    relationship: one_to_many
    sql_on: ${order_order.customer_id} = ${customer_customer.id} ;;
  }

    join: order_item {
      view_label: "Order Item"
      sql_on: ${order_order.id} = ${order_item.order_id} ;;
      relationship: one_to_many
      type: left_outer
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

}

explore: order_item_log {access_filter: {field:merchant_id
    user_attribute:merchant_id}
  persist_with: daily_refresh
  join: product_product {
    sql_on: ${product_product.id} = ${order_item_log.product_id} ;;
    relationship: many_to_one
  }
}

explore: order_log {access_filter: {field:merchant_id
    user_attribute:merchant_id}
  persist_with: daily_refresh

  join: order_item_log {
    sql_on: ${order_item_log.order_id} = ${order_log.order_id} ;;
    relationship: many_to_many
  }
}

explore: impulse_upsell_adds {access_filter: {field:merchant_id
    user_attribute:merchant_id}
  persist_with: daily_refresh}
