- view: social_reddit
  sql_table_name: publications.social_reddit
  fields:

  - dimension: id
    type: string
    hidden: TRUE
    sql: ${TABLE}.id

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: url
    type: string
    sql: ${TABLE}.url
    
  - dimension: thread
    type: string
    sql: ${TABLE}.thread

  - dimension: date
    type: date
    sql: ${TABLE}.date
    
  - measure: score
    type: sum
    sql: ${TABLE}.source_score