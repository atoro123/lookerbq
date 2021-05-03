view: jira_ticket {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select i.id as Ticket_ID,i.key as Jira_Board_Ticket_ID, fields.project.name as Project_Name, fields.created as Created, fields.customfield_10004 as Story_Points,
fields.status.name as Status, cf.value.value as Board_Name, ARRAY_TO_STRING(ARRAY_AGG(fl.value), ', ') as Labels
from `stitch-poc-306316.jira_poc.issues` i
cross join UNNEST(fields.labels) fl
cross join unnest(fields.customfield_10300) cf
group by 1,2,3,4,5,6,7  ;;
     indexes: ["Ticket_ID"]
    }

    dimension: Ticket_ID {
      type: number
      sql: ${TABLE}.Ticket_ID ;;
      primary_key: yes
    }

    dimension: Jira_Ticket_ID {
      type: string
      sql: ${TABLE}.Jira_Board_Ticket_ID ;;
    }

    dimension: Project_Name {
      type: string
      sql: ${TABLE}.Project_Name ;;
    }

  dimension_group: Created {
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
    sql: ${TABLE}.Created ;;
  }

  dimension: Story_Points {
    type: number
    sql: ${TABLE}.Story_Points ;;
  }

  dimension: Ticket_Status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: Board_Name {
    type: string
    sql: ${TABLE}.Board_Name ;;
  }

  dimension: Labels {
    type: string
    sql: ${TABLE}.Labels ;;
  }

  measure: Total_Points {
    type: sum
    sql: ${Story_Points} ;;
  }

  dimension: Jira_Hours {
    type: number
    sql: ${Story_Points}*4 ;;
  }

  dimension: CSD_Cost {
    type: number
    sql: ${Jira_Hours}*67 ;;
  }

  measure: Total_CSD_Cost {
    type: sum
    sql: ${CSD_Cost} ;;
  }

  measure: Total_CSD_Forecast_Cost {
    type: sum
    sql: (${CSD_Cost})/((case when if(${harvest_merchant_mapping.percent_completed_integration} = 0, 1,${harvest_merchant_mapping.percent_completed_integration})  is not null then cast(if(${harvest_merchant_mapping.percent_completed_integration} = 0, 1,${harvest_merchant_mapping.percent_completed_integration}) as FLOAT64) else null end)/100) ;;
  }
  }
