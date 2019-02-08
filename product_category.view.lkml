view: product_category {
  sql_table_name: ogv2_production.product_category ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    hidden: yes
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

  dimension: external_id {
    hidden: yes
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension_group: last_update {
    hidden: yes
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

  dimension: level {
    label: "Category Level"
    type: number
    sql: ${TABLE}.level ;;
  }

  dimension: lft {
    hidden: yes
    type: number
    sql: ${TABLE}.lft ;;
  }

  dimension: merchant_id {
    hidden: yes
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: name {
    label: "Category Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: parent_id {
    hidden: yes
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: rght {
    hidden: yes
    type: number
    sql: ${TABLE}.rght ;;
  }

  dimension: tree_id {
    hidden: yes
    type: number
    sql: ${TABLE}.tree_id ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id, name]
  }
}
