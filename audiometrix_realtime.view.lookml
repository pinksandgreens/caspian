- view: audiometrix_realtime
  sql_table_name: publications.audiometrix_realtime_unique
  fields:

  - dimension: id
    type: string
    sql: ${TABLE}.id

  - measure: active_sessions
    type: sum
    sql: ${TABLE}.active_sessions
    
  - measure: avg_active_sessions
    type: avg
    sql: ${TABLE}.active_sessions
    
  - measure: total_sessions_today
    type: sum
    sql: ${TABLE}.total_sessions_today

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: tracktitle
    type: string
    sql: ${TABLE}.tracktitle
    
  - dimension: artist
    type: string
    sql: ${TABLE}.artist
    
  - dimension: song_and_artist
    type: string
    sql: ${tracktitle} || ' - ' || ${artist}

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [time, hour, date, week, month]
    convert_tz: true
    sql: CONVERT_TIMEZONE('UTC','BST',${TABLE}.date::timestamp) # BST/GMT depending on date

  - dimension: image_file
    hidden: FALSE
    sql: ${TABLE}.image
    
  - dimension: Artist_Image
    hidden: FALSE
    sql: ${image_file}
    html: <img src="{{ value }}" width="300" height="300"/>
    
  - dimension: image_file2
    hidden: TRUE
    sql: ('http://i.imgur.com/ufq8vsh.png')
    
  - dimension: Artist_Image2
    hidden: TRUE
    sql: ${image_file2}
    html: <img src="{{ value }}" width="380" height="200"/>    

  - dimension: image_file3
    hidden: TRUE
    sql: ('http://i.imgur.com/Rt2aWL7.png')
    
  - dimension: Artist_Image3
    hidden: TRUE
    sql: ${image_file3}
    html: <img src="{{ value }}" width="380" height="200"/>

  - dimension: image_file4
    hidden: TRUE
    sql: ('http://i.imgur.com/1T6Aott.jpg')
    
  - dimension: Artist_Image4
    hidden: TRUE
    sql: ${image_file4}
    html: <img src="{{ value }}" width="380" height="200"/>
    
  - measure: count
    type: count
    drill_fields: []
    

