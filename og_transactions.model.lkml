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

}

explore: ds_reorder_outcomes_log {  access_filter: {field:merchant_id
    user_attribute:merchant_id}
    label: "Reorder Outcomes Log"
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
  join: ds_reorder_outcomes_log {
    sql_on: ${ds_reorder_streaming_decision_log.id} = ${ds_reorder_outcomes_log.decision_id};;
    relationship: one_to_many
  }
  access_filter: {field:ds_reorder_streaming_decision_log.merchant_id
    user_attribute:merchant_id}
}
