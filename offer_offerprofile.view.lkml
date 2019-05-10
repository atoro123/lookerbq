view: offer_offerprofile {
  sql_table_name: ogv2_production.offer_offerprofile ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: environment {
    type: string
    sql: ${TABLE}.environment ;;
  }

  dimension: initial_coupon_id {
    type: number
    sql: ${TABLE}.initial_coupon_id ;;
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

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: recurring_coupon_id {
    type: number
    sql: ${TABLE}.recurring_coupon_id ;;
  }

  dimension: request_specific {
    type: yesno
    sql: ${TABLE}.request_specific ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: specific_products {
    type: yesno
    sql: ${TABLE}.specific_products ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
