include: "event_log.view.lkml"
view: oos_event_log {
 extends: [event_log]


 dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.type_id ;;
  }

  dimension: object_id {
    type: number
    sql:  ${TABLE}.object_id ;;
  }

  dimension: object_metadata {
    type: string
    sql: ${TABLE}.object_metadata ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: logged {
    type: time
    sql: ${TABLE}.logged ;;
  }


  dimension: product_id {
    type: number
    sql: replace(right(${TABLE}.object_metadata,8),"}","")  ;;
  }

  measure: Customer_Affected {
    type: count_distinct
    label: "Customers Affected"
    sql: ${customer_id} ;;
  }
  }
