view: brightcove_master {
  derived_table: {
    sql: SELECT * FROM publications.brightcove_master
      ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: player {
    type: string
    sql: ${TABLE}.player ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}."account.name" ;;
  }

  dimension: player_name {
    type: string
    sql: ${TABLE}.player_name ;;
  }

  measure: video_duration {
    type: sum
    sql: ${TABLE}.video_duration ;;
  }

  measure: video_impression {
    type: sum
    sql: ${TABLE}.video_impression ;;
  }

  measure: avg_seconds_viewed {
    type: average
    sql: ${TABLE}.avg_seconds_viewed ;;
  }

  measure: video_view {
    type: sum
    sql: ${TABLE}.video_view ;;
  }

  measure: video_seconds_viewed {
    type: sum
    sql: ${TABLE}.video_seconds_viewed ;;
  }

  dimension: video_name {
    type: string
    sql: ${TABLE}."video.name" ;;
  }

  measure: engagement_score {
    type: average
    sql: ${TABLE}.engagement_score ;;
  }

  dimension: play_request {
    type: string
    sql: ${TABLE}.play_request ;;
  }

  dimension: ad_mode_begin {
    type: string
    sql: ${TABLE}.ad_mode_begin ;;
  }

  dimension: ad_mode_complete {
    type: string
    sql: ${TABLE}.ad_mode_complete ;;
  }

  dimension: video {
    type: string
    sql: ${TABLE}.video ;;
  }

  measure: video_engagement_1 {
    type: average
    sql: ${TABLE}.video_engagement_1 ;;
  }

  measure: video_engagement_25 {
    type: average
    sql: ${TABLE}.video_engagement_25 ;;
  }

  measure: video_engagement_50 {
    type: average
    sql: ${TABLE}.video_engagement_50 ;;
  }

  measure: video_engagement_75 {
    type: average
    sql: ${TABLE}.video_engagement_75 ;;
  }

  measure: video_engagement_100 {
    type: average
    sql: ${TABLE}.video_engagement_100 ;;
  }

  measure: video_percent_viewed {
    type: average
    sql: ${TABLE}.video_percent_viewed ;;
  }

  dimension: video_download_request {
    type: string
    sql: ${TABLE}.video_download_request ;;
  }

  dimension: video_download_complete {
    type: string
    sql: ${TABLE}.video_download_complete ;;
  }

  dimension: video_download_cancellation {
    type: string
    sql: ${TABLE}.video_download_cancellation ;;
  }

  dimension: video_download_error {
    type: string
    sql: ${TABLE}.video_download_error ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: key {
    label: "Key"
    type: string
    primary_key: yes
    sql: CASE
          WHEN ${brand} = 'West FM' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Absolute Radio' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Aire' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Angling Times' THEN 'SSPT_Angling-Times'||${date}
          WHEN ${brand} = 'BCN' THEN 'RBCN_video'||${date}
          WHEN ${brand} = 'BIKE Magazine' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Borders' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'CAR Magazine' THEN 'SMOD_Car'||${date}
          WHEN ${brand} = 'CFMRadio' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'CCFS' THEN 'SAUT_Classic-Cars-for-Sale'||${date}
          WHEN ${brand} = 'Closer' THEN 'LWLN_Closer'||${date}
          WHEN ${brand} = 'Clyde 1' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Cool FM' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Downtown' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Empire Magazine' THEN 'LMENS_Empire'||${date}
          WHEN ${brand} = 'FHM' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Fleet News' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Forth 1' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Free' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Gem 106' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'GoThinkBig' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Grazia' THEN 'LWLN_Grazia'||${date}
          WHEN ${brand} = 'hallamfm' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Heat' THEN 'LWLN_Heatworld'||${date}
          WHEN ${brand} = 'Heat Radio' THEN 'RNAT_heat'||${date}
          WHEN ${brand} = 'HighStreetHoney' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Horse Deals' THEN 'SPET_Horse-Deals'||${date}
          WHEN ${brand} = 'Kerrang! Radio' THEN 'RNAT_kerrang'||${date}
          WHEN ${brand} = 'Kerrang' THEN 'LMENS_Kerrang'||${date}
          WHEN ${brand} = 'KerrangPodcast' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Key103' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'KISS FM' THEN 'RNAT_kiss'||${date}
          WHEN ${brand} = 'LRO' THEN 'SAUT_LRO'||${date}
          WHEN ${brand} = 'Magic Radio' THEN 'RNAT_magic'||${date}
          WHEN ${brand} = 'MATCH Magazine' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'MCN' THEN 'SMOT_MCN'||${date}
          WHEN ${brand} = 'metroradiouk' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Mojo' THEN 'LMENS_Mojo'||${date}
          WHEN ${brand} = 'MorayFirthRadio' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Mother&Baby' THEN 'SWSP_Mother-and-Baby'||${date}
          WHEN ${brand} = 'Mustard' THEN 'SMOD_Mustard'||${date}
          WHEN ${brand} = 'Northsound 1' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Parkers' THEN 'SMOD_Parkers'||${date}
          WHEN ${brand} = 'Planet Rock' THEN 'RNAT_planet-rock'||${date}
          WHEN ${brand} = 'Practical Photography magazine' THEN 'SLEI_Practical-Photography'||${date}
          WHEN ${brand} = 'PracticalClassics' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'practicalfishkeeping' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Q4music' THEN 'LMENS_Q'||${date}
          WHEN ${brand} = 'Radio Aire' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Radio City 96.7' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'RAILmagazineOnline' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'rockfm974' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Radio City Talk' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Tay' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'tfmradio' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'The Debrief' THEN 'LWLN_The-Debrief'||${date}
          WHEN ${brand} = 'The Hits Official' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Today''s Golfer' THEN 'SSPT_Todays-Golfer'||${date}
          WHEN ${brand} = 'Trail magazine' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'TV Choice' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'vikingfmvideos' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Wave 105' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Wave 105 (GPW Archive)' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'Westsound' THEN 'Please See BCN - No independent Ad Tag setup'||${date}
          WHEN ${brand} = 'Win Something' THEN 'No Ad Tag Exists'||${date}
          WHEN ${brand} = 'YourHorseOnline' THEN 'SPET_Your-Horse'||${date}
          WHEN ${brand} = 'Yours' THEN 'SWSP_Yours'||${date}
          WHEN ${brand} = 'zootoday' THEN 'No Ad Tag Exists'||${date}
        END

        ;;

  }


}
