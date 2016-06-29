
- view: es_source_no_tickets
  label: 'Engaged Sciences Source'
  derived_table:
    sql: |
      SELECT *
      FROM implementation.es_source
      WHERE source NOT LIKE '%tickets'

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: source
    type: string
    sql: ${TABLE}.source

  - dimension: brand
    label: 'Brand Name'
    type: string
    sql: ${TABLE}.brand

  sets:
    detail:
      - source
      - brand

