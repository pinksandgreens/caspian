- view: es_source
  sql_table_name: implementation.es_source
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: source
    type: string
    sql: ${TABLE}.source

  - measure: count
    type: count
    drill_fields: []

