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
  sql_trigger:  SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*6)/(60*60*24)) ;;
  max_cache_age: "2 hours"
}
persist_for: "2 hours"

explore: analytics_conversion {  access_filter: {field:merchant_id
    user_attribute:merchant_id}
    persist_with: daily_refresh

  join: merchant_merchant {
    sql_on: ${merchant_merchant.id} = ${analytics_conversion.merchant_id} ;;
    relationship: many_to_one
  }

  join: industry_info {
      sql_on: ${merchant_merchant.id} = ${industry_info.merchant_id} ;;
      relationship: one_to_many
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

    join: merchant_merchant {
      sql_on: ${subscription_daily_summary.merchant_id} = ${merchant_merchant.id} ;;
      relationship: many_to_one
    }
  }

explore: analytics_summary {
  access_filter: {field:analytics_summary.merchant_id
    user_attribute:merchant_id
}
  persist_with: daily_refresh
  }


explore: offline_reportjob {
  join: merchant_merchant {
    view_label: "Merchant"
    sql_on: ${merchant_merchant.public_id} = ${offline_reportjob.merchant_public_id};;
    relationship: one_to_many
  }
}
