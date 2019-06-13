view: vsi_fraud {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select c.MerchantUser as 'Merchant User ID', c.Customer as 'OG User ID', c.SendNow as 'Send Now Date', c.AddressChange as 'Address Change Date', c.SendNowPayload as 'Send Now Payload', c.ShippingChangePayload as 'Shipping Change Payload', d.Public as 'Subscription Public ID', d.Created, d.PName as 'Product Name',
      d.Quantity, d.Price, c.Order, d.ItemID, d.merchantorderid, d.total
      from
      (select a.Customer1 as 'MerchantUser', a.Customer2 as 'customer', a.Logged as 'SendNow', b.logged as 'AddressChange', a.Payload as 'SendNowPayload', b.Payload as 'ShippingChangePayload', a.Even as 'SendNowEvent', b.Even as 'ChangeAddressEvent', a.Order as 'Order'
      from
      (select el.id, cc.merchant_user_id as 'Customer1', cc.id as 'Customer2', date(el.logged) as 'Logged', el.object_metadata as 'Payload', el.type_id as 'Even', el.object_id as 'Order'
      from event_log el
      left join customer_customer cc
      on cc.id = el.customer_id
      where cc.merchant_id = 113
      and el.type_id = 24
      and el.logged between subdate(CURDATE(), INTERVAL 1 DAY) and Curdate()
      group by 1) a
      left join
      (select el.id, cc.merchant_user_id as 'Customer1', cc.id as 'Customer2', date(el.logged) as 'Logged', el.object_metadata as 'Payload', el.type_id as 'Even'
      from event_log el
      left join customer_customer cc
      on cc.id = el.customer_id
      where cc.merchant_id = 113
      and el.type_id in (27,8,18)
      and el.logged between subdate(CURDATE(), INTERVAL 1 DAY) and Curdate()
      group by 1) b
      on a.Customer1 = b.Customer1
      and a.Customer2 = b.Customer2
      where b.Logged - a.Logged = 0) c
      left join
      (select oi.id as 'ItemID', ss.public_id as 'Public', oo.customer_id as 'customer', ss.created as 'Created', pp.name 'PName', oi.quantity as 'quantity', pp.price as 'price', oo.id as 'orderid', oo.order_merchant_id 'merchantorderid', oo.sub_total as 'total'
      from order_order oo
      left join order_item oi
      on oi.order_id = oo.id
      left join subscription_subscription ss
      on ss.id = oi.subscription_id
      left join product_product pp
      on pp.id = oi.product_id
      where oo.merchant_id = 113
      and oo.status not in (1,4)
      and oo.place between subdate(CURDATE(), INTERVAL 1 DAY) and adddate(Curdate(), INTERVAL 12 DAY)
      group by 1) d
      on d.orderid = c.Order
      and d.customer = c.customer
      group by c.Order, d.ItemID
      ;
       ;;

      indexes: ["OG User ID"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: merchant_user_id {
    type: string
    label: "Merchant User ID"
    sql: ${TABLE}.`Merchant User ID` ;;
  }

  dimension: og_user_id {
    type: number
    label: "OG User ID"
    sql: ${TABLE}.`OG User ID` ;;
  }

  dimension: send_now_date {
    type: date
    label: "Send Now Date"
    sql: ${TABLE}.`Send Now Date` ;;
  }

  dimension: address_change_date {
    type: date
    label: "Address Change Date"
    sql: ${TABLE}.`Address Change Date` ;;
  }

  dimension: send_now_payload {
    type: string
    label: "Send Now Payload"
    sql: ${TABLE}.`Send Now Payload` ;;
  }

  dimension: shipping_change_payload {
    type: string
    label: "Shipping Change Payload"
    sql: ${TABLE}.`Shipping Change Payload` ;;
  }

  dimension: subscription_public_id {
    type: string
    label: "Subscription Public ID"
    sql: ${TABLE}.`Subscription Public ID` ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.Created ;;
  }

  dimension: product_name {
    type: string
    label: "Product Name"
    sql: ${TABLE}.`Product Name` ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.Price ;;
  }

  dimension: order {
    type: number
    sql: ${TABLE}.`Order` ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.ItemID ;;
  }

  dimension: merchantorderid {
    type: string
    sql: ${TABLE}.merchantorderid ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [
      merchant_user_id,
      og_user_id,
      send_now_date,
      address_change_date,
      send_now_payload,
      shipping_change_payload,
      subscription_public_id,
      created_time,
      product_name,
      quantity,
      price,
      order,
      item_id,
      merchantorderid,
      total
    ]
  }
}
