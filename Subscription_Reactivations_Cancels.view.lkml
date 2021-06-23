view: subscription_reactivations_cancels {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24)) ;;
    sql: select a.sub as subscription, a.user as merchant_user_id, a.og_user as OG_Customer_ID, a.react as react, b.cancelled as cancel, ss.live as live, a.sku as SKU, a.name as Product_Name
from
(select sl.subscription_id as sub, cc.merchant_user_id as user, cc.id as og_user, date(sl.logged) as react, pp.sku as sku, pp.name as name
from `production-202017.og_transactions.subscription_log` sl
left join `production-202017.ogv2_production.product_product` pp
on pp.id = sl.product_id
left join `production-202017.ogv2_production.customer_customer` cc
on cc.id = sl.customer_id
where sl.merchant_id = 282
and sl.event_id = 24
and pp.merchant_id = 282
and date(sl.logged) >= date_sub(current_date(), INTERVAL 60 DAY)) a
left join (
    select subscription_id as sub, max(date(logged)) as cancelled
    from `production-202017.og_transactions.subscription_log`
    where merchant_id = 282
    and event_id = 14
    group by 1
) b
on a.sub = b.sub
left join `production-202017.ogv2_production.subscription_subscription` ss
on ss.id = a.sub
where ss.merchant_id = 282 ;;
  }

  dimension: Subscription_ID {
    type: number
    sql: ${TABLE}.subscription ;;
  }

  dimension: Merchant_User_ID {
    type: string
    sql: ${TABLE}.merchant_user_id ;;
  }

  dimension: Customer_ID {
    type: number
    sql: ${TABLE}.OG_Customer_ID ;;
  }

  dimension: Reactivaton_Date {
    type: date
    sql: ${TABLE}.react ;;
  }

  dimension: Cancel_Date {
    type: date
    sql: ${TABLE}.cancel ;;
  }

  dimension: SKU {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  dimension: Product_Name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }

  dimension: Live {
    type: yesno
    sql: ${TABLE}.live ;;
  }
  }
