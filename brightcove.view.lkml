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
    sql: SPLIT_PART(${TABLE}.date, '|', 3) ;;
  }

  dimension: hostname {
    type: string
    label: "Bauer Domain"
    sql: CASE
          WHEN  ${destination_domain} LIKE '%absoluteradio%' THEN 'absoluteradio'
          WHEN  ${destination_domain} LIKE '%anglingtimes%' THEN 'anglingtimes'
          WHEN  ${destination_domain} LIKE '%birdwatching%' THEN 'birdwatching'
          WHEN  ${destination_domain} LIKE '%carmagazine%' THEN 'carmagazine'
          WHEN  ${destination_domain} LIKE '%cfmradio%' THEN 'cfmradio'
          WHEN  ${destination_domain} LIKE '%classiccarsforsale%' THEN 'classiccarsforsale'
          WHEN  ${destination_domain} LIKE '%closeronline%' THEN 'closeronline'
          WHEN  ${destination_domain} LIKE '%clyde1%' THEN 'clyde1'
          WHEN  ${destination_domain} LIKE '%clyde2%' THEN 'clyde2'
          WHEN  ${destination_domain} LIKE '%clyde3%' THEN 'clyde3'
          WHEN  ${destination_domain} LIKE '%coolfm%' THEN 'coolfm'
          WHEN  ${destination_domain} LIKE '%downtown%' THEN 'downtown'
          WHEN  ${destination_domain} LIKE '%downtowncountry%' THEN 'downtowncountry'
          WHEN  ${destination_domain} LIKE '%empireonline%' THEN 'empireonline'
          WHEN  ${destination_domain} LIKE '%forth1%' THEN 'forth1'
          WHEN  ${destination_domain} LIKE '%forth2%' THEN 'forth2'
          WHEN  ${destination_domain} LIKE '%forth3%' THEN 'forth3'
          WHEN  ${destination_domain} LIKE '%freeradio%' THEN 'freeradio'
          WHEN  ${destination_domain} LIKE '%gem106%' THEN 'gem106'
          WHEN  ${destination_domain} LIKE '%graziadaily%' THEN 'graziadaily'
          WHEN  ${destination_domain} LIKE '%hallam2%' THEN 'hallam2'
          WHEN  ${destination_domain} LIKE '%hallam3%' THEN 'hallam3'
          WHEN  ${destination_domain} LIKE '%hallamfm%' THEN 'hallamfm'
          WHEN  ${destination_domain} LIKE '%heatworld%' THEN 'heatworld'
          WHEN  ${destination_domain} LIKE '%horsedeals%' THEN 'horsedeals'
          WHEN  ${destination_domain} LIKE '%kerrang%' THEN 'kerrang'
          WHEN  ${destination_domain} LIKE '%kerrangradio%' THEN 'kerrangradio'
          WHEN  ${destination_domain} LIKE '%key103%' THEN 'key103'
          WHEN  ${destination_domain} LIKE '%key2radio%' THEN 'key2radio'
          WHEN  ${destination_domain} LIKE '%key3radio%' THEN 'key3radio'
          WHEN  ${destination_domain} LIKE '%kissfmuk%' THEN 'kissfmuk'
          WHEN  ${destination_domain} LIKE '%lifestyle%' THEN 'lifestyle'
          WHEN  ${destination_domain} LIKE '%livefortheoutdoors%' THEN 'livefortheoutdoors'
          WHEN  ${destination_domain} LIKE '%lro%' THEN 'lro'
          WHEN  ${destination_domain} LIKE '%magic%' THEN 'magic'
          WHEN  ${destination_domain} LIKE '%magicchilled%' THEN 'magicchilled'
          WHEN  ${destination_domain} LIKE '%mcncompare%' THEN 'mcncompare'
          WHEN  ${destination_domain} LIKE '%mellowmagic%' THEN 'mellowmagic'
          WHEN  ${destination_domain} LIKE '%metro2radio%' THEN 'metro2radio'
          WHEN  ${destination_domain} LIKE '%metro3radio%' THEN 'metro3radio'
          WHEN  ${destination_domain} LIKE '%metroradio%' THEN 'metroradio'
          WHEN  ${destination_domain} LIKE '%mfr%' THEN 'mfr'
          WHEN  ${destination_domain} LIKE '%mfr2%' THEN 'mfr2'
          WHEN  ${destination_domain} LIKE '%mfr3%' THEN 'mfr3'
          WHEN  ${destination_domain} LIKE '%mojo4music%' THEN 'mojo4music'
          WHEN  ${destination_domain} LIKE '%motherandbaby%' THEN 'motherandbaby'
          WHEN  ${destination_domain} LIKE '%motorcyclenews%' THEN 'motorcyclenews'
          WHEN  ${destination_domain} LIKE '%northsound1%' THEN 'northsound1'
          WHEN  ${destination_domain} LIKE '%northsound2%' THEN 'northsound2'
          WHEN  ${destination_domain} LIKE '%planetradio%' THEN 'planetradio'
          WHEN  ${destination_domain} LIKE '%planetrock%' THEN 'planetrock'
          WHEN  ${destination_domain} LIKE '%qthemusic%' THEN 'qthemusic'
          WHEN  ${destination_domain} LIKE '%radioaire%' THEN 'radioaire'
          WHEN  ${destination_domain} LIKE '%radioaire2%' THEN 'radioaire2'
          WHEN  ${destination_domain} LIKE '%radioaire3%' THEN 'radioaire3'
          WHEN  ${destination_domain} LIKE '%radioborders%' THEN 'radioborders'
          WHEN  ${destination_domain} LIKE '%radiocity%' THEN 'radiocity'
          WHEN  ${destination_domain} LIKE '%radiocity2%' THEN 'radiocity2'
          WHEN  ${destination_domain} LIKE '%radiocity3%' THEN 'radiocity3'
          WHEN  ${destination_domain} LIKE '%radiocitytalk%' THEN 'radiocitytalk'
          WHEN  ${destination_domain} LIKE '%rockfm%' THEN 'rockfm'
          WHEN  ${destination_domain} LIKE '%rockfm2%' THEN 'rockfm2'
          WHEN  ${destination_domain} LIKE '%rockfm3%' THEN 'rockfm3'
          WHEN  ${destination_domain} LIKE '%seaangler%' THEN 'seaangler'
          WHEN  ${destination_domain} LIKE '%tay2%' THEN 'tay2'
          WHEN  ${destination_domain} LIKE '%tay3%' THEN 'tay3'
          WHEN  ${destination_domain} LIKE '%tayfm%' THEN 'tayfm'
          WHEN  ${destination_domain} LIKE '%tfm2%' THEN 'tfm2'
          WHEN  ${destination_domain} LIKE '%tfm3%' THEN 'tfm3'
          WHEN  ${destination_domain} LIKE '%tfmradio%' THEN 'tfmradio'
          WHEN  ${destination_domain} LIKE '%thedebrief%' THEN 'thedebrief'
          WHEN  ${destination_domain} LIKE '%thehitsradio%' THEN 'thehitsradio'
          WHEN  ${destination_domain} LIKE '%todaysgolfer%' THEN 'todaysgolfer'
          WHEN  ${destination_domain} LIKE '%troutandsalmon%' THEN 'troutandsalmon'
          WHEN  ${destination_domain} LIKE '%troutfisherman%' THEN 'troutfisherman'
          WHEN  ${destination_domain} LIKE '%viking2%' THEN 'viking2'
          WHEN  ${destination_domain} LIKE '%viking3%' THEN 'viking3'
          WHEN  ${destination_domain} LIKE '%vikingfm%' THEN 'vikingfm'
          WHEN  ${destination_domain} LIKE '%wave105%' THEN 'wave105'
          WHEN  ${destination_domain} LIKE '%westfm%' THEN 'westfm'
          WHEN  ${destination_domain} LIKE '%westsound%' THEN 'westsound'
          WHEN  ${destination_domain} LIKE '%westsoundradio%' THEN 'westsoundradio'
          WHEN  ${destination_domain} LIKE '%yourhorse%' THEN 'yourhorse'
          WHEN  ${destination_domain} LIKE '%yours%' THEN 'yours'
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

  dimension: video_impression {
    type: string
    sql: ${TABLE}.video_impression ;;
  }

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

  dimension: video_view {
    type: string
    sql: ${TABLE}.video_view ;;
  }

  measure: count {
    type: count
    drill_fields: [video_name]
  }
}
