- view: ga_radio_social_data
  sql_table_name: publications.ga_radio_social_data
  fields:

  - dimension: brand
    type: string
    sql: |
      CASE ${TABLE}.brand
        WHEN 'Key103' THEN 'Key 103'
        WHEN 'Northsound 1' THEN 'Northsound 1'
        WHEN 'Kiss FM (UK)' THEN 'Kiss FM'
        WHEN '96.3 Radio Aire' THEN 'Radio Aire'
        WHEN 'Radio Borders' THEN 'Radio Borders'
        WHEN 'Radio City 96.7' THEN 'Radio City'
        WHEN '97.4 Rock FM' THEN 'Rock FM'
        WHEN 'Clyde 1' THEN 'Clyde 1'
        WHEN 'Cool FM' THEN 'Cool FM'
        WHEN 'Forth 1' THEN 'Forth 1'
        WHEN 'Hallam FM' THEN 'Hallam FM'
        WHEN 'Magic' THEN 'Magic'
        WHEN 'Metro Radio' THEN 'Metro Radio'
        WHEN 'MFR' THEN 'MFR'
        WHEN 'Tay FM' THEN 'Tay FM'
        WHEN 'TFM' THEN 'TFM Radio'
        WHEN 'Absolute Radio' THEN 'Absolute Radio'
        WHEN 'CFM Radio' THEN 'CFM Radio'
      END

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

