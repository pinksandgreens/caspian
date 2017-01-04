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

  - dimension: link
    type: string
    sql: ${TABLE}.link

  - dimension: longitude
    type: string
    sql: ${TABLE}.longitude

  - dimension: name
    label: 'Brand'
    type: string
    sql: |
      CASE ${TABLE}.name
        WHEN 'Key103' THEN 'Key 103'
        WHEN 'Northsound 1' THEN 'Northsound 1'
        WHEN 'KISS FM (UK)' THEN 'Kiss'
        WHEN 'KissFMUK' THEN 'Kiss'
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
        WHEN 'heat' THEN 'Heat'
        WHEN 'CAR Magazine' THEN 'Car Magazine'
        WHEN 'Top Sant? Magazine' THEN 'Top Sante'
        WHEN 'Kerrang!' THEN 'Kerrang'
        WHEN 'Q Magazine' THEN 'Q'
        WHEN 'MATCH Magazine' THEN 'Match'
        WHEN 'Mother&Baby' THEN 'Mother & Baby'
        ELSE ${TABLE}.name
      END
      

  - dimension: username
    type: string
    sql: ${TABLE}.username

  - dimension: website
    type: string
    sql: ${TABLE}.website
    
  - measure: likes
    type: sum
    sql: ${TABLE}.likes
    
  - measure: talking_about_count
    type: sum
    sql: ${TABLE}.talking_about_count
    
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
    sql: ('http://i.imgur.com/QtkpqLN.png')
    
  - dimension: product_image2
    hidden: TRUE
    sql: ${image_file2}
    html: <img src="{{ value }}" width="100" height="80"/>
    
  - dimension: image_file3
    hidden: TRUE
    sql: ('http://i.imgur.com/UA5rtyv.png')
    
  - dimension: product_image3
    hidden: TRUE
    sql: ${image_file3}
    html: <img src="{{ value }}" width="200" 0height="200"/>
    
  - dimension: image_file4
    hidden: TRUE
    sql: ('http://i.imgur.com/wmUe83x.jpg')
    
  - dimension: product_image4
    hidden: TRUE
    sql: ${image_file4}
    html: <img src="{{ value }}" width="120" 0height="120"/>

  - dimension: image_file5
    hidden: TRUE
    sql: ('http://i.imgur.com/qamDfJA.png')
    
  - dimension: product_image5
    hidden: TRUE
    sql: ${image_file5}
    html: <img src="{{ value }}" width="120" 0height="120"/>

  - dimension: image_file6
    hidden: TRUE
    sql: ('http://i.imgur.com/7RZFc1B.png')
    
  - dimension: product_image6
    hidden: TRUE
    sql: ${image_file6}
    html: <img src="{{ value }}" width="150" 0height="150"/>
    
  - dimension: image_file7
    hidden: TRUE
    sql: ('http://i.imgur.com/5XWT0zW.png')
    
  - dimension: product_image7
    hidden: TRUE
    sql: ${image_file7}
    html: <img src="{{ value }}" width="150" 0height="150"/>
    
  - dimension: image_file8
    hidden: TRUE
    sql: ('http://i.imgur.com/jq9O2lW.jpg')
    
  - dimension: product_image8
    hidden: TRUE
    sql: ${image_file8}
    html: <img src="{{ value }}" width="150" 0height="150"/> 
    
  - dimension: image_file9
    hidden: TRUE
    sql: ('http://i.imgur.com/83hrfgH.png')
    
  - dimension: product_image9
    hidden: TRUE
    sql: ${image_file9}
    html: <img src="{{ value }}" width="150" 0height="150"/> 
    
  - dimension: image_file10
    hidden: TRUE
    sql: ('http://i.imgur.com/w32hvz8.jpg')
    
  - dimension: product_image10
    hidden: TRUE
    sql: ${image_file10}
    html: <img src="{{ value }}" width="150" 0height="150"/> 
    
  - dimension: image_file11
    hidden: TRUE
    sql: ('http://i.imgur.com/ufq8vsh.png')
    
  - dimension: product_image11
    hidden: FALSE
    sql: ${image_file11}
    html: <img src="{{ value }}" width="200" 0height="200"/> 

# ALEX TEST TO ADD MCN

  - dimension: image_file12
    hidden: TRUE
    sql: ('http://i.imgur.com/FsnIbfg.png')
    
  - dimension: product_image12
    hidden: FALSE
    sql: ${image_file12}
    html: <img src="{{ value }}" width="200" 0height="200"/> 
  
