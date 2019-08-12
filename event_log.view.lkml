view: event_log {
  sql_table_name: ogv2_production.event_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: email_html {
    type: string
    sql: ${TABLE}.email_html ;;
    hidden: yes
  }

  dimension_group: logged {
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
    sql: ${TABLE}.logged ;;
  }

  dimension: object_id {
    type: number
    sql: ${TABLE}.object_id ;;
  }

  dimension: object_metadata {
    type: string
    sql: ${TABLE}.object_metadata ;;
  }

  dimension_group: sent {
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
    sql: ${TABLE}.sent ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.type_id ;;
  }

  dimension: oos_pid {
    type: number
    sql: replace(right(${object_metadata},8),"}","") ;;
  }

  dimension_group: viewed {
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
    sql: ${TABLE}.viewed ;;
  }


  measure: action_count {
    type: count_distinct
    sql: ${object_id} ;;
    drill_fields: [id,object_id, type_id, logged_date]
  }

  dimension: Action_Name  {
    type: string
    sql: case when ${type_id} = 9 then 'Reactivated Subscription'
         when ${type_id} = 8 then 'Changed Shipping Address'
         when ${type_id} = 27 then 'Changed Shipping Address'
         when ${type_id} = 10 then 'Change Payment Info'
         when ${type_id} = 11 then 'Change Subscription Frequency'
         when ${type_id} = 12 then 'Change Next Place Date'
         when ${type_id} = 25 then 'Change Next Place Date'
         when ${type_id} = 14 then 'Change Subscription quantity'
         when ${type_id} = 15 then 'Skip Next Order'
         when ${type_id} = 16 then 'Switch Subscription Product'
         when ${type_id} = 17 then 'Send Now'
         when ${type_id} = 24 then 'Send Now'
         when ${type_id} = 18 then 'Update Shipping Address'
         when ${type_id} = 27 then 'Update Shipping Address'
         when ${type_id} = 19 then 'Update Billing Address'
         when ${type_id} = 20 then 'Update Payment Info'
         when ${type_id} = 28 then 'Update Payment Info'
         when ${type_id} = 30 then 'Product Discontinued'
         when ${type_id} = 41 then 'Cancelled Subscription and Remove from Order'
         when ${type_id} = 71 then 'SKU Swap'
         when ${type_id} = 21 then 'Skip Order'
         when ${type_id} = 22 then 'Removed Item from Order'
         when ${type_id} = 38 then 'Merged Order'
         when ${type_id} = 74 then 'Merged Order'
         when ${type_id} = 23 then 'Changed Order Item Quantity'
         when ${type_id} = 49 then 'Created IU Subscription'
         when ${type_id} = 50 then 'Added IU One-Time'
         Else 'Other' end
        ;;
  }

  measure: min_date {
    type: date
    sql: min(${logged_date}) ;;
  }

  measure: count {
    type: count
    sql: ${id} ;;
  }
}
