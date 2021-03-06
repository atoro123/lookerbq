connection: "production_bq"

include: "*.view.lkml"               # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
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
explore: churn_diagnostics_view {
  join: merchant_merchant {
    sql_on: ${churn_diagnostics_view.merchant_id} = ${merchant_merchant.id} ;;
    relationship: many_to_one
  }
}

explore: churn_prediction_monitor {
}

explore: churn_rolling_sum {
}

explore: churn_prediction_monitor_actives {
}

explore: churn_prediction_log {
}


explore: churn_prediction_exclusion {
}


explore: churn_prediction_log_looker {
}

explore: churn_prediction_full {
}

explore: message_messageeventlog_log{
}
explore: churn_prediction_reporting{
}

explore: event_log {
}

explore: frequency_scratch {
}

explore: suggested_frequencies {
}

explore: ab_testing_results {
}


explore: ab_testing_results_no_c {
}

explore: ab_testing_results_one_line {
}

explore: subscription_performance_product_level_one_line  {}

explore: subscription_performance_product_level {}

explore: model_performance {
}
