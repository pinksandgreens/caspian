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
    sql: CONCAT(${TABLE}.date,${TABLE}.video_id);;}

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
    type: string
    sql: ${TABLE}.claimed_status;;}

  dimension: playback_location_type {
    type: string
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
