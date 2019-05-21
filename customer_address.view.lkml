view: customer_address {
  sql_table_name: ogv2_production.customer_address ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
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
    sql: ${TABLE}.created ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: first_name_lowercase {
    type: string
    sql: ${TABLE}.first_name_lowercase ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: last_name_lowercase {
    type: string
    sql: ${TABLE}.last_name_lowercase ;;
  }

  dimension: live {
    type: yesno
    sql: ${TABLE}.live ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: price_code {
    type: string
    sql: ${TABLE}.price_code ;;
  }

  dimension: public_id {
    type: string
    sql: ${TABLE}.public_id ;;
  }

  dimension: state_province_code {
    type: string
    sql: ${TABLE}.state_province_code ;;
  }

  dimension: store_public_id {
    type: string
    sql: ${TABLE}.store_public_id ;;
  }

  dimension: token_id {
    type: string
    sql: ${TABLE}.token_id ;;
  }

  dimension: zip_postal_code {
    type: string
    sql: ${TABLE}.zip_postal_code ;;
  }

  dimension: State_Code {
    type: string
    sql:
    case
  when ${state_province_code} = '**!!==oP1JHigANkmhj/xSJ06BeqX9TU4+gqBZtKkihLk37ZE=' then 'AL'
when ${state_province_code} = '**!!==oq4iBMG9qwbrIe1Kej5b4qX9TU4+gqBZtKkihLk37ZE=' then 'AK'
when ${state_province_code} = '**!!==DtmQGnIPMPZBYPqq0ZTqBaX9TU4+gqBZtKkihLk37ZE=' then 'AZ'
when ${state_province_code} = '**!!==hESL9MPn8dgHRdAbXPoTEaX9TU4+gqBZtKkihLk37ZE=' then 'AR'
when ${state_province_code} = '**!!==bwTcS6ES26CKYCFEJEsX8aX9TU4+gqBZtKkihLk37ZE=' then 'CA'
when ${state_province_code} = '**!!==OOwR2ziQlgWiJLM7Kq+2aqX9TU4+gqBZtKkihLk37ZE=' then 'CO'
when ${state_province_code} = '**!!==ivfWUBsMryoAHmSfRD4yzqX9TU4+gqBZtKkihLk37ZE=' then 'CT'
when ${state_province_code} = '**!!==/JUExqUmAJF1+bKt9bdXx6X9TU4+gqBZtKkihLk37ZE=' then 'DE'
when ${state_province_code} = '**!!==lh07anFJPX5+vIc3d6fL66X9TU4+gqBZtKkihLk37ZE=' then 'FL'
when ${state_province_code} = '**!!==U0puVyvqy1QcQ6GWWjtCEqX9TU4+gqBZtKkihLk37ZE=' then 'GA'
when ${state_province_code} = '**!!==Ifwg4PmyRXdEgh1JWoY4aqX9TU4+gqBZtKkihLk37ZE=' then 'HI'
when ${state_province_code} = '**!!==U14jtwLH4cB6rdSD+mXq06X9TU4+gqBZtKkihLk37ZE=' then 'ID'
when ${state_province_code} = '**!!==NVMC6I+PD4bH5+KdieXBG6X9TU4+gqBZtKkihLk37ZE=' then 'IL'
when ${state_province_code} = '**!!==Pc/OlyGubcDuBgHYGbcyaqX9TU4+gqBZtKkihLk37ZE=' then 'IN'
when ${state_province_code} = '**!!==WM7rKEgS7vC96VLqky89VKX9TU4+gqBZtKkihLk37ZE=' then 'IA'
when ${state_province_code} = '**!!==abqDg6mt1htKRKG0aHaozqX9TU4+gqBZtKkihLk37ZE=' then 'KS'
when ${state_province_code} = '**!!==PKmRUOorz86QVAHeITvOKKX9TU4+gqBZtKkihLk37ZE=' then 'KY'
when ${state_province_code} = '**!!==boTY1fOn4u/n+SXtEcVyEaX9TU4+gqBZtKkihLk37ZE=' then 'LA'
when ${state_province_code} = '**!!==dvFn7x9qiAyx0U9vqsvJxKX9TU4+gqBZtKkihLk37ZE=' then 'ME'
when ${state_province_code} = '**!!==dN9DMkP5Tj9oRT3esGCnSqX9TU4+gqBZtKkihLk37ZE=' then 'MD'
when ${state_province_code} = '**!!==62WTBe0/H2DYpLZVzXnIv6X9TU4+gqBZtKkihLk37ZE=' then 'MA'
when ${state_province_code} = '**!!==oYhG6aep2IPXR6eh20w7DKX9TU4+gqBZtKkihLk37ZE=' then 'MI'
when ${state_province_code} = '**!!==CBzXE3VLcyyZWiRtFm331qX9TU4+gqBZtKkihLk37ZE=' then 'MN'
when ${state_province_code} = '**!!==wnolK7zx4zHrO5AARQzz0aX9TU4+gqBZtKkihLk37ZE=' then 'MS'
when ${state_province_code} = '**!!==lqz/HV0xqIJJpZdZ3nJjjaX9TU4+gqBZtKkihLk37ZE=' then 'MO'
when ${state_province_code} = '**!!==T8vYExq8dDspfUkFiGFKVaX9TU4+gqBZtKkihLk37ZE=' then 'MT'
when ${state_province_code} = '**!!==ZO89DdoOGs4jvg6aIpJmlaX9TU4+gqBZtKkihLk37ZE=' then 'NE'
when ${state_province_code} = '**!!==GEEFUQFxt6OaVAVuK32FxaX9TU4+gqBZtKkihLk37ZE=' then 'NV'
when ${state_province_code} = '**!!==f/SHBDEMhIEXZfcRgPSsGqX9TU4+gqBZtKkihLk37ZE=' then 'NH'
when ${state_province_code} = '**!!==wSh3WTh+iuR0QnCqcIarF6X9TU4+gqBZtKkihLk37ZE=' then 'NJ'
when ${state_province_code} = '**!!==TGkTkMcYJZS+B2DLF/dXTaX9TU4+gqBZtKkihLk37ZE=' then 'NM'
when ${state_province_code} = '**!!==uNlgQQ0lDcpO884F6XcZbKX9TU4+gqBZtKkihLk37ZE=' then 'NY'
when ${state_province_code} = '**!!==VOCEIHfCLb7/9CoNw7TkfKX9TU4+gqBZtKkihLk37ZE=' then 'NC'
when ${state_province_code} = '**!!==/9JowBPDtlp3TimpWyUZJKX9TU4+gqBZtKkihLk37ZE=' then 'ND'
when ${state_province_code} = '**!!==G28W48FjuHpk98BvUk8BraX9TU4+gqBZtKkihLk37ZE=' then 'OH'
when ${state_province_code} = '**!!==JyFgQpwB/8XxPWt7n1q9raX9TU4+gqBZtKkihLk37ZE=' then 'OK'
when ${state_province_code} = '**!!==GBKUUM0Tqx3Yo+QakcIWTaX9TU4+gqBZtKkihLk37ZE=' then 'OR'
when ${state_province_code} = '**!!==aude8opcgRuGnRMTXBFKaqX9TU4+gqBZtKkihLk37ZE=' then 'PA'
when ${state_province_code} = '**!!==CfNAv1PFCXqRydMUmz2P1aX9TU4+gqBZtKkihLk37ZE=' then 'RI'
when ${state_province_code} = '**!!==2wyTBi7Pn8RusrF9WBM7kaX9TU4+gqBZtKkihLk37ZE=' then 'SC'
when ${state_province_code} = '**!!==orojcVIO7ztHbHannKW3nKX9TU4+gqBZtKkihLk37ZE=' then 'SD'
when ${state_province_code} = '**!!==do90RL8xnUQKRDlTHoR2S6X9TU4+gqBZtKkihLk37ZE=' then 'TN'
when ${state_province_code} = '**!!==5NdLKC9OvZ1lH/b1bAhXF6X9TU4+gqBZtKkihLk37ZE=' then 'TX'
when ${state_province_code} = '**!!==QJ9fQRZMPjIxy1g7PUxahaX9TU4+gqBZtKkihLk37ZE=' then 'UT'
when ${state_province_code} = '**!!==95rIK+y7AvUVJA5qoisVqKX9TU4+gqBZtKkihLk37ZE=' then 'VT'
when ${state_province_code} = '**!!==q8eBTBZIW4yanMOckR+rDKX9TU4+gqBZtKkihLk37ZE=' then 'VA'
when ${state_province_code} = '**!!==a4BsBMsjK3+nKbK+k1R/4KX9TU4+gqBZtKkihLk37ZE=' then 'WA'
when ${state_province_code} = '**!!==AJNV5+PtUoQbnCA8IePmMaX9TU4+gqBZtKkihLk37ZE=' then 'WV'
when ${state_province_code} = '**!!==IepdwWi5G2kfer1ZsbbKWqX9TU4+gqBZtKkihLk37ZE=' then 'WI'
when ${state_province_code} = '**!!==ikjEnYeFcXQnP8xqEBAb46X9TU4+gqBZtKkihLk37ZE=' then 'WY'
Else 'Other' END;;
  }

  dimension: bopus {
    type: yesno
    sql: ${TABLE}.id = ${order_order.shipping_address_id};;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, company_name]
  }
}
