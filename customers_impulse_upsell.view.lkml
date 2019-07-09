view: customers_impulse_upsell {
    derived_table: {
      sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
      sql: select distinct oo.customer_id, count(distinct case when oi.one_time is true and oi.subscription_id is null then oo.id else null end) AS IU_One_Time_Orders, count(distinct case when oi.subscription_id is not null and (oi.one_time is true
or ss.subscription_type = 'IU Replenishment'
or off.offer_type in (12,13,14,19,20,23)
or off.name like '%IU%'
or off.name like '%Impulse Upsell%') then oo.id else null end) AS IU_Replenishment_Orders
from ogv2_production.order_item oi
left join ogv2_production.subscription_subscription ss on oi.subscription_id = ss.id
left join ogv2_production.order_order oo on oo.id = oi.order_id
left join ogv2_production.offer_offer off on ss.offer_id = off.id
where oo.status=5
and (oi.one_time is true
or ss.subscription_type = 'IU Replenishment'
or off.offer_type in (12,13,14,19,20,23)
or off.name like '%IU%'
or off.name like '%Impulse Upsell%')
group by 1;;
      }

   dimension: customer_id {
      type: number
      primary_key: yes
      sql: ${TABLE}.customer_id ;;
    }

    measure: IU_One_Time_Orders {
      type: sum
      sql: ${TABLE}.IU_One_Time_Orders ;;
    }

    measure: IU_Replenishment_Orders {
      type: sum
      sql: ${TABLE}.IU_Replenishment_Orders ;;
    }

    dimension: IU_Customer {
      type: yesno
      sql: ${customer_id} is not null ;;
    }
    }
