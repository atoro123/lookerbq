view: zendesk_ticket_custom_fields {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql: select id, max(if(cf.value.id = 360045830014, cf.value.value, NULL)) AS Merchant,
max(if(cf.value.id = 360048640653, cf.value.value, NULL)) AS Sub_Issue_Type,
max(if(cf.value.id = 360046855374, cf.value.value, NULL)) AS Intiated_By,
max(if(cf.value.id = 360039656114, cf.value.value, NULL)) AS Client_Status,
max(if(cf.value.id = 360040008654, cf.value.value, NULL)) AS Ecom_Platform,
max(if(cf.value.id = 360048654134, cf.value.value, NULL)) AS Product_Tags,
max(if(cf.value.id = 360048528994, cf.value.value, NULL)) AS Documentation_Needed,
max(if(cf.value.id = 360048654134, cf.value.value, NULL)) AS What_Do_You_Need_Help_With,
max(if(cf.value.id = 1500002349661, cf.value.value, NULL)) AS Ticket_Resolution
from (
SELECT zt.id, cf
FROM `stitch-poc-306316.zendesk.tickets` zt
cross join UNNEST(custom_fields) cf
left join `stitch-poc-306316.zendesk.ticket_fields` tf
on tf.id = cf.value.id)
group by id

       ;;
     indexes: ["Ticket_ID"]
    }

    dimension: Ticket_ID {
      type: number
      primary_key: yes
      sql: ${TABLE}.id ;;
    }

    dimension: Merchant {
      type: string
      sql: ${TABLE}.Merchant ;;
    }

    dimension: Sub_Issue_Type {
      type: string
      sql: ${TABLE}.Sub_Issue_Type ;;
    }

    dimension: Intiated_By  {
      type: string
      sql: ${TABLE}.Intiated_By ;;
    }

    dimension: Documentation_Needed {
      type: string
      sql: ${TABLE}.Documentation_Needed ;;
    }

    dimension: What_Do_You_Need_Help_With {
      type: string
      sql: ${TABLE}.What_Do_You_Need_Help_With ;;
    }

  dimension: Ticket_Resolution {
    type: string
    sql: ${TABLE}.Ticket_Resolution ;;
  }


    }
