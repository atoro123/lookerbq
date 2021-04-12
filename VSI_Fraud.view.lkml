view: vsi_fraud {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24)) ;;
    sql: select c.MerchantUser as Merchant_User_ID, c.Customer as OG_User_ID, c.SendNow as Trigger_Date,(case when c.Trigger = 24 then 'Send Now' else 'Change Order Date' end) as Trigger, c.AddressChange as Address_Change_Date, c.SendNowPayload as Trigger_Payload, c.ShippingChangePayload as Shipping_Change_Payload, d.Public as Subscription_Public_ID, d.Created, d.PName as Product_Name,
      d.Quantity, d.Price, c.Order1, d.ItemID, d.merchantorderid, d.total
      from
      (select a.Customer1 as MerchantUser, a.Customer2 as customer, a.Logged as SendNow, a.Even as Trigger, b.logged as AddressChange, a.Payload as SendNowPayload, b.Payload as ShippingChangePayload, a.Even as SendNowEvent, b.Even as ChangeAddressEvent, a.Order1 as Order1
      from
      (select el.id, cc.merchant_user_id as Customer1, cc.id as Customer2, date(el.logged) as Logged, el.object_metadata as Payload, el.type_id as Even, el.object_id as Order1
      from `production-202017.ogv2_production.event_log` el
      left join `production-202017.ogv2_production.customer_customer` cc
      on cc.id = el.customer_id
      where cc.merchant_id = 113
      and el.type_id in (24,25)
      and date(el.logged) between date_sub(CURRENT_DATE(), INTERVAL 1 DAY) and CURRENT_DATE()
      ) a
      left join
      (select el.id, cc.merchant_user_id as Customer1, cc.id as Customer2, date(el.logged) as Logged, el.object_metadata as Payload, el.type_id as Even
      from `production-202017.ogv2_production.event_log` el
      left join `production-202017.ogv2_production.customer_customer` cc
      on cc.id = el.customer_id
      where cc.merchant_id = 113
      and el.type_id in (27,8,18)
      and date(el.logged) between date_sub(CURRENT_DATE(), INTERVAL 1 DAY) and CURRENT_DATE()
      ) b
      on a.Customer1 = b.Customer1
      and a.Customer2 = b.Customer2
      where Date_DIFF(b.Logged, a.Logged, DAY) = 0) c
      left join
      (select oi.id as ItemID, ss.public_id as Public, oo.customer_id as customer, ss.created as Created, pp.name PName, oi.quantity as quantity, pp.price as price, oo.id as orderid, oo.order_merchant_id as merchantorderid, oo.sub_total as total
      from `production-202017.ogv2_production.order_order` oo
      left join `production-202017.ogv2_production.order_item` oi
      on oi.order_id = oo.id
      left join `production-202017.ogv2_production.subscription_subscription` ss
      on ss.id = oi.subscription_id
      left join `production-202017.ogv2_production.product_product` pp
      on pp.id = oi.product_id
      where oo.merchant_id = 113
      and oo.status not in (1,4)
      and oo.place between date_sub(CURRENT_DATE(), INTERVAL 1 DAY) and date_add(Current_date(), INTERVAL 12 DAY)
      ) d
      on d.orderid = c.Order1
      and d.customer = c.customer
      ;
       ;;

      #indexes: ["OG User ID"]
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

    dimension: trigger_date {
      type: date
      label: "Trigger Date"
      sql: ${TABLE}.`Trigger Date` ;;
    }

    dimension: trigger_type {
      type: string
      label: "Event Trigger"
      sql: ${TABLE}.`Trigger` ;;
    }

    dimension: address_change_date {
      type: date
      label: "Address Change Date"
      sql: ${TABLE}.`Address Change Date` ;;
    }

    dimension: trigger_payload {
      type: string
      label: "Event Trigger Payload"
      sql: ${TABLE}.`Trigger Payload` ;;
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
      value_format: "0"
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
        trigger_date,
        address_change_date,
        trigger_payload,
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
