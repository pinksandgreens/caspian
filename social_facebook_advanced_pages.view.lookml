- view: social_facebook_advanced_pages
  sql_table_name: publications.social_facebook_advanced_pages
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: created_time
    label: 'Created'
    type: time
    timeframes: [date, week, month]
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD')

  - measure: page_clicks
    type: sum
    sql: ${TABLE}.page_clicks

  - measure: page_engaged_users
    type: sum
    sql: ${TABLE}.page_engaged_users

  - measure: page_impressions
    type: sum
    sql: ${TABLE}.page_impressions

  - measure: page_impressions_unique
    type: sum
    sql: ${TABLE}.page_impressions_unique

  - measure: page_likes
    type: sum
    sql: ${TABLE}.page_likes

  - measure: page_shares
    type: sum
    sql: ${TABLE}.page_shares

  - measure: page_video_views
    type: sum
    sql: ${TABLE}.page_video_views

  - measure: post_anger
    type: sum
    sql: ${TABLE}.post_anger

  - measure: post_haha
    type: sum
    sql: ${TABLE}.post_haha

  - measure: post_likes
    type: sum
    sql: ${TABLE}.post_likes

  - measure: post_love
    type: sum
    sql: ${TABLE}.post_love

  - measure: post_sorry
    type: sum
    sql: ${TABLE}.post_sorry

  - measure: post_wow
    type: sum
    sql: ${TABLE}.post_wow


