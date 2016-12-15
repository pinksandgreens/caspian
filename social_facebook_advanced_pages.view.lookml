- view: social_facebook_advanced_pages
  sql_table_name: publications.social_facebook_advanced_pages
  fields:

  - dimension: brand
    label: 'Brand Name'
    type: string
    sql: |
      CASE ${TABLE}.brand
        WHEN 'AbsoluteRadio' THEN 'Absolute Radio'
        WHEN 'key103' THEN 'Key 103'
        WHEN 'radioaire' THEN 'Radio Aire'
        WHEN 'MotorcycleNews' THEN 'Motorcycle News'
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
        ELSE ${TABLE}.brand
      END

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


