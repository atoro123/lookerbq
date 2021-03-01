view: prospective_account_data {
    derived_table: {
      sql_trigger_value: select current_date ;;
      sql: select distinct account_name as Account, Annual_Contract_Value__ACV_ as ACV, Implementation_Fee as Implementation_Fee,
      close_date as Close_Date, Opportunity_Name, Opportunity_Record_Type
           from `production-202017.ogv2_consumerinsight.Pipe_Custom_Deals`
           where Implementation_Fee is not null  ;;
      indexes: ["Account"]
    }

    dimension: Account {
      type: string
      sql: ${TABLE}.Account ;;
    }

    dimension: ACV {
      type: number
      sql: ${TABLE}.ACV ;;
    }

    dimension: Opportunity_Name {
      type: string
      sql: ${TABLE}.Opportunity_Name ;;
    }

    dimension: Opportunity_Type {
      type: string
      sql: ${TABLE}.Opportunity_Record_Type ;;
    }

    dimension_group: Closing {
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
      sql: timestamp(${TABLE}.Close_Date) ;;
    }

    dimension: Implementation_Fee {
      type: number
      sql: ${TABLE}.Implementation_Fee;;
    }

    measure: Total_ACV {
      type: sum
      sql: ${ACV} ;;
    }

    measure: Total_Implementation_Fee {
      type: sum
      sql: ${Implementation_Fee} ;;
    }

  dimension: Implementation_Fee_Of_ACV {
    type: number
    sql: (${Implementation_Fee}/${ACV})  ;;
    value_format: "0.00%"
  }
   }
