view: article_stats {
  sql_table_name: `production-202017.ga_production.article_stats`
    ;;

  dimension_group: _metadata__timestamp {
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
    sql: ${TABLE}._metadata__timestamp ;;
  }

  dimension: _metadata__uuid {
    type: string
    sql: ${TABLE}._metadata__uuid ;;
  }

  dimension: _metadata_account_id {
    type: number
    sql: ${TABLE}._metadata_account_id ;;
  }

  dimension: _metadata_contains_sampled_data {
    type: yesno
    sql: ${TABLE}._metadata_contains_sampled_data ;;
  }

  dimension: _metadata_internal_web_property_id {
    type: number
    sql: ${TABLE}._metadata_internal_web_property_id ;;
  }

  dimension: _metadata_profile_id {
    type: number
    sql: ${TABLE}._metadata_profile_id ;;
  }

  dimension: _metadata_profile_name {
    type: string
    sql: ${TABLE}._metadata_profile_name ;;
  }

  dimension: _metadata_table_id {
    type: string
    sql: ${TABLE}._metadata_table_id ;;
  }

  dimension: _metadata_total_results {
    type: number
    sql: ${TABLE}._metadata_total_results ;;
  }

  dimension: _metadata_web_property_id {
    type: string
    sql: ${TABLE}._metadata_web_property_id ;;
  }

  dimension: _metadata_website_url {
    type: string
    sql: ${TABLE}._metadata_website_url ;;
  }

  dimension: bounces {
    type: number
    sql: ${TABLE}.bounces ;;
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

  dimension: dimension1 {
    type: string
    sql: ${TABLE}.dimension1 ;;
  }

  dimension: dimension3 {
    type: string
    sql: ${TABLE}.dimension3 ;;
  }

  dimension: entrances {
    type: number
    sql: ${TABLE}.entrances ;;
  }

  dimension: exits {
    type: number
    sql: ${TABLE}.exits ;;
  }

  dimension: hits {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.newUsers ;;
  }

  dimension: page_path {
    type: string
    sql: ${TABLE}.pagePath ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: time_on_page {
    type: number
    sql: ${TABLE}.timeOnPage ;;
  }

  dimension: unique_pageviews {
    type: number
    sql: ${TABLE}.uniquePageviews ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: count {
    type: count
    drill_fields: [_metadata_profile_name]
  }

  measure: sum_pageviews {
    type: sum
    sql: ${pageviews} ;;
  }

  measure: sum_timeOnPage {
    type: sum
    sql: ${time_on_page} ;;
  }

  measure: sum_Unique_pageviews {
    type: sum
    sql: ${unique_pageviews} ;;
  }

  measure: sum_users {
    type: sum
    sql: ${users} ;;
  }

  measure: sum_entrances {
    type: sum
    sql: ${entrances} ;;
  }

  measure: sum_exits {
    type: sum
    sql: ${exits} ;;
  }

  measure: sum_hits {
    type: sum
    sql: ${hits} ;;
  }

  measure: sum_newUsers {
    type: sum
    sql: ${new_users} ;;
  }

  measure: sum_bounces {
    type: sum
    sql: ${bounces} ;;
  }

  dimension: article_title {
    type: string
    sql: substr(pagePath,STRPOS(pagePath, "articles/")+22,byte_length(pagePath)) ;;
  }
}
