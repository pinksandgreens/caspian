- view: es_brand_optin
  sql_table_name: publications.es_brand_optin
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: brandoptin
    type: yesno
    sql: ${TABLE}.brandoptin

  - dimension_group: date_created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: user_id
    type: string
    sql: ${TABLE}.user_id
    
  - measure: users_count
    type: count_distinct
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: []

