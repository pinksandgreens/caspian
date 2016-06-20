- view: ga_radio_social_data
  sql_table_name: publications.ga_radio_social_data
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: f1
    type: string
    sql: ${TABLE}.f1

  - dimension: fav_count
    type: string
    sql: ${TABLE}.fav_count

  - dimension: fb_sessions_web
    type: string
    sql: ${TABLE}.fb_sessions_web

  - dimension: fb_users_web
    type: string
    sql: ${TABLE}.fb_users_web

  - dimension: label
    type: date
    sql: ${TABLE}.label

  - dimension: page_engaged_users
    type: string
    sql: ${TABLE}.page_engaged_users

  - dimension: page_impressions_unique
    type: string
    sql: ${TABLE}.page_impressions_unique

  - dimension: page_impressions_viral_unique
    type: string
    sql: ${TABLE}.page_impressions_viral_unique

  - dimension: retweets
    type: string
    sql: ${TABLE}.retweets

  - dimension: tw_sessions_web
    type: string
    sql: ${TABLE}.tw_sessions_web

  - dimension: tw_users_web
    type: string
    sql: ${TABLE}.tw_users_web

  - dimension: week
    type: string
    sql: ${TABLE}.week

  - measure: count
    type: count
    drill_fields: []

