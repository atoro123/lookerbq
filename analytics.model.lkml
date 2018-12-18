connection: "analytics_replica"

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

explore: analytics_conversion {  access_filter: {field:merchant_id
    user_attribute:merchant_id}}

explore: subscription_monthly_summary {  access_filter: {field:merchant_id
    user_attribute:merchant_id}
  access_filter: {field:subscriber_monthly_summary.merchant_id
    user_attribute:merchant_id}
  join: subscriber_monthly_summary {
    type: left_outer
    sql_on: ${subscription_monthly_summary.date_date} = ${subscriber_monthly_summary.date_date} ;;
  }
  join: merchant_merchant {
    sql_on: ${subscription_monthly_summary.merchant_id} = ${merchant_merchant.id} ;;
  }
}
