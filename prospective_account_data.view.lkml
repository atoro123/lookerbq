view: prospective_account_data {
    derived_table: {
      sql_trigger_value: select current_date ;;
      sql: select distinct account_name as Account, Annual_Contract_Value__ACV_ as ACV, Implementation_Fee as Implementation_Fee,
      close_date as Close_Date, Opportunity_Name, Opportunity_Record_Type, Stage, Close_Quarter, ACV_Rate_Card,
      Implementation_Fee_Rate_Card
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
        year,
        fiscal_quarter,
        fiscal_year
      ]
      sql: timestamp(${TABLE}.Close_Date) ;;
    }

    dimension: Implementation_Fee {
      type: number
      sql: ${TABLE}.Implementation_Fee;;
    }

    dimension: Rate_Card_ACV {
      type: number
      sql: ${TABLE}.ACV_Rate_Card ;;
    }

    measure: Total_Rate_Card_ACV {
      type: sum
      sql: ${Rate_Card_ACV} ;;
    }

    measure: Total_Rate_Card_Implementation_Fee {
      type: sum
      sql: ${Implementation_Fee_Rate_Card} ;;
    }

    dimension: Implementation_Fee_Rate_Card {
      type: number
      sql: ${TABLE}.Implementation_Fee_Rate_Card ;;
    }

    dimension: ACV_Discount {
      type: number
      sql: (${Implementation_Fee}/${Implementation_Fee_Rate_Card}) ;;
      value_format: "0%"
    }

    dimension: Implementation_Fee_Discount {
      type: number
      sql: (${Implementation_Fee}/${Implementation_Fee_Rate_Card}) ;;
      value_format: "0%"
    }

    dimension: Stage {
      type: string
      sql: ${TABLE}.Stage ;;
    }

    dimension: Close_Quarter {
      type: string
      sql: ${TABLE}.Close_Quarter ;;
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
    drill_fields: [Account, Opportunity_Name, Opportunity_Type, Close_Quarter, Closing_date]
  }

  measure: Total_Implementation_Fee_Of_ACV {
    type: number
    sql: ${Total_Implementation_Fee}/${Total_ACV} ;;
    value_format: "0.00%"
    drill_fields: [Account, Opportunity_Name, Opportunity_Type, Close_Quarter, Closing_date]
   }
  }
