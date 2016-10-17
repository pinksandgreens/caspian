- view: bk_topline_ukus
  sql_table_name: publications.bk_topline_ukus
  fields:

  - dimension: category_id
    type: number
    sql: ${TABLE}.category_id

  - dimension: path
    type: string
    sql: ${TABLE}.path

  - dimension: reach
    type: number
    sql: ${TABLE}.reach

  - dimension: reach2
    type: number
    sql: ${TABLE}."reach(2)"

  - measure: total_reach
    label: 'Total Audience Reach'
    type: number
    sql: ${TABLE}.reach

  - measure: total_reach2
    label: 'UK Audience Reach'
    type: number
    sql: ${TABLE}."reach(2)"    
    