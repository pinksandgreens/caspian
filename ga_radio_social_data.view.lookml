- view: ga_radio_social_data
  sql_table_name: publications.ga_radio_social_data
  label: 'Social Data'
  fields:

  - dimension: brand
    type: string
    sql: |
      CASE ${TABLE}.brand
        WHEN 'Key103' THEN 'Key 103'
        WHEN 'Northsound 1' THEN 'Northsound 1'
        WHEN 'Kiss FM (UK)' THEN 'Kiss'
        WHEN '96.3 Radio Aire' THEN 'Radio Aire'
        WHEN 'Radio Borders' THEN 'Radio Borders'
        WHEN 'Radio City 96.7' THEN 'Radio City'
        WHEN '97.4 Rock FM' THEN 'Rock FM'
        WHEN 'Clyde 1' THEN 'Clyde 1'
        WHEN 'Cool FM' THEN 'Cool FM'
        WHEN 'Forth 1' THEN 'Forth 1'
        WHEN 'Hallam FM' THEN 'Hallam FM'
        WHEN 'Magic Radio' THEN 'Magic'
        WHEN 'Metro Radio' THEN 'Metro Radio'
        WHEN 'MFR' THEN 'MFR'
        WHEN 'Tay FM' THEN 'Tay FM'
        WHEN 'TFM' THEN 'TFM Radio'
        WHEN 'Absolute Radio' THEN 'Absolute Radio'
        WHEN 'CFM Radio' THEN 'CFM Radio'
      END

#  - dimension: f1
#    type: string
#    sql: ${TABLE}.f1

  - measure: fav_count
    label: 'Twitter Favourite Count'
    type: number
    sql: sum_distinct(${TABLE}.fav_count)
    drill_fields: [brand, label, fb_users_web, tw_users_web]

#  - measure: fb_sessions_web
#    label: 'Facebook Sessions Count'
#    type: number
#    sql: SUM(${TABLE}.fb_sessions_web)
#    drill_fields: [brand, label, fb_users_web, tw_users_web]

  - measure: fb_users_web
    label: 'Facebook Users Count'
    type: number
    sql: sum(${TABLE}.fb_users_web)
    drill_fields: [brand, label, fb_users_web, tw_users_web]

  - dimension: label
    label: 'Week Starting'
    primary_key: true
    type: date
    sql: ${TABLE}.label
#
#  - measure: page_engaged_users
#    label: 'Facebook Engaged Users Count'
#    type: number
#    drill_fields: [brand, label, fb_users_web, tw_users_web]
#    sql: SUM(${TABLE}.page_engaged_users)

#  - measure: page_impressions_unique
#    label: 'Facebook Unique Page Impressions Count'
#    type: number
#    sql: SUM(${TABLE}.page_impressions_unique)
#    drill_fields: [brand, label, fb_users_web, tw_users_web]

#  - measure: page_impressions_viral_unique
#    label: 'Facebook Viral Impressions Count'
#    type: number
#    sql: SUM(${TABLE}.page_impressions_viral_unique)
#    drill_fields: [brand, label, fb_users_web, tw_users_web]

  - measure: retweets
    label: 'Twitter Retweets'
    type: number
    sql: SUM(${TABLE}.retweets)
    drill_fields: [brand, label, fb_users_web, tw_users_web]

#  - measure: tw_sessions_web
#    label: 'Twitter Sessions Count'
#    type: number
#    sql: SUM(${TABLE}.tw_sessions_web)
#    drill_fields: [brand, label, fb_users_web, tw_users_web]

  - measure: tw_users_web
    label: 'Twitter Users Count'
    type: number
    sql: SUM(${TABLE}.tw_users_web)
    drill_fields: [brand, label, fb_users_web, tw_users_web]

#  - dimension: week
#    type: string
#    sql: ${TABLE}.week

#  - measure: count
#    type: count
#    drill_fields: [brand, label, fb_users_web, tw_users_web]

