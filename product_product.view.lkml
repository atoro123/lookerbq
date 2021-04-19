view: product_product {
  sql_table_name: ogv2_production.product_product ;;

  dimension: id {
    label: "Product ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: autoship_by_default {
    type: yesno
    sql: ${TABLE}.autoship_by_default ;;
  }

  dimension: autoship_enabled {
    type: yesno
    sql: ${TABLE}.autoship_enabled ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension: detail_url {
    type: string
    sql: ${TABLE}.detail_url ;;
  }

  dimension: discontinued {
    type: yesno
    sql: ${TABLE}.discontinued ;;
  }

  dimension: every {
    type: number
    sql: ${TABLE}.every ;;
  }

  dimension: every_period {
    type: number
    sql: ${TABLE}.every_period ;;
  }

  dimension: external_product_id {
    type: string
    sql: ${TABLE}.external_product_id ;;
  }

  dimension: extra_data {
    type: string
    sql: ${TABLE}.extra_data ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: incentive_group_id {
    type: number
    sql: ${TABLE}.incentive_group_id ;;
  }

  dimension_group: last_update {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_update ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    }


  dimension: offer_profile_id {
    type: number
    sql: ${TABLE}.offer_profile_id ;;
  }

  dimension: premier_enabled {
    type: number
    sql: ${TABLE}.premier_enabled ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  measure: subscription_eligible {
    type: count_distinct
    sql:  CASE WHEN (${autoship_enabled} is TRUE) AND (${discontinued} is FALSE) THEN ${id} ELSE NULL END  ;;
  }

  measure: live_products {
    type: count_distinct
    sql:  CASE WHEN ${discontinued} is FALSE then ${id} else null end ;;
  }

  dimension: Candle {
    description: "Identifies if product is a Yankee Candle candle product"
    type: yesno
    sql: ${id} in (9353326,
      9353280,
      9353340,
      9353308,
      9353328,
      9353307,
      9353250,
      9353251,
      9353270,
      9353264,
      9353265,
      9353133,
      9353033,
      9353007,
      9353009,
      9353059,
      9353060,
      9353040,
      9352974,
      9442735,
      9352946,
      9353064,
      9353094,
      9353069,
      9353068,
      9353123,
      9353098,
      9353653,
      9353549,
      9353571,
      9353628,
      9353570,
      9353551,
      9353547,
      9352839,
      9352818,
      9442721,
      9352815,
      9352816,
      9352824,
      9352821,
      9352802,
      9352801,
      9352804,
      9352842,
      9352820,
      9352763,
      9353588,
      9353590,
      9353554,
      9353565,
      9353555,
      9353582,
      9353585,
      9353593,
      9351657,
      9352424,
      9352418,
      9352397,
      9352396,
      9352223,
      9352681,
      9352653,
      9352654,
      9353784,
      9353785,
      9353614,
      9353630,
      9352872,
      9352873,
      9352871,
      9351814,
      9351810,
      9351816,
      9352029,
      9352028,
      9352448,
      9352449,
      9352447,
      9352823,
      9356477,
      9352213,
      9352808,
      9442710,
      9352221,
      9351683,
      9442740,
      9351923,
      9352813,
      9442737,
      9351934,
      9352837,
      9352624,
      9352598,
      9352602,
      9352600,
      9352003,
      9410935,
      9442742,
      9351888,
      9352231,
      9352185,
      9352161) ;;
  }
}
