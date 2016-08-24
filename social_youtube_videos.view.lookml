- view: social_youtube_videos
  sql_table_name: publications.social_youtube_videos
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.channel

  - measure: comments
    type: sum
    sql: ${TABLE}.comments

  - measure: dislikes
    type: sum
    sql: ${TABLE}.dislikes

  - dimension: etag
    type: string
    sql: ${TABLE}.etag

  - measure: likes
    type: sum
    sql: ${TABLE}.likes

  - dimension: published_date
    label: 'Created'
    type: time
    timeframes: [date, week, month]
    sql: TO_DATE(${TABLE}.published_date,'YYYY-MM-DD')

  - dimension: thumbnail
    type: string
    sql: ${TABLE}.thumbnail

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: video_id
    type: string
    sql: ${TABLE}.video_id

  - measure: views
    type: sum
    sql: ${TABLE}.views

