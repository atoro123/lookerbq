connection: "og_transactions"

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

explore: subscription_log {  access_filter: {field:merchant_id
    user_attribute:merchant_id}

}

explore: customer_experience_log {  access_filter: {field:merchant_id
    user_attribute:merchant_id}
  label: "Customer Experience Log"
  view_label: "Customer Experience Log"
    join: enrolled_customer_experience_log {
      relationship: many_to_one
      type: inner
      view_label: "Customer Experience Log"
      sql_on: ${customer_experience_log.merchant_user_id} = ${enrolled_customer_experience_log.merchant_user_id_test};;
}
}

explore: ds_reorder_outcomes_log {  access_filter: {field:merchant_id
    user_attribute:merchant_id}
}
