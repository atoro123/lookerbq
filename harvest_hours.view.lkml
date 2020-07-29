view: harvest_hours {
  sql_table_name: `production-202017.ogv2_consumerinsight.harvest_hours`
    ;;

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.ID ;;
  }

  dimension: approved {
    type: yesno
    sql: ${TABLE}.Approved ;;
  }

  dimension: billable {
    type: yesno
    sql: ${TABLE}.Billable ;;
  }

  dimension: billable_amount {
    type: number
    sql: ${TABLE}.Billable_Amount ;;
  }

  dimension: billable_rate {
    type: number
    sql: ${TABLE}.Billable_Rate ;;
  }

  dimension: client {
    type: string
    sql: ${TABLE}.Client ;;
  }

  dimension: cost_amount {
    type: number
    sql: ${TABLE}.Cost_Amount ;;
  }

  dimension: cost_rate {
    type: number
    sql: ${TABLE}.Cost_Rate ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.Currency ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: employee {
    type: yesno
    sql: ${TABLE}.Employee ;;
  }

  dimension: external_reference_url {
    type: string
    sql: ${TABLE}.External_Reference_URL ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.First_Name ;;
  }

  dimension: hours {
    type: number
    sql: ${TABLE}.Hours ;;
  }

  dimension: invoiced {
    type: yesno
    sql: ${TABLE}.Invoiced ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.Last_Name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.Notes ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}.Project ;;
  }

  dimension: project_code {
    type: string
    sql: ${TABLE}.Project_Code ;;
  }

  dimension: roles {
    type: string
    sql: ${TABLE}.Roles ;;
  }

  dimension: task {
    type: string
    sql: ${TABLE}.Task ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }

  measure: total_hours {
    type: sum
    sql: ${TABLE}.Hours ;;
  }
}
