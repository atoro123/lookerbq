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
  }
