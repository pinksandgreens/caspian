- view: social_youtube_videos
  sql_table_name: publications.social_youtube_videos
  fields:

  - dimension: channel
    type: string
    sql: ${TABLE}.channel

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension: dislikes
    type: string
    sql: ${TABLE}.dislikes

  - dimension: etag
    type: string
    sql: ${TABLE}.etag

  - dimension: likes
    type: string
    sql: ${TABLE}.likes

  - dimension: published_date
    type: string
    sql: ${TABLE}.published_date

  - dimension: thumbnail
    type: string
    sql: ${TABLE}.thumbnail

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: video_id
    type: string
    sql: ${TABLE}.video_id

  - dimension: views
    type: string
    sql: ${TABLE}.views

  - measure: count
    type: count
    drill_fields: []

