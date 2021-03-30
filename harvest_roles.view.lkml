view: harvest_roles {
  sql_table_name: `stitch-poc-306316.harvest.roles`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
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
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: Role_Name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: Role_Rate {
    type: number
    sql: case when ${Role_Name} in ("Account Manager", "Success Associate", "Success Coordinator", "SCD", "Relationship Manager") then 125
          when ${Role_Name} in ("Production Specialist", "Senior Production Specialist", "Solutions", "Solutions Architect", "Solutions Consultant", "Solutions Lead",
          "Solutions Partner", "Support Specialist") then 104
          else null end;;
  }

  dimension: Role_group {
    type: string
    sql: case when ${Role_Name} in ("Account Manager", "Success Associate", "Success Coordinator", "SCD", "Relationship Manager") then 'Success'
    when ${Role_Name} in ("Production Specialist", "Senior Production Specialist", "Solutions", "Solutions Architect", "Solutions Consultant", "Solutions Lead",
          "Solutions Partner", "Support Specialist") then 'Solutions'
          else null end;;
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
}
