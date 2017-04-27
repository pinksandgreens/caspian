view: brightcove {
  sql_table_name: publications.brightcove ;;

  dimension: date {
    hidden: yes
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(SPLIT_PART(${TABLE}.date, '|', 1),'YYYY-MM-DD') ;;
  }

  dimension: account_id {
    type: string
    sql: SPLIT_PART(${TABLE}.date, '|', 2) ;;
  }

  dimension: account_name {
    type: string
    sql: CASE
          WHEN SPLIT_PART(${TABLE}.date, '|', 3) = 'Magic 105.4' THEN 'Magic Radio'
          WHEN SPLIT_PART(${TABLE}.date, '|', 3) = 'MCN' THEN 'Motorcyclenews'
          WHEN SPLIT_PART(${TABLE}.date, '|', 3) = 'Mother and Baby' THEN 'Mother & Baby'
          ELSE SPLIT_PART(${TABLE}.date, '|', 3)
        END
        ;;
  }

  dimension: hostname_unCASED {
    type: string
    label: "Domain where Video View Occured"
    sql: ${destination_domain} ;;
  }

  dimension: hostname {
    type: string
    label: "Bauer Domain"
    sql: CASE
          WHEN  ${destination_domain} LIKE '%absoluteradio%' THEN 'Absolute Radio'
          WHEN  ${destination_domain} LIKE '%anglingtimes%' THEN 'Angling Times'
          WHEN  ${destination_domain} LIKE '%birdwatching%' THEN 'Bird Watching'
          WHEN  ${destination_domain} LIKE '%carmagazine%' THEN 'Car Magazine'
          WHEN  ${destination_domain} LIKE '%cfmradio%' THEN 'CFM Radio'
          WHEN  ${destination_domain} LIKE '%classiccarsforsale%' THEN 'Classic Cars for Sale'
          WHEN  ${destination_domain} LIKE '%closer%' THEN 'Closer'
          WHEN  ${destination_domain} LIKE '%clyde1%' THEN 'Clyde 1'
          WHEN  ${destination_domain} LIKE '%clyde2%' THEN 'Clyde 2'
          WHEN  ${destination_domain} LIKE '%clyde3%' THEN 'Clyde 3'
          WHEN  ${destination_domain} LIKE '%coolfm%' THEN 'Cool FM'
          WHEN  ${destination_domain} LIKE '%downtown%' THEN 'Downtown'
          WHEN  ${destination_domain} LIKE '%downtowncountry%' THEN 'Downtown Country'
          WHEN  ${destination_domain} LIKE '%empireonline%' THEN 'Empire'
          WHEN  ${destination_domain} LIKE '%forth1%' THEN 'Forth 1'
          WHEN  ${destination_domain} LIKE '%forth2%' THEN 'forth2'
          WHEN  ${destination_domain} LIKE '%forth3%' THEN 'forth3'
          WHEN  ${destination_domain} LIKE '%freeradio%' THEN 'Free Radio'
          WHEN  ${destination_domain} LIKE '%gem106%' THEN 'Gem 106'
          WHEN  ${destination_domain} LIKE '%grazia%' THEN 'Grazia'
          WHEN  ${destination_domain} LIKE '%hallam2%' THEN 'Hallam2'
          WHEN  ${destination_domain} LIKE '%hallam3%' THEN 'Hallam3'
          WHEN  ${destination_domain} LIKE '%hallamfm%' THEN 'Hallam FM'
          WHEN  ${destination_domain} LIKE '%heat%' THEN 'Heat'
          WHEN  ${destination_domain} LIKE '%horsedeals%' THEN 'Horsedeals'
          WHEN  ${destination_domain} LIKE '%kerrang%' THEN 'Kerrang'
          WHEN  ${destination_domain} LIKE '%kerrangradio%' THEN 'Kerrang! Radio'
          WHEN  ${destination_domain} LIKE '%key103%' THEN 'Key103'
          WHEN  ${destination_domain} LIKE '%key2radio%' THEN 'Key2radio'
          WHEN  ${destination_domain} LIKE '%key3radio%' THEN 'Key3radio'
          WHEN  ${destination_domain} LIKE '%kissfmuk%' THEN 'Kiss'
          WHEN  ${destination_domain} LIKE '%livefortheoutdoors%' THEN 'livefortheoutdoors'
          WHEN  ${destination_domain} LIKE '%lro%' THEN 'LRO'
          WHEN  ${destination_domain} LIKE '%magic%' THEN 'Magic'
          WHEN  ${destination_domain} LIKE '%magicchilled%' THEN 'Magic Chilled'
          WHEN  ${destination_domain} LIKE '%mcncompare%' THEN 'MCN Compare'
          WHEN  ${destination_domain} LIKE '%mellowmagic%' THEN 'Mellow Magic'
          WHEN  ${destination_domain} LIKE '%metro2radio%' THEN 'Metro2 Radio'
          WHEN  ${destination_domain} LIKE '%metro3radio%' THEN 'Metro3 Radio'
          WHEN  ${destination_domain} LIKE '%metroradio%' THEN 'Metro Radio'
          WHEN  ${destination_domain} LIKE '%mfr%' THEN 'MFR'
          WHEN  ${destination_domain} LIKE '%mfr2%' THEN 'MFR2'
          WHEN  ${destination_domain} LIKE '%mfr3%' THEN 'MFR3'
          WHEN  ${destination_domain} LIKE '%mojo4music%' THEN 'Mojo4music'
          WHEN  ${destination_domain} LIKE '%motherandbaby%' THEN 'Mother & Baby'
          WHEN  ${destination_domain} LIKE '%motorcyclenews%' THEN 'Motorcyclenews'
          WHEN  ${destination_domain} LIKE '%northsound1%' THEN 'Northsound 1'
          WHEN  ${destination_domain} LIKE '%northsound2%' THEN 'Northsound 2'
          WHEN  ${destination_domain} LIKE '%planetradio%' THEN 'Planet Radio'
          WHEN  ${destination_domain} LIKE '%planetrock%' THEN 'Planet Rock'
          WHEN  ${destination_domain} LIKE '%qthemusic%' THEN 'Q'
          WHEN  ${destination_domain} LIKE '%radioaire%' THEN 'Radio Aire'
          WHEN  ${destination_domain} LIKE '%radioaire2%' THEN 'Radio Aire 2'
          WHEN  ${destination_domain} LIKE '%radioaire3%' THEN 'Radio Aire 3'
          WHEN  ${destination_domain} LIKE '%radioborders%' THEN 'Radio Borders'
          WHEN  ${destination_domain} LIKE '%radiocity%' THEN 'Radio City'
          WHEN  ${destination_domain} LIKE '%radiocity2%' THEN 'Radio City 2'
          WHEN  ${destination_domain} LIKE '%radiocity3%' THEN 'Radio City 3'
          WHEN  ${destination_domain} LIKE '%radiocitytalk%' THEN 'Radio City Talk'
          WHEN  ${destination_domain} LIKE '%rockfm%' THEN 'Rock FM'
          WHEN  ${destination_domain} LIKE '%rockfm2%' THEN 'Rock FM 2'
          WHEN  ${destination_domain} LIKE '%rockfm3%' THEN 'Rock FM 3'
          WHEN  ${destination_domain} LIKE '%seaangler%' THEN 'Sea Angler'
          WHEN  ${destination_domain} LIKE '%tay2%' THEN 'Tay 2'
          WHEN  ${destination_domain} LIKE '%tay3%' THEN 'Tay 3'
          WHEN  ${destination_domain} LIKE '%tayfm%' THEN 'Tay FM'
          WHEN  ${destination_domain} LIKE '%tfm2%' THEN 'TFM 2'
          WHEN  ${destination_domain} LIKE '%tfm3%' THEN 'TFM 3'
          WHEN  ${destination_domain} LIKE '%tfmradio%' THEN 'TFM Radio'
          WHEN  ${destination_domain} LIKE '%thedebrief%' THEN 'The Debrief'
          WHEN  ${destination_domain} LIKE '%thehitsradio%' THEN 'The Hits Radio'
          WHEN  ${destination_domain} LIKE '%todaysgolfer%' THEN 'Today''s Golfer'
          WHEN  ${destination_domain} LIKE '%troutandsalmon%' THEN 'Trout & salmon'
          WHEN  ${destination_domain} LIKE '%troutfisherman%' THEN 'Trout Fisherman'
          WHEN  ${destination_domain} LIKE '%viking2%' THEN 'Viking 2'
          WHEN  ${destination_domain} LIKE '%viking3%' THEN 'Viking 3'
          WHEN  ${destination_domain} LIKE '%vikingfm%' THEN 'Viking FM'
          WHEN  ${destination_domain} LIKE '%wave105%' THEN 'Wave 105'
          WHEN  ${destination_domain} LIKE '%westfm%' THEN 'West FM'
          WHEN  ${destination_domain} LIKE '%westsound%' THEN 'Westsound'
          WHEN  ${destination_domain} LIKE '%westsoundradio%' THEN 'Westsound Radio'
          WHEN  ${destination_domain} LIKE '%yourhorse%' THEN 'Yourhorse'
          WHEN  ${destination_domain} LIKE '%yours%' THEN 'Yours'
          ELSE 'NULL'
        END
;;
  }

  dimension: destination_domain {
    type: string
    sql: ${TABLE}.destination_domain ;;
  }

  dimension: engagement_score {
    type: string
    sql: ${TABLE}.engagement_score ;;
  }

  dimension: play_rate {
    type: string
    sql: ${TABLE}.play_rate ;;
  }

  dimension: play_request {
    type: string
    sql: ${TABLE}.play_request ;;
  }

  dimension: video {
    type: string
    sql: ${TABLE}.video ;;
  }

  dimension: video_duration {
    type: string
    sql: ${TABLE}.video_duration ;;
  }

#   dimension: video_impression {
#     type: string
#     sql: ${TABLE}.video_impression ;;
#   }

  dimension: video_name {
    type: string
    sql: ${TABLE}.video_name ;;
  }

  dimension: video_percent_viewed {
    type: string
    sql: ${TABLE}.video_percent_viewed ;;
  }

  dimension: video_seconds_viewed {
    type: string
    sql: ${TABLE}.video_seconds_viewed ;;
  }

  measure: video_view {
    type: sum
    sql: ${TABLE}.video_view ;;
  }

  measure: video_impressions {
    type: sum
    sql: ${TABLE}.video_impression ;;
  }

  measure: count {
    type: count
    drill_fields: [video_name]
  }
}
