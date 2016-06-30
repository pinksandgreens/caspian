- view: es_brand_optin
  label: 'Competition Optins'
  sql_table_name: publications.es_brand_optin
  fields:

  - dimension: brand
    label: 'Brand Name'
    type: string
    sql: ${TABLE}.brand

  - dimension: brandoptin
    label: 'Brand Opin'
    type: yesno
    sql: ${TABLE}.brandoptin

  - dimension_group: date_created
    label: 'Optin'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created

  - dimension_group: last_updated
    label: 'Updated Optin'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: user_id
    hidden: FALSE
    type: string
    sql: ${TABLE}.user_id
    
  - measure: users_count
    hidden: TRUE
    label: 'Users Count'
    type: count_distinct
    sql: ${TABLE}.user_id

  - measure: count
    hidden: TRUE
    type: count
    drill_fields: []

