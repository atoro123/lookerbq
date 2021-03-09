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
      year,
      fiscal_quarter,
      fiscal_year
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

  dimension: Role_Rate {
    type: number
    sql: case when ${roles} in ("Account Manager", "Success Associate", "Success Coordinator", "SCD", "Relationship Manager") then 125
    when ${roles} in ("Production Specialist", "Senior Production Specialist", "Solutions", "Solutions Architect", "Solutions Consultant", "Solutions Lead",
    "Solutions Partner", "Support Specialist") then 104
    else null end;;
  }

  measure: Work_Cost {
    type: sum
    sql: (${Role_Rate}*${hours}) ;;
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

  dimension: before_or_after_launch{
    sql: case when ${date_date} < max(${harvest_merchant_mapping.launch_date}) then 'before'
    when ${date_date} = max(${harvest_merchant_mapping.launch_date}) then 'launch'
    when ${date_date} < max(${harvest_merchant_mapping.launch_date}) then 'after'
    else null
    end
    ;;
  }


  measure: Implementation_Hours {
    type: sum
    sql:  ${TABLE}.Hours;;
    filters: [project:"Implementation",billable: "Yes"]
    }

  measure: Implementation_Hours_Pre_Launch{
    type: sum
    sql:  CASE WHEN (cast(${date_date}as DATE) < cast(max(${harvest_merchant_mapping.launch_date}) as DATE) THEN  ${TABLE}.Hours else null END;;
  }

  measure: Implementation_Hours_Post_Launch{
    type: sum
    sql:  ${TABLE}.Hours;;
    filters: [project:"Implementation",billable: "Yes"]
  }

  measure: Annual_Contract_Hours_Used {
    type: sum
    sql:  case when (${harvest_hours.date_date} >= ${acv_tiers.gmv_start_date}) AND (${harvest_hours.date_date} <= ${acv_tiers.gmv_end_date}) then ${TABLE}.Hours else 0 end;;
    filters: [project:"-Implementation,-Internal Time Tracking"]
  }


  dimension: Project_Area {
    type: string
    sql: case when (${project} = "Implementation" and ${Last_Name} != "Analyst") then "Implementation"
    when (${project} = "Internal Time Tracking") then "Internal Time Tracking"
    when (${project} = "Live Client Service" and ${Last_Name} != "Analyst") then "Live Client Service"
    when (${project} = "Post Launch" and ${Last_Name} != "Analyst") then "Post Launch"
    when (${project} = "Replatform/Reintegration" and ${Last_Name} != "Analyst") then "Replatform/Reintegration"
    when ${Last_Name} = "Analyst" then "Analytics"
    else null end;;
  }

dimension: role_group {
  type: string
  sql: case   when ${roles} in ('Account Manager','Exec','Relationship Manager','Success Associate','Success Coordinator','SCD') then 'Strategy'
              when ${roles} like '%Solution%' or ${roles} like 'Production_Specialist' or ${roles} in ('Ops') then 'Technical'
              when ${roles} like '%Support%' then 'Support'
              else ${roles} end;;
}

dimension: clean_task {
    type: string
    sql: case when ${task} = 'Client / Project Management' then 'Project Management'
              when ${task} = 'Client Call / Meeting' then 'Client Meeting'
              when ${task} = 'Debugging / Troubleshooting - Client Caused Issues' then 'Debugging & Troubleshooting'
              when ${task} = 'Analysis / Discoverys' then 'Investigating'
              when ${task} = 'Design & Development [Implementation Work]s' then 'Design & Development'
              else ${task} end;;
  }


}
