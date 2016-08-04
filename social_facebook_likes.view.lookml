- view: social_facebook_likes
  sql_table_name: publications.social_facebook_likes
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: category
    type: string
    sql: ${TABLE}.category

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: latitude
    type: string
    sql: ${TABLE}.latitude

  - dimension: likes
    type: number
    sql: ${TABLE}.likes

  - dimension: link
    type: string
    sql: ${TABLE}.link

  - dimension: longitude
    type: string
    sql: ${TABLE}.longitude

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
      
  - dimension: talking_about_count
    type: number
    sql: ${TABLE}.talking_about_count

  - dimension: username
    type: string
    sql: ${TABLE}.username

  - dimension: website
    type: string
    sql: ${TABLE}.website

  - measure: count
    type: count
    drill_fields: [id, name, username]
    
    
    
  - dimension: image_file
    hidden: TRUE
    sql: ('http://i.imgur.com/LVy5xWL.png')
    
  - dimension: product_image
    hidden: TRUE
    sql: ${image_file}
    html: <img src="{{ value }}" width="300" height="300"/>
    
  - dimension: image_file1
    hidden: TRUE
    sql: ('http://i.imgur.com/Tsef7zl.jpg')
    
  - dimension: product_image1
    hidden: TRUE
    sql: ${image_file1}
    html: <img src="{{ value }}" width="80" height="80"/>
    
  - dimension: image_file2
    hidden: TRUE
    sql: ('http://i.imgur.com/b7OVZQm.png')
    
  - dimension: product_image2
    hidden: TRUE
    sql: ${image_file2}
    html: <img src="{{ value }}" width="80" height="100"/>

