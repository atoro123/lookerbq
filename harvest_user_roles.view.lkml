view: harvest_user_roles {
  sql_table_name: `stitch-poc-306316.harvest.user_roles`
    ;;

  dimension: role_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.role_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

}
