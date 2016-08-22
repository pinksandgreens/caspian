- view: social_facebook_posts
  sql_table_name: publications.social_facebook_posts
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: comments_count
    type: string
    sql: ${TABLE}.comments_count

  - dimension: created_time
    type: string
    sql: ${TABLE}.created_time

  - dimension: from_name
    type: string
    sql: ${TABLE}.from_name

  - dimension: likes_count
    type: string
    sql: ${TABLE}.likes_count

  - dimension: link
    type: string
    sql: ${TABLE}.link

  - dimension: message
    type: string
    sql: ${TABLE}.message

  - dimension: shares_count
    type: string
    sql: ${TABLE}.shares_count

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - measure: count
    type: count
    drill_fields: [id, from_name, created_time]

