view: brightcove_master {
  derived_table: {
    sql: SELECT * FROM publications.brightcove_master
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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

  dimension: video_duration {
    type: string
    sql: ${TABLE}.video_duration ;;
  }

  dimension: video_impression {
    type: string
    sql: ${TABLE}.video_impression ;;
  }

  dimension: avg_seconds_viewed {
    type: string
    sql: ${TABLE}.avg_seconds_viewed ;;
  }

  dimension: video_view {
    type: string
    sql: ${TABLE}.video_view ;;
  }

  dimension: video_seconds_viewed {
    type: string
    sql: ${TABLE}.video_seconds_viewed ;;
  }

  dimension: video_name {
    type: string
    sql: ${TABLE}."video.name" ;;
  }

  dimension: engagement_score {
    type: string
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

  dimension: video_engagement_1 {
    type: string
    sql: ${TABLE}.video_engagement_1 ;;
  }

  dimension: video_engagement_25 {
    type: string
    sql: ${TABLE}.video_engagement_25 ;;
  }

  dimension: video_engagement_50 {
    type: string
    sql: ${TABLE}.video_engagement_50 ;;
  }

  dimension: video_engagement_75 {
    type: string
    sql: ${TABLE}.video_engagement_75 ;;
  }

  dimension: video_engagement_100 {
    type: string
    sql: ${TABLE}.video_engagement_100 ;;
  }

  dimension: video_percent_viewed {
    type: string
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
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  set: detail {
    fields: [
      account,
      player,
      account_name,
      player_name,
      video_duration,
      video_impression,
      avg_seconds_viewed,
      video_view,
      video_seconds_viewed,
      video_name,
      engagement_score,
      play_request,
      ad_mode_begin,
      ad_mode_complete,
      video,
      video_engagement_1,
      video_engagement_25,
      video_engagement_50,
      video_engagement_75,
      video_engagement_100,
      video_percent_viewed,
      video_download_request,
      video_download_complete,
      video_download_cancellation,
      video_download_error,
      date,
      brand
    ]
  }
}
