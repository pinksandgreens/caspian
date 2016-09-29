- view: social_youtube_likes_not_our_brands
  sql_table_name: publications.social_youtube_likes_not_our_brands
  fields:

  - dimension: brand
    type: string
    sql: |
      CASE ${TABLE}.brand
        WHEN 'Key103' THEN 'Key 103'
        WHEN 'Northsound 1' THEN 'Northsound 1'
        WHEN 'KISS FM UK' THEN 'Kiss'
        WHEN 'Radio Aire' THEN 'Radio Aire'
        WHEN 'Radio Borders' THEN 'Radio Borders'
        WHEN 'Radio City 96.7' THEN 'Radio City'
        WHEN 'rockfm974' THEN 'Rock FM'
        WHEN 'Clyde 1' THEN 'Clyde 1'
        WHEN '974coolfm' THEN 'Cool FM'
        WHEN 'Forth 1' THEN 'Forth 1'
        WHEN 'hallamfm' THEN 'Hallam FM'
        WHEN 'Magic Radio' THEN 'Magic'
        WHEN 'metroradiouk' THEN 'Metro Radio'
        WHEN 'MorayFirthRadio' THEN 'MFR'
        WHEN 'NA' THEN 'Tay FM'
        WHEN 'tfmradio' THEN 'TFM Radio'
        WHEN 'Absolute Radio' THEN 'Absolute Radio'
        WHEN 'CFMRadio' THEN 'CFM Radio'
        WHEN 'Empire Magazine' THEN 'Empire'
        WHEN 'Parkers' THEN 'Parkers'
        WHEN 'heat, heatworld & heat Radio' THEN 'Heat'
        WHEN 'CARmagazineTV' THEN 'Car Magazine'
        WHEN 'vikingfmvideos' THEN '96.9 Viking FM'
        WHEN 'MCN - Motorcyclenews.com' THEN 'Motorcycle News'
        WHEN 'Closer' THEN 'Closer Magazine'
        WHEN 'Grazia UK' THEN 'Grazia UK'
        WHEN 'The Debrief' THEN 'The Debrief'
        WHEN 'MaybellineNYUK' THEN 'Maybelline UK'
        ELSE ${TABLE}.brand
      END
      
  - measure: Views
    type: sum
    sql: ${TABLE}.views

  - measure: Comment
    type: sum
    sql: ${TABLE}.comments
    
  - measure: Subscribers
    type: sum
    sql: ${TABLE}.subscribers

  - measure: Number_of_Videos
    type: sum
    sql: ${TABLE}.video_count


