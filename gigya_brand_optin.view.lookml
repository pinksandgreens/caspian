- view: gigya_brand_optin
  label: '2c. Registered Brand Optin'
  sql_table_name: publications.gigya_brand_optin
  fields:

  - dimension: brand_code
    type: string
    sql: ${TABLE}.brand_code

  - dimension_group: ddw_date_updated
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_date_updated

  - dimension: emailoptin
    label: 'Email Optin'
    type: string
    sql: ${TABLE}.emailoptin

  - dimension: gigya_id
    label: 'User ID'
    type: string
    sql: ${TABLE}.gigya_id

  - dimension: phoneoptin
    label: 'Phone Optin'
    type: string
    sql: ${TABLE}.phoneoptin

  - dimension: postaloptin
    label: 'Postal Optin'
    type: string
    sql: ${TABLE}.postaloptin

  - dimension: smsoptin
    label: 'SMS Optin'
    type: string
    sql: ${TABLE}.smsoptin

  - measure: count
    hidden: TRUE
    type: count
    drill_fields: []

