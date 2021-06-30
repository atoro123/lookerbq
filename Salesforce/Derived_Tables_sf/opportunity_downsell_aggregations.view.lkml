view: opportunity_downsell_aggregations {
    derived_table: {
      sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*8)/(60*60*24));;
      sql:

SELECT     opportunity_record_type.name  AS record_type,
                        (CAST(opportunity.closedate  AS TIMESTAMP)) AS date,
                        opportunity.id as custom_id,
                        ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE( opportunity.annual_contract_value_acv__c  ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST( opportunity.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( opportunity.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST( opportunity.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( opportunity.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6) AS acv
            FROM `stitch-poc-306316.salesforce.Opportunity` as opportunity
            LEFT JOIN `stitch-poc-306316.salesforce.RecordType`
                 AS opportunity_record_type ON Opportunity.recordtypeid = opportunity_record_type.id
            WHERE (opportunity.stagename ) = 'Closed Won' AND ((opportunity_record_type.name ) <> 'Renewal' OR (opportunity_record_type.name ) IS NULL)
group by 1,2,3
UNION ALL
SELECT  'Downsell',
                    (CAST(downsell_record__c.downsell_date__c  AS TIMESTAMP)) AS downsell_record__c_downsell_date__c_date,
                    downsell_record__c.id,
                    ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE( downsell_record__c.downsell_amount__c  ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST( downsell_record__c.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( downsell_record__c.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST( downsell_record__c.id   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( downsell_record__c.id   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6) AS downsell_record__c_downsell_sum
            FROM    `stitch-poc-306316.salesforce.Downsell_Record__c` AS downsell_record__c
group by 1,2,3
UNION ALL
Select 'Churn',
    (CAST(account.churn_date__c  AS TIMESTAMP)) AS account_churn_date_date,
    account.id,
    COALESCE(SUM(account.tier_1_bonus__c ), 0) AS account_sum_original_acv__c
FROM `stitch-poc-306316.salesforce.Account`
     AS account
WHERE (account.account_type__c ) = 'Former Customer' and churn_date__c is not null
GROUP BY
    1,2,3



    ;;
    }

    dimension: record_type {
      type: string
      sql: ${TABLE}.record_type ;;
      order_by_field: name_order
    }

    dimension: opportunity_id {
      sql:if(${name_order} < 6,${custom_id},null);;
    }

  dimension: account_id {
    sql:if(${name_order} = 6,${custom_id},null);;
  }

    dimension_group: date {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        quarter,
        year,
        fiscal_quarter
      ]
      sql: ${TABLE}.date ;;
      }

      dimension: acv {
        type: number
        sql: abs(${TABLE}.acv) ;;
      }

      measure: acv_sum {
        type: sum
        sql: ${acv} ;;
        value_format: "#,##0"
      }

    measure: Net_acv_sum {
    type: sum_distinct
    sql_distinct_key: ${custom_id} ;;
    sql: case when ${secondary_cateogry} = "Downsell" or ${secondary_cateogry} = "Churn" then -1*${acv} else ${acv} end;;
    value_format: "#,##0"
  }

    dimension: custom_id {
      type: string
      sql: ${TABLE}.custom_id ;;
    }

    dimension: name_order {
    type: string
    sql: if(${record_type} = 'New Business',0,
          if(${record_type} = 'Renewal',1,
          if(${record_type} = 'Cross sell',2,
          if(${record_type} = 'Upsell',3,
          if(${record_type} = 'GMV Increase',4,
          if(${record_type} = 'Downsell',5,6))))))


    ;;
  }

  dimension: category {
    type: string
    sql: case when ${record_type} = 'Beginning ACV' then 'Historical' else 'ACV' end ;;
  }

  dimension: secondary_cateogry {
    sql: case when ${record_type} in ('Cross sell','Upsell','GMV Increase') then 'Expansion' else ${record_type} end ;;
  }

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
    default_value: "Quarter"
  }

  dimension: dynamic_timeframe {
    type: string
    sql:
    case when {% parameter timeframe_picker %} = 'Date' then date(${date_date})
    when {% parameter timeframe_picker %} = 'Week' then date(${date_week})
    when {% parameter timeframe_picker %} = 'Month' then date(FORMAT_TIMESTAMP('%Y-%m-01', ${date_date}))
    when {% parameter timeframe_picker %} = 'Quarter' then DATE_ADD(date((FORMAT_TIMESTAMP('%Y-%m-01', TIMESTAMP_TRUNC(CAST(CAST(DATETIME_ADD(CAST(TIMESTAMP_TRUNC(CAST(date  AS TIMESTAMP), MONTH) AS DATETIME), INTERVAL -1 MONTH) AS TIMESTAMP) AS TIMESTAMP), QUARTER)))), INTERVAL 1 MONTH)
    when {% parameter timeframe_picker %} = 'Year' then date(FORMAT_TIMESTAMP('%Y-01-01', ${date_date}))
    end ;;
  }
}
