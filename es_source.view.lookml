- view: es_source
  sql_table_name: implementation.es_source
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: competition_brand
    type: string
    sql: ${TABLE}.source IS NOT '%tickets%'

  - measure: count
    type: count
    drill_fields: []

