connection: "prod_replica"

include: "*.view.lkml"

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
  sql_trigger: SELECT CURDATE() ;;
  max_cache_age: "24 hours"
}
persist_for: "24 hours"

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


  join: product_product {
    view_label: "Product"
  sql_on: ${product_product.id} = ${order_item.product_id};;
    relationship: one_to_many
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

  join: customer_address {
    view_label: "Customer Address"
    sql_on: ${customer_address.customer_id} = ${order_order.customer_id} ;;
    relationship: many_to_one
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
  }

explore: customer_customer {
  label: "3) Customers"
  view_label: "Customer"
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
      relationship: many_to_one

    }
}

explore: event_log {
  label: "4) Event Log"
  from: event_log
  join: customer_customer {
    view_label: "Customer"
    sql_on: ${event_log.customer_id} = ${customer_customer.id};;
    relationship: many_to_one
  }}

  explore: oos_event_log {
   from: oos_event_log
    label: "5) Event Log - OOS"
    join: customer_customer {
    sql_on: ${oos_event_log.customer_id} = ${customer_customer.id} ;;
    relationship: many_to_one
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
    join: order_placementfailure {
      sql_on: ${order_order.public_id} = ${order_placementfailure.order_public_id} ;;
      relationship: one_to_one
    }
  }
