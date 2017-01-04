- view: social_instagram_likes
  sql_table_name: publications.social_instagram_likes
  fields:

  - dimension: brand
    type: string
    sql: |
      CASE ${TABLE}.brand
        WHEN 'Key103' THEN 'Key 103'
        WHEN 'Northsound 1' THEN 'Northsound 1'
        WHEN 'KISS FM UK' THEN 'Kiss'
        WHEN 'Kiss' THEN 'Kiss'
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
        WHEN 'Tay FM' THEN 'Tay FM'
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
        WHEN 'Top Sante' THEN 'Top Sante'
        WHEN 'Kerrang' THEN 'Kerrang'
        WHEN 'Q' THEN 'Q'
        WHEN 'Match' THEN 'Match'
        WHEN 'Mother & Baby' THEN 'Mother & Baby'
        ELSE ${TABLE}.brand
      END
      
  - measure: Followers
    type: sum
    sql: ${TABLE}.followers

  - dimension: Number_of_Posts2
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.media = 'NA' THEN '0'
        ELSE ${TABLE}.media
      END

  - measure: Number_of_Posts
    type: sum
    sql: ${Number_of_Posts2}


