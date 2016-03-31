- view: gigya_brand_optin
  sql_table_name: publications.gigya_brand_optin
  fields:

  - dimension: brand_code
    type: string
    sql: ${TABLE}.brand_code

  - dimension_group: ddw_date_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_date_updated

  - dimension: emailoptin
    type: string
    sql: ${TABLE}.emailoptin

  - dimension: gigya_id
    type: string
    sql: ${TABLE}.gigya_id

  - dimension: phoneoptin
    type: string
    sql: ${TABLE}.phoneoptin

  - dimension: postaloptin
    type: string
    sql: ${TABLE}.postaloptin

  - dimension: smsoptin
    type: string
    sql: ${TABLE}.smsoptin

  - measure: count
    type: count
    drill_fields: []

