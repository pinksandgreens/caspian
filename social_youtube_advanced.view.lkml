view: social_youtube_advanced {
  sql_table_name: publications.social_youtube_advanced ;;

  measure: ad_impressions {
    type: sum
    sql: ${TABLE}.adimpressions ;;
    drill_fields: [post_details*]
  }

  measure: number_of_videos {
    type: count_distinct
    sql: ${TABLE}.video_id ;;
    drill_fields: [post_details*]
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
    value_format: "0.00"
    sql: ${TABLE}.averageviewduration::float ;;
    drill_fields: [post_details*]
  }

  measure: average_view_percentage {
    type: average
    value_format: "0.00\%"
    sql: ${TABLE}.averageviewpercentage::float ;;
    drill_fields: [post_details*]
  }

  dimension: brand {
    type: string
    sql:
      CASE
        WHEN ${TABLE}.brand LIKE '%boxes?%' THEN 'Absolute Radio'
        ELSE ${TABLE}.brand
      END;;
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

  dimension_group: created {
    type: time
    label: "Created"
    timeframes: []
    convert_tz: no
    sql: TO_TIMESTAMP(${TABLE}.published_date,'YYYY/MM/DD HH24:MI:SS');;
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
    drill_fields: [post_details*]
  }

  measure: gross_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.grossrevenue::float ;;
    drill_fields: [post_details*]
  }

  measure: likes {
    type: sum
    sql: ${TABLE}.likes ;;
    drill_fields: [post_details*]
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
    drill_fields: [post_details*]
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
    drill_fields: [post_details*]
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [post_details*]
  }

  set: post_details {
    fields: [
      brand,
      title,
      link,
      views,
      shares,
      comments,
      average_view_duration,
      average_view_percentage,
      subscribers_gained,
      ad_impressions,
      gross_revenue
      ]
    }

  }
