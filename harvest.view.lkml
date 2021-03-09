view: harvest {
  sql_table_name: `production-202017.ogv2_consumerinsight.harvest`
    ;;

  dimension: approved_ {
    type: yesno
    sql: ${TABLE}.Approved_ ;;
  }

  dimension: billable_ {
    type: yesno
    sql: ${TABLE}.Billable_ ;;
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

  dimension: employee_ {
    type: yesno
    sql: ${TABLE}.Employee_ ;;
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

  dimension: invoiced_ {
    type: yesno
    sql: ${TABLE}.Invoiced_ ;;
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

  dimension: merchant_id {
    type: number
    sql: case when ${client} not in ("Time Off",
      "Ordergroove",
      "Pet Valu (US)",
      "P&G Parent",
      "Dinovite",
      "Lush Handmade Cosmetics",
      "BeautyCounter US",
      "L'Oreal ACD",
      "Il Makiage Beauty Parent",
      "Unilever",
      "L'Oreal PPD",
      "Claire's",
      "Corro Shop",
      "Kill Cliff",
      "Newell Parent",
      "Mondou",
      "Organifi",
      "Edgewell Personal Care",
      "Stumptown Coffee Corp.",
      "Enfamil",
      "Holmes",
      "Tryzens",
      "Phlur",
      "Loops Beauty",
      "To Be in Bloom",
      "SodaStream U.S.",
      "Lush Handmade Cosmetics CA",
      "Clarins CA",
      "Purina Just Right",
      "PlusCBD Oil (CV Sciences)",
      "RoC Skincare",
      "Sally Beauty Canada",
      "Door County Coffee & Tea Co.",
      "Popular Culture",
      "Tea Drops",
      "The Yankee Candle UK",
      "OSF",
      "ThisisL",
      "illy Parent",
      "Bath & Body Works",
      "Kill Cliff CBD",
      "Soapbox") then cast(right(${client},3) as numeric)
      when ${client} = "Time Off" then 998
      when ${client} = "Ordergroove" then 999
      when ${client} = "Dinovite" then 352
      when ${client} = "Lush Handmade Cosmetics" then 69
      when ${client} = "BeautyCounter US" then 480
      when ${client} = "Claire's" then 508
      when ${client} = "Corro Shop" then 457
      when ${client} = "Kill Cliff" then 363
      when ${client} = "Stumptown Coffee Corp." then 490
      when ${client} = "Holmes" then 131
      when ${client} = "Tryzens" then 378
      when ${client} = "Phlur" then 497
      when ${client} = "Loops Beauty" then 492
      when ${client} = "To Be in Bloom" then 494
      when ${client} = "SodaStream U.S." then 295
      when ${client} = "Lush Handmade Cosmetics CA" then 232
      when ${client} = "Clarins CA" then 483
      when ${client} = "Purina Just Right" then 144
      when ${client} = "PlusCBD Oil (CV Sciences)" then 233
      when ${client} = "RoC Skincare" then 504
      when ${client} = "Door County Coffee & Tea Co." then 503
      when ${client} = "Tea Drops" then 509
      when ${client} = "The Yankee Candle UK" then 496
      when ${client} = "OSF" then 372
      when ${client} = "ThisisL" then 256
      when ${client} = "Bath & Body Works" then 510
      when ${client} = "Kill Cliff CBD" then 364
      when ${client} = "Soapbox" then 229
      else null end;;
  }
}
