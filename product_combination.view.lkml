view: product_combination {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(EXTRACT(epoch from NOW()) / (168*60*60)) ;;
    sql: SELECT a.name as productA, b.name as productB, a.merchant_id, COUNT(*) countForCombination
from (SELECT customer_id, ss.id, product_id, pp.name, ss.merchant_id FROM `production-202017.ogv2_production.subscription_subscription` as ss
left join `production-202017.ogv2_production.product_product` as pp on pp.id = ss.product_id
where DATE(ss.created) > DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH) AND DATE(ss.created) < CURRENT_DATE()) a
inner join (SELECT customer_id, ss.id, product_id, pp.name, ss.merchant_id FROM `production-202017.ogv2_production.subscription_subscription` as ss
left join `production-202017.ogv2_production.product_product` as pp on pp.id = ss.product_id
where DATE(ss.created) > DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH) AND DATE(ss.created) < CURRENT_DATE()) b on a.customer_id = b.customer_id and a.product_id < b.product_id and a.id < b.id and a.merchant_id = b.merchant_id
group by a.name, b.name, a.merchant_id
order by countForCombination desc

             ;;
           # indexes: ["subscription_id"]
    }

    dimension: productA {
      type: string
      sql: ${TABLE}.productA ;;
    }

  dimension: productB {
    type: string
    sql: ${TABLE}.productB ;;
  }

  dimension: countForCombination {
    type: number
    sql: ${TABLE}.countForCombination ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }
    }
