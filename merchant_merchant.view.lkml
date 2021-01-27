view: merchant_merchant {
  sql_table_name: ogv2_production.merchant_merchant ;;

  dimension: id {
    primary_key: yes
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
    sql: TIMESTAMP(${TABLE}.created) ;;
  }

  dimension: email_tokens {
    type: string
    hidden: yes
    sql: ${TABLE}.email_tokens ;;
  }

  dimension: hash_key {
    type: string
    hidden: yes
    sql: ${TABLE}.hash_key ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: program_name {
    type: string
    sql: ${TABLE}.program_name ;;
  }

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: schema {
    hidden: yes
    type: string
    sql: ${TABLE}.`schema` ;;
  }

  dimension: settings {
    type: string
    hidden: yes
    sql: ${TABLE}.settings ;;
  }

  dimension: settings_version {
    type: number
    hidden: yes
    sql: ${TABLE}.settings_version ;;
  }

  measure: count {
    type: count
    drill_fields: [id, program_name, name]
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, program_name, name]
  }

  dimension: Brand {
    type: string
    sql: case when ${id} = 135 then ${name}
         case when ${id} = 196 then ${name}
         case when ${id} in (37,43,60,61,65,97,202) then LOreal
         case when ${id} = 2 then ${name}
         case when ${id} in (144,154) then "Nestle"
         case when ${id} = 201 then "Estee Lauder"
         case when ${id} in (190,172,223,171,189,156,191,192,169) then "illycafe"
         case when ${id} = 114 then ${name}
         case when ${id} = 163 then ${name}
         case when ${id} = 85 then ${name}
         case when ${id} = 62 then ${name}
         case when ${id} = 66 then ${name}
         case when ${id} = 63 then ${name}
         case when ${id} = 183 then ${name}
         case when ${id} = 70 then ${name}
         case when ${id} = 127 then ${name}
         case when ${id} = 185 then ${name}
         case when ${id} = 213 then ${name}
         case when ${id} in (108,131) then "Newell"
         case when ${id} in (77,199,179,194,193,166)
         case when ${id} = 203 then "Mount Baker Vapor"
        else ${name} end;;
  }

  dimension: Success_Owner {
    type: string
    sql: case when ${id} in (113,206,2,164,185,184,196) then "Casey"
         when ${id} in (36,260,233) then "Jake"
         when ${id} in (243,43,135,202,37,155,179,9,209,216,217,66,65,69,166,194,77,97,60,238,193,61,227,224,170,137,199,239,261,232) then "Jamie"
         when ${id} in (78,94,76,188,205,211,207,234,210) then "Josh"
         when ${id} in (111,70,100,108,63,236,131,253,240,229,34,235,256,295) then "Lindsay"
         when ${id} in (145,44,10,203,79,154,226,114,144,183,221,219,228,241) then "Maria"
         when ${id} in (127,84,150,169,156,200,201,54,171,192,191,189,223,190,172,163,237) then "Stuart"
         else "Unassigned" end;;
  }
}
