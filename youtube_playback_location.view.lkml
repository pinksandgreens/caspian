view: youtube_playback_location {

  sql_table_name: Youtube.p_content_owner_playback_location_a2_Youtube;;

  dimension_group: date {
    label: ""
    type: time
    sql: TIMESTAMP(${TABLE}.date) ;;
  }

  dimension: key {
    type: string
    primary_key: yes
    description: "Date + Video ID CONCAT"
    sql: CONCAT(${TABLE}.date,${TABLE}.video_id);;}

  dimension: public_name {
    type: string
    label: "Brand"
    sql: CASE
          WHEN ${TABLE}.channel_id = 'UCsaDOOjq5Y6yLrxgGJUqsEw' THEN 'Clyde 1'
          WHEN ${TABLE}.channel_id = 'UCJmOp0HWnwmxjTIsqksvMXA' THEN 'West FM'
          WHEN ${TABLE}.channel_id = 'UCwnMEHO_yyQzIyPHJm5suIA' THEN 'Aire'
          WHEN ${TABLE}.channel_id = 'UCq2B-pDb-6jUAHEV-h8m_3g' THEN 'Cool FM'
          WHEN ${TABLE}.channel_id = 'UCphyqKNSQIbR5ZMUN1J8Gxg' THEN 'Absolute Radio'
          WHEN ${TABLE}.channel_id = 'UC9gQ6iuq7ynk1wszK5R7Zwg' THEN 'Mother&Baby'
          WHEN ${TABLE}.channel_id = 'UCe27AY7BFke681LR73NSNSA' THEN 'Bike Magazine'
          WHEN ${TABLE}.channel_id = 'UC2xJqlJyVh0ASDwmOvMMYZA' THEN 'Car Magazine'
          WHEN ${TABLE}.channel_id = 'UCjHJvp64ixm7wwd1G3OlHPQ' THEN 'CFM Radio'
          WHEN ${TABLE}.channel_id = 'UCK_Ey4Yj197icxmslBI46nw' THEN 'Radio City Talk'
          WHEN ${TABLE}.channel_id = 'UCzPgsTOJpM5lXfvKdxczQDQ' THEN 'Closer'
          WHEN ${TABLE}.channel_id = 'UC7SYsaZNNprwAJ_zi02rf_A' THEN 'Empire Magazine'
          WHEN ${TABLE}.channel_id = 'UCz9-OtzaTxc-uTSZwA1MI1w' THEN 'FHM'
          WHEN ${TABLE}.channel_id = 'UCdUVQ1yuFigC5MsoRXuiZqQ' THEN 'Fleet News'
          WHEN ${TABLE}.channel_id = 'UC6VVsuDvNhzqVh8ysdzisQg' THEN 'Forth 1'
          WHEN ${TABLE}.channel_id = 'UCND41OGEHM7ZlQwbvxatDYA' THEN 'Wave 105 (GPW Archive)'
          WHEN ${TABLE}.channel_id = 'UCoN0D7sJJrjd7Rg436hrDAQ' THEN 'Gem 106'
          WHEN ${TABLE}.channel_id = 'UClh2Uaj8qUOSafi4rpCpLYg' THEN 'Go Fishing'
          WHEN ${TABLE}.channel_id = 'UC5NJ_leC14h-uzCYF2_2czg' THEN 'GoThinkBig'
          WHEN ${TABLE}.channel_id = 'UCSkWgJ-6ynzAyC8f5CSKlHw' THEN 'Grazia'
          WHEN ${TABLE}.channel_id = 'UCfUA3lzPECT7cjLLwXd9k0g' THEN 'hallamfm'
          WHEN ${TABLE}.channel_id = 'UCHWwD2vfT0yql0A5zcYUtqg' THEN 'Heat'
          WHEN ${TABLE}.channel_id = 'UClzGCR7nK-VxIV3vC05GL6w' THEN 'HighStreetHoney'
          WHEN ${TABLE}.channel_id = 'UCfWfdemygVrKmvlK50dvI1w' THEN 'KerrangPodcast'
          WHEN ${TABLE}.channel_id = 'UCIJmMzDdBcfOMNhRdG25dtg' THEN 'Kerrang! Radio'
          WHEN ${TABLE}.channel_id = 'UCkJSVi5NPCKT0l02UWyyu7g' THEN 'Key103'
          WHEN ${TABLE}.channel_id = 'UCWg7ZcouKaf4TQc_too6kGQ' THEN 'KISS FM'
          WHEN ${TABLE}.channel_id = 'UC4ZkTipGMK5aUE__0ogI1ow' THEN 'LRO'
          WHEN ${TABLE}.channel_id = 'UCzOKCkUEjveoFbRWexEZeSw' THEN 'Magic Radio'
          WHEN ${TABLE}.channel_id = 'UCwhHM5Nf2LuPKkJaa0fBsgw' THEN 'MATCH Magazine'
          WHEN ${TABLE}.channel_id = 'UCzINUBmgZp-GgGKK3stfiDQ' THEN 'metroradiouk'
          WHEN ${TABLE}.channel_id = 'UC1ycDbyYfJuTne7fP9pr_8Q' THEN 'MorayFirthRadio'
          WHEN ${TABLE}.channel_id = 'UCB_cdRhIDhlavY2I5URSC7g' THEN 'MCN'
          WHEN ${TABLE}.channel_id = 'UCAeuYqX16dx_Rj-4lROHw1A' THEN 'Northsound 1'
          WHEN ${TABLE}.channel_id = 'UCodlGhfgwcYHsxaYj-cyUNg' THEN 'Parkers'
          WHEN ${TABLE}.channel_id = 'UCaTrfvx4EHCy0LPcw1tuTug' THEN 'Planet Rock'
          WHEN ${TABLE}.channel_id = 'UCEYHoGxBS8-rwhccl6yf7Lg' THEN 'Practical Classics'
          WHEN ${TABLE}.channel_id = 'UC--fz-Y9Zn6cZ-XKcIBjeGw' THEN 'Practical Fishkeeping'
          WHEN ${TABLE}.channel_id = 'UCf6vfs-sihdcWjkGbVQ9EBQ' THEN 'Q4music'
          WHEN ${TABLE}.channel_id = 'UCt6A_WQf7ff4OvKFTIwjEEQ' THEN 'Radio City 96.7'
          WHEN ${TABLE}.channel_id = 'UCnWN3UHOQFnNld7j973GFuw' THEN 'RAILmagazineOnline'
          WHEN ${TABLE}.channel_id = 'UCA-WSoyBMVvq67zbHJhhB4w' THEN 'rockfm974'
          WHEN ${TABLE}.channel_id = 'UCsR0pEi7x5mqTCseagCbDAA' THEN 'tfmradio'
          WHEN ${TABLE}.channel_id = 'UCnHrK50EAIJCizTYwdR6Aiw' THEN 'The Debrief'
          WHEN ${TABLE}.channel_id = 'UCTQoFwsYcbeXoDad9qCIm7g' THEN 'The Hits Official'
          WHEN ${TABLE}.channel_id = 'UC_cG5BDdc3JPE5bVB_nRFVA' THEN "Today's Golfer"
          WHEN ${TABLE}.channel_id = 'UCt-LOc-hy5M6cv__qSJs4vA' THEN 'Trail Magazine'
          WHEN ${TABLE}.channel_id = 'UCcnwtc3sBCWyPXNJYoPbUpQ' THEN 'vikingfmvideos'
          WHEN ${TABLE}.channel_id = 'UCSUxt6XusHNslT99IbeMMNA' THEN 'Wave 105'
          WHEN ${TABLE}.channel_id = 'UCe01z0SeV3JVGgKwD31BGmA' THEN 'YourHorseOnline'
          WHEN ${TABLE}.channel_id = 'UCUm6Y1TgZdVfrkNTkOMTpfQ' THEN 'zootoday'
          WHEN ${TABLE}.channel_id = 'UCwWyFRy2l6aUFMsRemP51Sw' THEN 'Practical Photography Magazine'
          WHEN ${TABLE}.channel_id = 'UCr6y-jKLdgQPWrt-O5LrRHQ' THEN 'TV Choice'
        END
      ;;}



  dimension: asset_id{
    type: string
    sql: ${TABLE}.asset_id;;}

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id;;}

  dimension: channel_id {
    type: string
    sql: ${TABLE}.channel_id;;}

  dimension: uploader_type {
    type: string
    sql: ${TABLE}.uploader_type;;}

  dimension: live_or_on_demand {
    type: string
    sql: ${TABLE}.live_or_on_demand;;}

  dimension: subscribed_status {
    type: string
    sql: ${TABLE}.subscribed_status;;}

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code;;}

  dimension: claimed_status {
    type: yesno
    sql: ${TABLE}.claimed_status = 'claimed';;}

  dimension: playback_location_type {
    type: number
    sql: ${TABLE}.playback_location_type;;}

  dimension: playback_location_detail {
    type: string
    sql: ${TABLE}.playback_location_detail;;}

  measure: views {
    type: sum
    sql: ${TABLE}.views ;;
  }

  measure: watch_time_minutes {
    type: sum
    sql: ${TABLE}.watch_time_minutes ;;
  }

  measure: average_view_duration_seconds {
    type: average
    sql: ${TABLE}.average_view_duration_seconds ;;
  }

  measure: average_view_duration_percentage {
    type: average
    sql: ${TABLE}.average_view_duration_percentage ;;
  }

  measure: count {
    type: count
  }

}
