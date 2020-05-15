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

  measure: Distinct_OOS {
    type: count_distinct
    sql: ${object_id} ;;
  }

  dimension: OOS_Day {
    type: string
    sql: case when ${type_id} = 31 then '1st Day OOS'
    when ${type_id} = 32 then '15th Day OOS'
    when ${type_id} = 33 then '30th Day OOS'
    else 'Other' end;;
  }

  dimension: To {
    type: string
    sql: json_extract_scalar(${object_metadata}, '$.from')  ;;
  }

  dimension: From {
    type: string
    sql: json_extract_scalar(${object_metadata}, '$.to') ;;
  }
  }
