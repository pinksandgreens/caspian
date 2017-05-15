view: social_facebook_advanced_pages {
  sql_table_name: publications.social_facebook_advanced_pages ;;

  dimension: brand {
    label: "Brand Name"
    type: string
    sql: CASE ${TABLE}.brand
         WHEN 'AbsoluteRadio' THEN 'Absolute Radio'
         WHEN 'key103' THEN 'Key'
         WHEN 'radioaire' THEN 'Aire'
         WHEN 'MotorcycleNews' THEN 'Motorcyclenews'
         WHEN 'empiremagazine' THEN 'Empire'
         WHEN 'planetrockradio' THEN 'Planet Rock'
         WHEN 'cfmradio' THEN 'CFM'
         WHEN 'KissFMUK' THEN 'Kiss'
         WHEN 'radioborders' THEN 'Borders'
         WHEN 'closermag' THEN 'Closer'
         WHEN 'CARmagazine' THEN 'Car Magazine'
         WHEN 'kerrangradio' THEN 'Kerrang'
         WHEN 'clyde1' THEN 'Clyde'
         WHEN 'magicradio' THEN 'Magic'
         WHEN 'radiocity' THEN 'City'
         WHEN 'GraziaUK' THEN 'Grazia'
         WHEN 'kerrangmagazine' THEN 'Kerrang Magazine'
         WHEN 'officialcoolfm' THEN 'Cool FM'
         WHEN 'metroradiouk' THEN 'Metro'
         WHEN '974rockfm' THEN 'Rock FM'
         WHEN 'thedebrief' THEN 'The Debrief'
         WHEN 'motherandbaby' THEN 'Mother & Baby'
         WHEN 'forthone' THEN 'Forth'
         WHEN 'MorayFirthRadio' THEN 'MFR'
         WHEN 'tayfm' THEN 'Tay FM'
         WHEN 'vikingfm' THEN 'Viking FM'
         WHEN 'gem106fm' THEN 'Gem'
         WHEN 'hallamfm' THEN 'Hallam'
         WHEN 'northsound1' THEN 'Northsound'
         WHEN 'tfmradio' THEN 'TFM'
         WHEN 'heatworld' THEN 'Heat'
         WHEN 'wearefreeradio' THEN 'Free'
         WHEN 'TheTodaysGolfer' THEN 'Todays Golfer'
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

  dimension: 30_day_buckets  {
    type: number
    label: "30 Days"
    description: "Bucket [1] = Past 30 Days, [2] = Past 31 - 60 Days"
    sql:  CASE
                WHEN DATEDIFF(day,CAST(date AS DATE),(CURRENT_DATE-3)) BETWEEN 3 AND 32 THEN 1 --Amended range for Greg's Presentation
                WHEN DATEDIFF(day,CAST(date AS DATE),(CURRENT_DATE-3)) BETWEEN 33 AND 62 THEN 2 --Amended range for Greg's Presentation
            END ;;
  }

}
