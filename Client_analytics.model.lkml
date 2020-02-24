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

datagroup: daily_refresh {
  sql_trigger: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24)) ;;
  max_cache_age: "24 hours"
}
persist_for: "24 hours"

explore: analytics_conversion {  access_filter: {field:merchant_id
    user_attribute:merchant_id}
    persist_with: daily_refresh

  join: merchant_merchant {
    sql_on: ${merchant_merchant.id} = ${analytics_conversion.merchant_id} ;;
    relationship: many_to_one
  }

  }

explore: subscription_monthly_summary {
  access_filter: {field:subscription_monthly_summary.merchant_id
    user_attribute:merchant_id}
  persist_with: daily_refresh
  join: subscriber_monthly_summary {
    relationship:many_to_one
    type: left_outer
    sql_on: ${subscription_monthly_summary.date_date} = ${subscriber_monthly_summary.date_date} and ${subscriber_monthly_summary.merchant_id} = ${subscription_monthly_summary.merchant_id};;
  }

  join: merchant_merchant {
    sql_on: ${subscription_monthly_summary.merchant_id} = ${merchant_merchant.id} ;;
    relationship: many_to_one
  }
}
  explore: subscription_daily_summary {
    access_filter: {field:subscription_daily_summary.merchant_id
      user_attribute:merchant_id}
    persist_with: daily_refresh
join:  subscriber_daily_summary {
  relationship: many_to_one
  type: left_outer
  sql_on: ${subscription_daily_summary.date_date} = ${subscriber_daily_summary.date_date} and ${subscription_daily_summary.merchant_id} = ${subscriber_daily_summary.merchant_id} ;;
}
  }

explore: analytics_summary {
  access_filter: {field:analytics_summary.merchant_id
    user_attribute:merchant_id
}
  persist_with: daily_refresh
  }
