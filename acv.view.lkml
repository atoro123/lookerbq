view: acv {
  sql_table_name: ogv2_consumerinsight.acv ;;

  dimension: account_classification {
    type: string
    sql: ${TABLE}.account_classification ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: account_owner {
    type: string
    sql: ${TABLE}.account_owner ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
  }

  dimension: arr {
    type: number
    sql: ${TABLE}.arr ;;
  }

  dimension: client_status {
    type: string
    sql: ${TABLE}.client_status ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: parent_account {
    type: string
    sql: ${TABLE}.parent_account ;;
  }

  dimension: risk_level {
    type: number
    sql: ${TABLE}.risk_level ;;
  }

  dimension: solutions_contact {
    type: string
    sql: ${TABLE}.solutions_contact ;;
  }

  dimension: success_owner {
    type: string
    sql: ${TABLE}.success_owner ;;
  }

  dimension: success_support {
    type: string
    sql: ${TABLE}.success_support ;;
  }

  measure: count {
    type: count
    drill_fields: [account_name]
  }
}
