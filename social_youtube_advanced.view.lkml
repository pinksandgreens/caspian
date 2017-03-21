view: social_youtube_advanced {
  sql_table_name: publications.social_youtube_advanced ;;

  measure: ad_impressions {
    type: sum
    sql: ${TABLE}.adimpressions ;;
  }

  measure: annotation_clickable_impressions {
    type: sum
    sql: ${TABLE}.annotationclickableimpressions ;;
  }

  measure: annotation_clicks {
    type: sum
    sql: ${TABLE}.annotationclicks ;;
  }

  measure: annotation_click_through_rate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.annotationclickthroughrate::float*100;;
  }

  measure: annotation_closable_impressions {
    type: sum
    sql: ${TABLE}.annotationclosableimpressions ;;
  }

  measure: annotation_closerate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.annotationcloserate::float*100 ;;
  }

  measure: annotation_closes {
    type: sum
    sql: ${TABLE}.annotationcloses ;;
  }

  measure: annotation_impressions {
    type: sum
    sql: ${TABLE}.annotationimpressions ;;
  }

  measure: average_view_duration {
    label: "Average View Duration (Seconds)"
    type: average
    sql: ${TABLE}.averageviewduration::float ;;
  }

  dimension: average_view_percentage {
    type: string
    value_format: "0.00\%"
    sql: ${TABLE}.averageviewpercentage::float  ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  measure: card_click_rate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.cardclickrate::float*100  ;;
  }

  measure: card_clicks {
    type: sum
    sql: ${TABLE}.cardclicks ;;
  }

  measure: card_impressions {
    type: sum
    sql: ${TABLE}.cardimpressions ;;
  }

  measure: card_teaser_clickrate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.cardteaserclickrate::float*100 ;;
  }

  measure: card_teaser_clicks {
    type: sum
    sql: ${TABLE}.cardteaserclicks ;;
  }

  measure: card_teaser_impressions {
    type: sum
    sql: ${TABLE}.cardteaserimpressions ;;
  }

  measure: comments {
    type: sum
    sql: ${TABLE}.comments ;;
  }

  measure: cpm {
    type: average
    value_format: "\£0.0000"
    sql: ${TABLE}.cpm::float ;;
  }

#   dimension: day {
#     type: string
#     sql: ${TABLE}.day ;;
#   }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.day,'YYYY-MM-DD') ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  measure: dislikes {
    type: sum
    sql: ${TABLE}.dislikes ;;
  }

  measure: estimated_adrevenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.estimatedadrevenue::float ;;
  }

  measure: estimated_minutes_watched {
    label: "Est. Total Minutes Watched"
    type: sum
    sql: ${TABLE}.estimatedminuteswatched ;;
  }

  measure: estimated_red_partner_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.estimatedredpartnerrevenue::float ;;
  }

  measure: estimated_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.estimatedrevenue::float ;;
  }

  measure: gross_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.grossrevenue::float ;;
  }

  measure: likes {
    type: sum
    sql: ${TABLE}.likes ;;
  }

  dimension: link {
    label: "Link"
    hidden: no
    type: string
    sql: ${TABLE}.link ;;
    html: <a href="{{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
      ;;
  }

  measure: monetized_playbacks {
    type: sum
    sql: ${TABLE}.monetizedplaybacks ;;
  }

  measure: playback_based_cpm {
    type: average
    value_format: "\£0.0000"
    sql: ${TABLE}.playbackbasedcpm::float ;;
  }

  measure: shares {
    type: sum
    sql: ${TABLE}.shares ;;
  }

  measure: subscribers_gained {
    type: sum
    sql: ${TABLE}.subscribersgained ;;
  }

  measure: subscribers_lost {
    type: sum
    sql: ${TABLE}.subscriberslost ;;
  }

  dimension: thumbnail {
    type: string
    sql: ${TABLE}.thumbnail ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  measure: videos_added_to_playlists {
    type: sum
    sql: ${TABLE}.videosaddedtoplaylists ;;
  }

  measure: videos_removed_from_playlists {
    type: sum
    sql: ${TABLE}.videosremovedfromplaylists ;;
  }

  measure: views {
    type: sum
    sql: ${TABLE}.views ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
