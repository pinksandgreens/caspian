- view: brand_lookup
  sql_table_name: publications.brand_lookup
  fields:

  - dimension: bra_business
    type: string
    sql: ${TABLE}.bra_business

  - dimension: bra_code
    type: string
    sql: ${TABLE}.bra_code

  - dimension: bra_comments
    type: string
    sql: ${TABLE}.bra_comments

  - dimension: bra_description
    type: string
    sql: ${TABLE}.bra_description

  - dimension: bra_market
    type: string
    sql: ${TABLE}.bra_market

  - dimension: bra_obsolete
    type: string
    sql: ${TABLE}.bra_obsolete

  - dimension: bra_parent_code
    type: string
    sql: ${TABLE}.bra_parent_code

  - measure: count
    type: count
    drill_fields: []

