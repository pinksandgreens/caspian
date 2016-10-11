- view: social_reddit
  sql_table_name: publications.social_reddit
  fields:

  - dimension: title
    type: string
    sql: LEFT(${TABLE}.title,70)

  - dimension: thread
    type: string
    sql: ${TABLE}.thread
    
  - dimension: reddit_url
    type: string
    sql: ${TABLE}.reddit_url
    
  - dimension: url
    type: string
    sql: ${TABLE}.url
    
  - measure: score
    type: sum
    sql: ${TABLE}.source_score
    
  - measure: comments_count
    type: sum
    sql: ${TABLE}.source_comments
    
  - dimension: date
    type: date
    sql: ${TABLE}.date
    