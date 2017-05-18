view: brightcove {
  sql_table_name: publications.brightcove ;;

  dimension: date {
    hidden: yes
    label: "Recorded Date"
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
          WHEN SPLIT_PART(${TABLE}.date, '|', 3) = 'MCN' THEN 'MCN'
          WHEN SPLIT_PART(${TABLE}.date, '|', 3) = 'Mother and Baby' THEN 'Mother&Baby'
          ELSE SPLIT_PART(${TABLE}.date, '|', 3)
        END
        ;;
  }

  dimension: key {
    label: "Key"
    hidden: yes
    type: string
    primary_key: yes
    sql: ${hostname}||${date} ;;
  }

  dimension: hostname_unCASED {
    type: string
    label: "Domain where Video View Occured"
    sql: ${destination_domain} ;;
  }

  dimension: is_onsite {
    label: "Onsite?"
    type: yesno
    sql:  ${TABLE}.destination_domain LIKE '%aire%' OR ${TABLE}.destination_domain LIKE '%anglingtimes%' OR ${TABLE}.destination_domain LIKE '%carmagazine%' OR ${TABLE}.destination_domain LIKE '%closer%'
            OR ${TABLE}.destination_domain LIKE '%planetradio%' OR ${TABLE}.destination_domain LIKE '%empire%' OR ${TABLE}.destination_domain LIKE '%grazia%' OR ${TABLE}.destination_domain LIKE '%heat%'
            OR ${TABLE}.destination_domain LIKE '%kiss%' OR ${TABLE}.destination_domain LIKE '%lro%' OR ${TABLE}.destination_domain LIKE '%motorcyclenews%' OR ${TABLE}.destination_domain LIKE '%motherandbaby%'
            OR ${TABLE}.destination_domain LIKE '%parkers%' OR ${TABLE}.destination_domain LIKE '%debrief%' OR ${TABLE}.destination_domain LIKE '%golfer%' OR ${TABLE}.destination_domain LIKE '%lifestyle%'
            OR ${TABLE}.destination_domain LIKE '%fhm%' OR ${TABLE}.destination_domain LIKE '%classicarsforsale%' OR ${TABLE}.destination_domain LIKE '%fleetnews%' OR ${TABLE}.destination_domain LIKE '%forthone%'
            OR ${TABLE}.destination_domain LIKE '%gothinkbig%' OR ${TABLE}.destination_domain LIKE '%horsedeals%' OR ${TABLE}.destination_domain LIKE '%kerrang%' OR ${TABLE}.destination_domain LIKE '%mojo%'
            OR ${TABLE}.destination_domain LIKE '%mfr%' OR ${TABLE}.destination_domain LIKE '%mustard%' OR ${TABLE}.destination_domain LIKE '%planetrock%' OR ${TABLE}.destination_domain LIKE '%practicalphotography%'
            OR ${TABLE}.destination_domain LIKE '%practicalclassics%' OR ${TABLE}.destination_domain LIKE 'practicalfishkeeping' OR ${TABLE}.destination_domain LIKE '%qthemusic%' OR ${TABLE}.destination_domain LIKE '%bauer%'
            OR ${TABLE}.destination_domain LIKE '%winit%' OR ${TABLE}.destination_domain LIKE '%sweepon%' OR ${TABLE}.destination_domain LIKE '%lifeandstylemag%'
            OR ${TABLE}.destination_domain LIKE '%intouchweekly%' OR ${TABLE}.destination_domain LIKE '%planetradio%' OR ${TABLE}.destination_domain LIKE '%absolute%';;
  }


  dimension: hostname {
    type: string
    label: "Bauer Domain"
    sql: CASE
          WHEN  ${destination_domain} LIKE '%absoluteradio%' THEN 'Absolute Radio'
          WHEN  ${destination_domain} LIKE '%anglingtimes%' THEN 'Angling Times'
          WHEN  ${destination_domain} LIKE '%birdwatching%' THEN 'Bird Watching'
          WHEN  ${destination_domain} LIKE '%carmagazine%' THEN 'CAR Magazine'
          WHEN  ${destination_domain} LIKE '%cfmradio%' THEN 'CFM Radio'
          WHEN  ${destination_domain} LIKE '%classiccarsforsale%' THEN 'Classic Cars for Sale'
          WHEN  ${destination_domain} LIKE '%closer%' THEN 'Closer'
          WHEN  ${destination_domain} LIKE '%clyde1%' THEN 'Clyde 1'
          WHEN  ${destination_domain} LIKE '%clyde2%' THEN 'Clyde 2'
          WHEN  ${destination_domain} LIKE '%clyde3%' THEN 'Clyde 3'
          WHEN  ${destination_domain} LIKE '%coolfm%' THEN 'Cool FM'
          WHEN  ${destination_domain} LIKE '%downtown%' THEN 'Downtown'
          WHEN  ${destination_domain} LIKE '%downtowncountry%' THEN 'Downtown Country'
          WHEN  ${destination_domain} LIKE '%empireonline%' THEN 'Empire Magazine'
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
          WHEN  ${destination_domain} LIKE '%heat%' AND ${destination_domain} LIKE '%planetradio%' THEN 'Heat Radio'
          WHEN  ${destination_domain} LIKE '%horsedeals%' THEN 'Horse Deals'
          WHEN  ${destination_domain} LIKE '%kerrang%' THEN 'Kerrang!'
          WHEN  ${destination_domain} LIKE '%kerrang%' AND ${destination_domain} LIKE '%planetradio%' THEN 'Kerrang! Radio'
          WHEN  ${destination_domain} LIKE '%kerrangradio%' THEN 'Kerrang! Radio'
          WHEN  ${destination_domain} LIKE '%key103%' THEN 'Key103'
          WHEN  ${destination_domain} LIKE '%key2radio%' THEN 'Key2radio'
          WHEN  ${destination_domain} LIKE '%key3radio%' THEN 'Key3radio'
          WHEN  ${destination_domain} LIKE '%kissfmuk%' THEN 'KISS FM'
          WHEN  ${destination_domain} LIKE '%livefortheoutdoors%' THEN 'livefortheoutdoors'
          WHEN  ${destination_domain} LIKE '%lro%' THEN 'LRO'
          WHEN  ${destination_domain} LIKE '%magic%' THEN 'Magic Radio'
          WHEN  ${destination_domain} LIKE '%magicchilled%' THEN 'Magic Chilled'
          WHEN  ${destination_domain} LIKE '%mcncompare%' THEN 'MCN Compare'
          WHEN  ${destination_domain} LIKE '%mellowmagic%' THEN 'Mellow Magic'
          WHEN  ${destination_domain} LIKE '%metro2radio%' THEN 'Metro2 Radio'
          WHEN  ${destination_domain} LIKE '%metro3radio%' THEN 'Metro3 Radio'
          WHEN  ${destination_domain} LIKE '%metroradio%' THEN 'Metro Radio'
          WHEN  ${destination_domain} LIKE '%mfr%' THEN 'MFR'
          WHEN  ${destination_domain} LIKE '%mfr2%' THEN 'MFR2'
          WHEN  ${destination_domain} LIKE '%mfr3%' THEN 'MFR3'
          WHEN  ${destination_domain} LIKE '%mojo%' THEN 'Mojo'
          WHEN  ${destination_domain} LIKE '%motherandbaby%' THEN 'Mother&Baby'
          WHEN  ${destination_domain} LIKE '%motorcyclenews%' THEN 'MCN'
          WHEN  ${destination_domain} LIKE '%mustard%' THEN 'Mustard'
          WHEN  ${destination_domain} LIKE '%northsound1%' THEN 'Northsound 1'
          WHEN  ${destination_domain} LIKE '%northsound2%' THEN 'Northsound 2'
          WHEN  ${destination_domain} LIKE '%parkers%' THEN 'Parkers'
          WHEN  ${destination_domain} LIKE '%planetradio%' THEN 'Planet Radio'
          WHEN  ${destination_domain} LIKE '%planetrock%' THEN 'Planet Rock'
          WHEN  ${destination_domain} LIKE '%practicalphotography%' THEN 'Practical Photography Magazine'
          WHEN  ${destination_domain} LIKE '%qthemusic%' THEN 'Q4music'
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
          WHEN  ${destination_domain} LIKE '%yourhorse%' THEN 'YourHorse Online'
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

  dimension: 30_day_buckets  {
    type: number
    label: "30 Days"
    description: "Bucket [1] = Past 30 Days, [2] = Past 31 - 60 Days"
    sql:  CASE
                WHEN DATEDIFF(day,${date_raw},(CURRENT_DATE-4)) BETWEEN 0 AND 29 THEN 1
                WHEN DATEDIFF(day,${date_raw},(CURRENT_DATE-4)) BETWEEN 30 AND 59 THEN 2
            END ;;
  }

}
