include: "event_log.view.lkml"

view: subscription_event_log {
  extends: [event_log]

dimension: Subscription_ID {
  type: number
  sql: ${TABLE}.object_id ;;
}

dimension: Action {
  type: number
  sql: ${type_id} where ${type_id} in (5,8,10,11,12,13,14,15,16,17,18,19,20,30,71,73,31,28,83);;
}

measure: Distinct_Customers {
  type: count_distinct
  sql: ${customer_id} ;;
}

dimension: SKU_Swap_To_Product_Walmart_CA {
  type: number
  hidden: yes
  sql:  left(right(${object_metadata},8),7);;
}

  dimension: SKU_Swap_From_Product_Walmart_CA {
    type: number
    hidden: yes
    sql:  left(right(${object_metadata},25),7);;
  }

dimension: to {
  type: string
  hidden: yes
  sql: json_extract_scalar(${object_metadata}, '$.to') ;;
}

dimension: from{
  type: string
  hidden: yes
  sql: json_extract_scalar(${object_metadata}, '$.from')  ;;
}

dimension: to_change {
  label:"To Change"
  hidden: yes
  type: number
  sql: ${to} ;;
  value_format: "0"
}

dimension: from_change {
  label: "From Change"
  hidden: yes
  type: number
  sql: ${from} ;;
  value_format: "0"
}

dimension: from_sku {
  type: number
  sql: cast(${from} as NUMERIC) ;;
  value_format: "0"
}

measure: From_Sku_Count {
  type: count
  sql: ${from_sku} ;;
  value_format: "0"
}

measure: To_Sku_Count {
  type: count
  sql: ${to_sku} ;;
  value_format: "0"
}

dimension: to_sku {
  type: number
  sql: cast(${to} as NUMERIC) ;;
  value_format: "0"
}

measure: Average_To_Frequency {
  type: average
  sql: cast(${to} AS NUMERIC) ;;
  filters: {
    field: type_id
    value: "11"
  }
  value_format: "0"
}

measure: Average_From_Frequency {
  type: average
  sql: cast(${from} AS NUMERIC) ;;
  filters: {
    field: type_id
    value: "11"
  }
  value_format: "0"
}

  measure: Average_To_Quantity {
    type: average
    sql: cast(${to} AS NUMERIC) ;;
    filters: {
      field: type_id
      value: "14"
    }
    value_format: "0"
  }

  measure: Average_From_Quantity {
    type: average
    sql: cast(${from} AS NUMERIC) ;;
    filters: {
      field: type_id
      value: "14"
    }
    value_format: "0"
  }

  dimension: From_Frequency {
    type: number
    sql: cast(${from_change} as NUMERIC) ;;
  }

  dimension: To_Frequency {
    type: number
    sql: cast(${to_change} as NUMERIC) ;;
  }

  measure: Date_Change_Difference {
    type: count
    sql: date_diff(cast(${to} AS DATE), cast(${from} AS DATE), DAY)  ;;
    description: "Always Filter for Type ID 12"
    value_format: "0"
  }

  dimension: Date_Change {
    type: number
    sql: date_diff(cast(${to} AS DATE), cast(${from} AS DATE), DAY)  ;;
    description: "Always Filter for Type ID 12"
    value_format: "0"
  }

  dimension: silent_sub_swap_sku_from {
    type: number
    sql: json_extract_scalar(${object_metadata}, '$.discontinued_replacement.source_product.sku') ;;
    description: "Filter for Type ID 87"
    value_format: "0"
  }

  dimension: silent_sub_swap_sku_to {
    type: number
    sql: json_extract_scalar(${object_metadata}, '$.discontinued_replacement.target_product.sku') ;;
    description: "Filter for Type ID 87"
    value_format: "0"
  }
}
