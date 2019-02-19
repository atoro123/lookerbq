include: "event_log.view.lkml"

view: subscription_event_log {
  extends: [event_log]

dimension: Subscription_ID {
  type: number
  sql: ${TABLE}.object_id ;;
}

dimension: Action {
  type: number
  sql: ${type_id} where ${type_id} in (5,8,10,11,12,13,14,15,16,17,18,19,20,30,73);;
}

}
