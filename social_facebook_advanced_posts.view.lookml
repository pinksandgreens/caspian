- view: social_facebook_advanced_posts
  sql_table_name: publications.social_facebook_advanced_posts
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - measure: angry_count
    type: sum
    sql: ${TABLE}.angry_count

  - measure: comments_count
    type: sum
    sql: ${TABLE}.comments_count

    
  - dimension: created_time
    label: 'Created'
    type: time
    sql: ${TABLE}.created_time::timestamp

  - dimension: from_name
    type: string
    sql: ${TABLE}.from_name

  - measure: haha_count
    type: sum
    sql: ${TABLE}.haha_count

  - measure: likes_count
    type: sum
    sql: ${TABLE}.likes_count

  - dimension: link
    type: string
    sql: ${TABLE}.link

  - measure: love_count
    type: sum
    sql: ${TABLE}.love_count

  - dimension: message
    type: string
    sql: ${TABLE}.message

  - measure: post_clicks
    type: sum
    sql: ${TABLE}.post_clicks

  - measure: post_org_reach
    type: sum
    sql: ${TABLE}.post_org_reach

  - measure: post_paid_reach
    type: sum
    sql: ${TABLE}.post_paid_reach

  - measure: post_reach
    type: sum
    sql: ${TABLE}.post_reach

  - measure: post_reach_unique
    type: sum
    sql: ${TABLE}.post_reach_unique

  - measure: post_video_avg_time_watched
    type: avg
    sql: ${TABLE}.post_video_avg_time_watched

  - measure: post_video_view_time
    type: sum
    sql: ${TABLE}.post_video_view_time

  - measure: post_video_views_10s
    type: sum
    sql: ${TABLE}.post_video_views_10s

  - measure: post_video_views_unique
    type: sum
    sql: ${TABLE}.post_video_views_unique

  - measure: post_viral_reach
    type: sum
    sql: ${TABLE}.post_viral_reach

  - measure: sad_count
    type: sum
    sql: ${TABLE}.sad_count

  - measure: shares_count
    type: sum
    sql: ${TABLE}.shares_count

  - dimension: story
    type: string
    sql: ${TABLE}.story

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - measure: wow_count
    type: sum
    sql: ${TABLE}.wow_count


