view: analytics_conversion {
  sql_table_name: og_analytics.analytics_conversion ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: new_subscribers {
    type: number
    sql: ${TABLE}.new_subscribers ;;
  }

  dimension: offer_id {
    type: number
    sql: ${TABLE}.offer_id ;;
  }

  dimension: subscribers {
    type: number
    sql: ${TABLE}.subscribers ;;
  }

  dimension: subscriptions {
    type: number
    sql: ${TABLE}.subscriptions ;;
  }

  dimension: views {
    type: number
    sql: ${TABLE}.views ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: sum_views {
    type: sum
    sql: ${views} ;;
  }

  measure: sum_subscribers {
    type: sum
    sql: ${subscribers} ;;
  }
}
