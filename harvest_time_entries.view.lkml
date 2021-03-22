view: harvest_time_entries {
  sql_table_name: `stitch-poc-306316.harvest.time_entries`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: billable {
    type: yesno
    sql: ${TABLE}.billable ;;
  }

  dimension: budgeted {
    type: number
    sql: ${TABLE}.budgeted ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_quarter,
      fiscal_year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: hours {
    type: number
    sql: ${TABLE}.hours ;;
  }

  measure: Work_Cost {
    type: sum
    sql: ${hours}*${harvest_roles.Role_Rate} ;;
    value_format: "$0.00"
  }

  measure: total_hours {
    type: sum
    sql: ${hours} ;;
    value_format: "0.0"
  }

  dimension: is_billed {
    type: yesno
    sql: ${TABLE}.is_billed ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_locked {
    type: yesno
    sql: ${TABLE}.is_locked ;;
  }

  dimension: is_running {
    type: yesno
    sql: ${TABLE}.is_running ;;
  }

  dimension: locked_reason {
    type: string
    sql: ${TABLE}.locked_reason ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension_group: spent {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.spent_date ;;
  }

  dimension: started_time {
    type: string
    sql: ${TABLE}.started_time ;;
  }

  dimension: task_assignment_id {
    type: number
    sql: ${TABLE}.task_assignment_id ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension_group: timer_started {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timer_started_at ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_assignment_id {
    type: number
    sql: ${TABLE}.user_assignment_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  ###
  dimension: before_or_after_launch{
    sql: case when ${created_date} < max(${account.actual_launch_date__c_date}) then 'before'
          when ${created_date} = max(${account.actual_launch_date__c_date}) then 'launch'
          when ${created_date} < max(${account.actual_launch_date__c_date}) then 'after'
          else null
          end
          ;;
  }


  measure: Implementation_Hours {
    group_label: "Implementation Hours"
    type: sum
    sql:  CASE WHEN ${harvest_projects.Project_Name} = "Implementation" then ${TABLE}.Hours else null end;;
    value_format: "0.0"
  }

  measure: Implementation_Hours_Strategy {
    group_label: "Implementation Hours"
    type: sum
    sql:  CASE WHEN ${harvest_projects.Project_Name} = "Implementation" and ${role_group} = "Strategy" then ${TABLE}.Hours else null end;;
    value_format: "0.0"
  }

  measure: Implementation_Hours_Support {
    group_label: "Implementation Hours"
    type: sum
    sql:  CASE WHEN ${harvest_projects.Project_Name} = "Implementation" and ${role_group} = "Strategy" then ${TABLE}.Hours else null end;;
    value_format: "0.0"
  }

  measure: Implementation_Hours_Technical {
    group_label: "Implementation Hours"
    type: sum
    sql:  CASE WHEN ${harvest_projects.Project_Name} = "Implementation" and ${role_group} = "Strategy" then ${TABLE}.Hours else null end;;
    value_format: "0.0"
  }

  measure: Implementation_Hours_Pre_Launch{
    group_label: "Implementation Hours"
    type: sum
    sql:  CASE WHEN (cast(${created_date}as DATE) < cast(max(${account.actual_launch_date__c_date}) as DATE) THEN  ${TABLE}.Hours else null END;;
  }

  measure: Implementation_Hours_Post_Launch{
    group_label: "Implementation Hours"
    type: sum
    sql:  CASE WHEN (cast(${created_date}as DATE) >= cast(max(${account.actual_launch_date__c_date}) as DATE) THEN  ${TABLE}.Hours else null END;;
  }


  dimension: role_group {
    type: string
    sql: case   when ${harvest_roles.Role_Name} in ('Account Manager','Exec','Relationship Manager','Success Associate','Success Coordinator','SCD') then 'Strategy'
              when ${harvest_roles.Role_Name} like '%Solution%' or ${harvest_roles.Role_Name} like '%Production Specialist%' or ${harvest_roles.Role_Name} in ('Ops') then 'Technical'
              when ${harvest_roles.Role_Name} like '%Support%' then 'Support'
              else ${harvest_roles.Role_Name} end;;
  }

  dimension: clean_task {
    type: string
    sql: case when ${harvest_tasks.name} = 'Client / Project Management' then 'Project Management'
              when ${harvest_tasks.name} = 'Client Call / Meeting' then 'Client Meeting'
              when ${harvest_tasks.name} = 'Debugging / Troubleshooting - Client Caused Issues' then 'Debugging & Troubleshooting'
              when ${harvest_tasks.name} = 'Analysis / Discoverys' then 'Investigating'
              when ${harvest_tasks.name} = 'Design & Development [Implementation Work]s' then 'Design & Development'
              else ${harvest_tasks.name} end;;
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

}
