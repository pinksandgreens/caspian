view: social_facebook_advanced_pages {
  sql_table_name: publications.social_facebook_advanced_pages ;;

  dimension: brand {
    label: "Brand Name"
    type: string
    sql: CASE ${TABLE}.brand
          WHEN 'Absolute Radio' THEN 'Absolute Radio'
          WHEN 'CAR Magazine' THEN 'Car Magazine'
          WHEN 'CFM Radio' THEN 'CFM'
          WHEN 'Closer Magazine' THEN 'Closer'
          WHEN 'Clyde 1' THEN 'Clyde'
          WHEN 'Cool FM' THEN 'Cool FM'
          WHEN 'Empire Magazine' THEN 'Empire'
          WHEN 'Forth 1' THEN 'Forth'
          WHEN 'Free Radio' THEN 'Free'
          WHEN 'Gem 106' THEN 'Gem'
          WHEN 'Grazia UK' THEN 'Grazia'
          WHEN 'Hallam FM' THEN 'Hallam'
          WHEN 'heat' THEN 'Heat'
          WHEN 'Kerrang!' THEN 'Kerrang Magazine'
          WHEN 'Kerrang! Radio' THEN 'Kerrang'
          WHEN 'Key103' THEN 'Key'
          WHEN 'Kiss FM (UK)' THEN 'Kiss'
          WHEN 'KISS FM (UK)' THEN 'Kiss'
          WHEN 'Magic Radio' THEN 'Magic'
          WHEN 'Metro Radio' THEN 'Metro'
          WHEN 'MFR' THEN 'MFR'
          WHEN 'Mother&Baby' THEN 'Mother & Baby'
          WHEN 'Motorcycle News' THEN 'Motorcyclenews'
          WHEN 'Northsound 1' THEN 'Northsound'
          WHEN 'Planet Rock' THEN 'Planet Rock'
          WHEN '96.3 Radio Aire' THEN 'Aire'
          WHEN 'Radio Borders' THEN 'Radio Borders'
          WHEN 'Radio City 96.7' THEN 'City'
          WHEN '97.4 Rock FM' THEN 'Rock FM'
          WHEN 'Tay FM' THEN 'Tay FM'
          WHEN 'TFM' THEN 'TFM'
          WHEN 'The Debrief' THEN 'The Debrief'
          WHEN '96.9 Viking FM' THEN 'Viking'
          WHEN 'Today''s Golfer' THEN 'Todays Golfer'
        ELSE ${TABLE}.brand
      END
       ;;
  }

  dimension_group: created_time {
    label: "Created"
    type: time
    timeframes: [date, week, month]
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }

  measure: page_clicks {
    type: sum
    sql: ${TABLE}.page_clicks ;;
  }

  measure: page_engaged_users {
    type: sum
    sql: ${TABLE}.page_engaged_users ;;
  }

  measure: page_impressions {
    type: sum
    sql: ${TABLE}.page_impressions ;;
  }

  measure: page_impressions_unique {
    type: sum
    sql: ${TABLE}.page_impressions_unique ;;
  }

  measure: page_likes {
    type: sum
    sql: ${TABLE}.page_likes ;;
  }

  measure: page_shares {
    type: sum
    sql: ${TABLE}.page_shares ;;
  }

  measure: page_video_views {
    type: sum
    sql: ${TABLE}.page_video_views ;;
  }

  measure: post_anger {
    type: sum
    sql: ${TABLE}.post_anger ;;
  }

  measure: post_haha {
    type: sum
    sql: ${TABLE}.post_haha ;;
  }

  measure: post_likes {
    type: sum
    sql: ${TABLE}.post_likes ;;
  }

  measure: post_love {
    type: sum
    sql: ${TABLE}.post_love ;;
  }

  measure: post_sorry {
    type: sum
    sql: ${TABLE}.post_sorry ;;
  }

  measure: post_wow {
    type: sum
    sql: ${TABLE}.post_wow ;;
  }

  dimension: image_filewow {
    hidden: yes
    sql: ('http://i.imgur.com/pTHoxCy.png') ;;
  }

  dimension: image_filewow2 {
    hidden: yes
    sql: ${image_filewow} ;;
    html: <img src="{{ value }}" width="100" 0height="100"/>;;
  }

  dimension: image_filesad {
    hidden: yes
    sql: ('http://i.imgur.com/H6wvf3V.png') ;;
  }

  dimension: image_filesad2 {
    hidden: yes
    sql: ${image_filesad} ;;
    html: <img src="{{ value }}" width="100" 0height="100"/>;;
  }

  dimension: image_fileangry {
    hidden: yes
    sql: ('http://i.imgur.com/jE0KGIz.png') ;;
  }

  dimension: image_fileangry2 {
    hidden: yes
    sql: ${image_fileangry} ;;
    html: <img src="{{ value }}" width="100" 0height="100"/>;;
  }

  dimension: image_filehaha {
    hidden: yes
    sql: ('http://i.imgur.com/QUKr7Bv.png') ;;
  }

  dimension: image_filehaha2 {
    hidden: yes
    sql: ${image_filehaha} ;;
    html: <img src="{{ value }}" width="100" 0height="100"/>;;
  }

  dimension: image_filelove {
    hidden: yes
    sql: ('http://i.imgur.com/uJMysxN.png') ;;
  }

  dimension: image_filelove2 {
    hidden: yes
    sql: ${image_filelove} ;;
    html: <img src="{{ value }}" width="100" 0height="100"/>;;
  }

  dimension: image_filelike {
    hidden: yes
    sql: ('http://i.imgur.com/Do2j40j.png') ;;
  }

  dimension: image_filelike2 {
    hidden: yes
    sql: ${image_filelike} ;;
    html: <img src="{{ value }}" width="100" 0height="100"/>;;
  }

  dimension: image_filewowgif {
    hidden: yes
    sql: ('http://emojipedia-us.s3.amazonaws.com/content/2015/10/11/facebook-emoji-reactions.gif') ;;
  }

  dimension: image_filewowgif2 {
    hidden: yes
    sql: ${image_filewowgif} ;;
    html: <img src="{{ value }}" width="1000" 0height="1000"/>;;
  }
}
