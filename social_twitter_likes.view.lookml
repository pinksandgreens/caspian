- view: social_twitter_likes
  sql_table_name: publications.social_twitter_likes
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: name
    type: string
    sql: |
      CASE ${TABLE}.name
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
        WHEN 'Empire Magazine' THEN 'Empire'
        WHEN 'Parkers' THEN 'Parkers'
        ELSE ${TABLE}.name
      END
      
  - dimension: url
    type: number
    sql: ${TABLE}.url

  - dimension: location
    type: string
    sql: ${TABLE}.location
    
  - measure: statusesCount
    label: 'Statuses Count'
    type: average
    sql: ${TABLE}.statusesCount

  - measure: followersCount
    label: 'Followers Count'
    type: average
    sql: ${TABLE}.followersCount

  - measure: favouritesCount
    label: 'Tweet Favourite Count'
    type: average
    sql: ${TABLE}.favoritesCount

  - measure: friendsCount
    label: 'Twitter Friends Count'
    type: average
    sql: ${TABLE}.friendsCount
    
  - measure: Twitter_Engagement
    value_format: '#.00%'  
    type: number
    sql: ${social_twitter_likes.favouritesCount}/${social_twitter_likes.statusesCount}


