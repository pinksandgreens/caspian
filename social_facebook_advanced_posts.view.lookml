- view: social_facebook_advanced_posts
  sql_table_name: publications.social_facebook_advanced_posts
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - measure: angry_count
    type: sum
    sql: |
      CASE
        WHEN ${TABLE}.angry_count = 'NA' THEN '0'
        ELSE ${TABLE}.angry_count
      END

  - measure: comments_count
    type: sum
    sql: ${TABLE}.comments_count

    
  - dimension: created_time
    label: 'Created'
    type: time
    sql: ${TABLE}.created_time::timestamp

  - dimension: from_name
    label: 'Brand Name'
    type: string
    sql: |
      CASE ${TABLE}.from_name
        WHEN 'key103' THEN 'Key 103'
        WHEN 'radioaire' THEN 'Radio Aire'
        WHEN 'MotorcycleNews' THEN 'Motor Cyclenews'
        WHEN 'empiremagazine' THEN 'Empire'
        WHEN 'planetrockradio' THEN 'Planet Rock'
        WHEN 'cfmradio' THEN 'CFM Radio'
        WHEN 'KissFMUK' THEN 'Kiss'
        WHEN 'radioborders' THEN 'Radio Borders'
        WHEN 'closermag' THEN 'Closer'
        WHEN 'CARmagazine' THEN 'Car Magazine'
        WHEN 'kerrangradio' THEN 'Kerrang! 105.2'
        WHEN 'clyde1' THEN 'Clyde 1'
        WHEN 'magicradio' THEN 'Magic'
        WHEN 'radiocity' THEN 'Radio City'
        WHEN 'GraziaUK' THEN 'Grazia'
        WHEN 'kerrangmagazine' THEN 'Kerrang'
        WHEN 'officialcoolfm' THEN 'Cool FM'
        WHEN 'metroradiouk' THEN 'Metro Radio'
        WHEN '974rockfm' THEN 'Rock FM'
        WHEN 'thedebrief' THEN 'The Debrief'
        WHEN 'motherandbaby' THEN 'Mother & Baby'
        WHEN 'forthone' THEN 'Forth 1'
        WHEN 'MorayFirthRadio' THEN 'MFR'
        WHEN 'tayfm' THEN 'Tay FM'
        WHEN 'vikingfm' THEN 'Viking FM'
        WHEN 'gem106fm' THEN 'Gem 106'
        WHEN 'hallamfm' THEN 'Hallam FM'
        WHEN 'northsound1' THEN 'Northsound 1'
        WHEN 'tfmradio' THEN 'TFM Radio'
        WHEN 'heatworld' THEN 'Heat'
        WHEN 'wearefreeradio' THEN 'Free'
        ELSE ${TABLE}.from_name
      END

  - measure: haha_count
    type: sum
    sql: |
      CASE
        WHEN ${TABLE}.haha_count = 'NA' THEN '0'
        ELSE ${TABLE}.haha_count
      END

  - measure: likes_count
    type: sum
    sql: |
      CASE
        WHEN ${TABLE}.likes_count = 'NA' THEN '0'
        ELSE ${TABLE}.likes_count
      END
    
  - dimension: link
    label: 'Link'
    hidden: FALSE
    type: string
    sql: ${TABLE}.link
    html: |
      <a href="{{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>

  - measure: love_count
    type: sum
    sql: |
      CASE
        WHEN ${TABLE}.love_count = 'NA' THEN '0'
        ELSE ${TABLE}.love_count
      END

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
    label: 'Post Avg Video View Time (sec)'
    type: avg
    sql: ${TABLE}.post_video_avg_time_watched/1000

  - measure: post_video_view_time
    label: 'Post Video View Time (sec)'
    type: sum
    sql: ${TABLE}.post_video_view_time/1000

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
    sql: |
      CASE
        WHEN ${TABLE}.sad_count = 'NA' THEN '0'
        ELSE ${TABLE}.sad_count
      END

  - measure: shares_count
    type: sum
    sql: |
      CASE
        WHEN ${TABLE}.shares_count = 'NA' THEN '0'
        ELSE ${TABLE}.shares_count
      END

  - dimension: story
    type: string
    sql: ${TABLE}.story

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - measure: wow_count
    type: sum
    sql: |
      CASE
        WHEN ${TABLE}.wow_count = 'NA' THEN '0'
        ELSE ${TABLE}.wow_count
      END

  - measure: reactions_count
    label: 'Reactions Total'
    type: number
    sql: (${wow_count})+(${sad_count})+(${angry_count})+(${haha_count})+(${likes_count})+(${love_count})
