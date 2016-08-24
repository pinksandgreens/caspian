- view: social_facebook_posts
  sql_table_name: publications.social_facebook_posts
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - measure: comments_count
    type: sum
    sql: ${TABLE}.comments_count

  - dimension: created_time
    label: 'Created'
    type: time
    timeframes: [date, week, month]
    sql: TO_DATE(${TABLE}.created_time,'YYYY-MM-DD')

  - dimension: Brand
    type: string
    sql: ${TABLE}.from_name

  - measure: likes_count
    type: sum
    sql: ${TABLE}.likes_count

  - dimension: link
    type: string
    sql: ${TABLE}.link

  - dimension: message
    type: string
    sql: ${TABLE}.message

  - measure: shares_count
    type: sum
    sql: ${TABLE}.shares_count

  - dimension: type
    type: string
    sql: ${TABLE}.type

