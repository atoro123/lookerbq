include: "event_log.view.lkml"

  view: order_event_log {
    extends: [event_log]

    dimension: Order_ID {
      type: number
      sql: ${TABLE}.object_id ;;
    }

    dimension: Action_Type {
      type: number
      sql: ${type_id};;
    }

    dimension: Combo_Saving_To_Order {
      type: number
      sql: cast(json_extract(${object_metadata}, '$.to_order') as NUMERIC) ;;
    }

    dimension: Combo_Saving_From_Order {
      type: number
      sql: cast(json_extract(${object_metadata}, '$.from_order') as NUMERIC) ;;
    }

    measure: To_Order_Count {
      type: count_distinct
      sql: ${Combo_Saving_To_Order} ;;
      filters: {
        field: type_id
        value: "80"
      }
    }

    measure: From_Order_Count {
      type: count_distinct
      sql: ${Combo_Saving_From_Order} ;;
      filters: {
        field: type_id
        value: "80"
      }
    }

    dimension: From_Order_Date {
      type: date
      sql: cast(json_extract_scalar(${object_metadata}, '$.from') as TIMESTAMP) ;;
    }

    dimension: To_Order_Date {
      type: date
      sql: cast(json_extract_scalar(${object_metadata}, '$.to') as TIMESTAMP) ;;
    }

   dimension: Change_Order_From_Date {
      type: string
      sql: json_extract_scalar(${object_metadata}, '$.from')  ;;
    }

    dimension: From_Order_Date_Order {
      type: date
      description: "Only use with Type ID 25"
      sql: PARSE_DATE('%m/%d/%Y',json_extract_scalar(${object_metadata}, '$.from')) ;;
    }

    dimension: To_Order_Date_Order {
      type: date
      description: "Only use with Type ID 25"
      sql: PARSE_DATE('%m/%d/%Y',json_extract_scalar(${object_metadata}, '$.to')) ;;
    }

    dimension: Date_Change {
      type: number
      sql: date_diff(${To_Order_Date_Order}, ${From_Order_Date_Order}, DAY) ;;
    }

    dimension: Change_Order_To_Date {
      type: string
      sql: json_extract_scalar(${object_metadata}, '$.to') ;;
    }

    measure: Distinct_Customers {
      type: count_distinct
      label: "Distinct Customer Count"
      sql: ${customer_id} ;;
    }
  }
