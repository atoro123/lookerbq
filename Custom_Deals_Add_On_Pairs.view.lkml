view: custom_deals_add_on_pairs {
  derived_table: {
    sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
    sql: Select a.merchant_id, a.Add_Ons as Add_Ons_component_1, b.Add_Ons as Add_Ons_component_2
      from(
      SELECT  merchant_id, Add_Ons
      FROM production-202017.ogv2_consumerinsight.new_harvest_merchant_mapping,UNNEST(SPLIT(Add_Ons, '; ')) Add_Ons
      UNION ALL
      SELECT merchant_id, Add_Ons
      FROM production-202017.ogv2_consumerinsight.new_harvest_merchant_mapping
      where Add_Ons is null and merchant_id is not null) a
      join
      (SELECT  merchant_id, Add_Ons
      FROM production-202017.ogv2_consumerinsight.new_harvest_merchant_mapping,UNNEST(SPLIT(Add_Ons, '; ')) Add_Ons
      UNION ALL
      SELECT merchant_id, Add_Ons
      FROM production-202017.ogv2_consumerinsight.new_harvest_merchant_mapping
      where Add_Ons is null and merchant_id is not null) b on a.merchant_id = b.merchant_id
      where a.Add_Ons < b.Add_Ons
      order by 1
                ;;
  }

  dimension: merchant_id {
    hidden: yes
    type: string
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: primary_key{
    hidden: yes
    type: string
    sql: concat(${merchant_id},${Add_Ons_component_1},${Add_Ons_component_2}) ;;
  }

  dimension: Add_Ons_component_1 {
    type: string
    sql: ${TABLE}.Add_Ons_component_1 ;;
  }

  dimension: Add_Ons_component_2 {
    type: string
    sql: ${TABLE}.Add_Ons_component_2 ;;
  }

  measure: Add_Ons_Distinct_merchant_pair_count_ {
    type: count_distinct
    sql: ${merchant_id} ;;
  }
}
