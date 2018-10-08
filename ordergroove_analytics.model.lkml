connection: "prod_replica"

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


# explore: order_item {}

explore: order_order {
  sql_always_where: ${merchant_id} in ('34' , '9' )    ;;
  view_label: "Order"
  label: "1) Orders and Subscriptions"

  join: order_item {
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
    from: offer_offer
    sql_on: ${subscription_offer.id} = ${subscription_subscription.offer_id};;
  }

  join: order_offer {
    from: offer_offer
    sql_on: ${order_offer.id} = ${order_item.offer_id}  ;;

  }

  join: customer_customer {
    view_label: "Customer"
    sql_on: ${customer_customer.id} = ${subscription_subscription.customer_id}
    ;;
    relationship: many_to_one
  }

  join: customer_order {
    from: customer_customer
    sql_on: ${customer_customer.id} = ${order_order.customer_id}
      ;;

    relationship: many_to_one
  }

  join: product_product {
    view_label: "Product"
  sql_on: ${order_item.product_id} = ${product_product.id};;
  }

  join: merchant_merchant {
    view_label: "Merchant"
    sql_on: ${order_order.merchant_id} = ${merchant_merchant.id} ;;
  }
}
