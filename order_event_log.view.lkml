include: "event_log.view.lkml"

  view: order_event_log {
    extends: [event_log]

    dimension: Order_ID {
      type: number
      sql: ${TABLE}.object_id ;;
    }

    dimension: Action_Type {
      type: number
      sql: ${type_id} where ${type_id} in (2,3,4,6,21,22,24,25,27,28,38,44,74);;
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
        value: "74,80"
      }
    }

    measure: From_Order_Count {
      type: count_distinct
      sql: ${Combo_Saving_From_Order} ;;
      filters: {
        field: type_id
        value: "74,80"
      }
    }
  }
