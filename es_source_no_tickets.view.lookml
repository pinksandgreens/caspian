
- view: es_source_no_tickets
  label: 'Engaged Sciences Source'
  derived_table:
    sql: |
      SELECT *
      FROM implementation.es_source
      WHERE source NOT LIKE '%tickets'

  fields:
  - measure: count
    hidden: TRUE
    type: count
    drill_fields: detail*

  - dimension: source
    hidden: TRUE
    type: string
    sql: ${TABLE}.source

  - dimension: brand
    hidden: TRUE
    label: 'Brand Name'
    type: string
    sql: ${TABLE}.brand

  sets:
    detail:
      - source
      - brand

