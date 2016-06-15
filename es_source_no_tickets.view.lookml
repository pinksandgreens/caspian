
- view: es_source_no_tickets
  derived_table:
    sql: |
      SELECT *
      FROM implementation.es_source
      --WHERE source NOT LIKE '%tickets'

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: source
    type: string
    sql: ${TABLE}.source

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  sets:
    detail:
      - source
      - brand

