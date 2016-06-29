- view: es_brand_optin
  sql_table_name: publications.es_brand_optin
  fields:

  - dimension: brand
    label: 'Brand Name'
    type: string
    sql: ${TABLE}.brand

  - dimension: brandoptin
    label: 'Brand Opin (Yes/No)'
    type: yesno
    sql: ${TABLE}.brandoptin

  - dimension_group: date_created
    label: 'Date Created'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created

  - dimension_group: last_updated
    label: 'Last Updated'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: user_id
    hidden: FALSE
    type: string
    sql: ${TABLE}.user_id
    
  - measure: users_count
    label: 'Users Count'
    type: count_distinct
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: []

