view: harvest_hours {
  sql_table_name: `production-202017.ogv2_consumerinsight.harvest_hours`
    ;;

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.ID ;;
  }

  dimension: First_Name {
    type: string
    sql: ${TABLE}.First_Name ;;
  }

  dimension: Last_Name {
    type: string
    sql: ${TABLE}.Last_Name ;;
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

  dimension: hours {
    type: number
    sql: ${TABLE}.Hours ;;
  }

  dimension: invoiced {
    type: yesno
    sql: ${TABLE}.Invoiced ;;
  }

  dimension: work_section {
    type: string
    sql: case when lower(${notes}) like '%email%' then 'Email'
    when lower(${notes}) like '%offer%' then 'Offers'
    when lower(${notes}) like '%msi%' then 'MSI'
    when lower(${notes}) like '%smi%' then 'SMI'
    when lower(${notes}) like '%import%' then 'Imports'
    when lower(${notes}) like '%tag%' then 'Page Tag'
    when lower(${notes}) like '%migration%' then 'Migration'
    when lower(${notes}) like '%reorder%' then 'Reorder'
    when lower(${notes}) like '%international%' then 'International'
    when lower(${notes}) like '%promos%' then 'Advanced Promos'
    when lower(${notes}) like '%custom other%' then 'Custom Other'
    else 'Other' end
    ;;
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

  measure: total_hours {
    type: sum
    sql: ${TABLE}.Hours ;;
  }

  measure: min_harvest_date {
    type: date
    sql: min(${date_date}) ;;
  }

  dimension: Project_Area {
    type: string
    sql: case when (${project} = "Implementation" and ${Last_Name} != "Analyst") then "Implementation"
    when (${project} = "Internal Time Tracking" and ${Last_Name} != "Analyst") then "Internal Time Tracking"
    when (${project} = "Live Client Service" and ${Last_Name} != "Analyst") then "Live Client Service"
    when (${project} = "Post Launch" and ${Last_Name} != "Analyst") then "Post Launch"
    when (${project} = "Replatform/Reintegration" and ${Last_Name} != "Analyst") then "Replatform/Reintegration"
    when ${Last_Name} = "Analyst" then "Analytics"
    else null end;;
  }
}
