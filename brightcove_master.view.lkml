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
    label: "Ad Unit Key"
    type: string
    primary_key: yes
    sql: CASE
          WHEN ${brand} = 'West FM' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Absolute Radio' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Aire' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Angling Times' THEN 'SSPT_Angling-Times'
          WHEN ${brand} = 'BCN' THEN 'RBCN_video'
          WHEN ${brand} = 'BIKE Magazine' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Borders' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'CAR Magazine' THEN 'SMOD_Car'
          WHEN ${brand} = 'CFMRadio' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'CCFS' THEN 'SAUT_Classic-Cars-for-Sale'
          WHEN ${brand} = 'Closer' THEN 'LWLN_Closer'
          WHEN ${brand} = 'Clyde 1' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Cool FM' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Downtown' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Empire Magazine' THEN 'LMENS_Empire'
          WHEN ${brand} = 'FHM' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Fleet News' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Forth 1' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Free' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Gem 106' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'GoThinkBig' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Grazia' THEN 'LWLN_Grazia'
          WHEN ${brand} = 'hallamfm' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Heat' THEN 'LWLN_Heatworld'
          WHEN ${brand} = 'Heat Radio' THEN 'RNAT_heat'
          WHEN ${brand} = 'HighStreetHoney' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Horse Deals' THEN 'SPET_Horse-Deals'
          WHEN ${brand} = 'Kerrang! Radio' THEN 'RNAT_kerrang'
          WHEN ${brand} = 'Kerrang' THEN 'LMENS_Kerrang'
          WHEN ${brand} = 'KerrangPodcast' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Key103' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'KISS FM' THEN 'RNAT_kiss'
          WHEN ${brand} = 'LRO' THEN 'SAUT_LRO'
          WHEN ${brand} = 'Magic Radio' THEN 'RNAT_magic'
          WHEN ${brand} = 'MATCH Magazine' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'MCN' THEN 'SMOT_MCN'
          WHEN ${brand} = 'metroradiouk' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Mojo' THEN 'LMENS_Mojo'
          WHEN ${brand} = 'MorayFirthRadio' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Mother&Baby' THEN 'SWSP_Mother-and-Baby'
          WHEN ${brand} = 'Mustard' THEN 'SMOD_Mustard'
          WHEN ${brand} = 'Northsound 1' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Parkers' THEN 'SMOD_Parkers'
          WHEN ${brand} = 'Planet Rock' THEN 'RNAT_planet-rock'
          WHEN ${brand} = 'Practical Photography magazine' THEN 'SLEI_Practical-Photography'
          WHEN ${brand} = 'PracticalClassics' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'practicalfishkeeping' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Q4music' THEN 'LMENS_Q'
          WHEN ${brand} = 'Radio Aire' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Radio City 96.7' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'RAILmagazineOnline' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'rockfm974' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Radio City Talk' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Tay' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'tfmradio' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'The Debrief' THEN 'LWLN_The-Debrief'
          WHEN ${brand} = 'The Hits Official' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Today''s Golfer' THEN 'SSPT_Todays-Golfer'
          WHEN ${brand} = 'Trail magazine' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'TV Choice' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'vikingfmvideos' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Wave 105' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Wave 105 (GPW Archive)' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'Westsound' THEN 'Please See BCN - No independent Ad Tag setup'
          WHEN ${brand} = 'Win Something' THEN 'No Ad Tag Exists'
          WHEN ${brand} = 'YourHorseOnline' THEN 'SPET_Your-Horse'
          WHEN ${brand} = 'Yours' THEN 'SWSP_Yours'
          WHEN ${brand} = 'zootoday' THEN 'No Ad Tag Exists'
        END

        ;;

  }


}
