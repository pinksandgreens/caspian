view: youtube_basic {

sql_table_name: Youtube.p_content_owner_basic_a3_Youtube;;


  dimension_group: date {
    label: ""
    type: time
    sql: TIMESTAMP(${TABLE}.date) ;;
    }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code;;}

    dimension: video_id {
    type: string
    sql: ${TABLE}.video_id;;}

    dimension: channel_id {
    type: string
    sql: ${TABLE}.channel_id;;}

  dimension: claimed_status {
    type: string
    sql: ${TABLE}.claimed_status;;}

    dimension: uploader_type {
    type: string
    sql: ${TABLE}.uploader_type;;}

    dimension: live_or_on_demand {
    type: string
    sql: ${TABLE}.live_or_on_demand;;}

    dimension: subscribed_status {
    type: string
    sql: ${TABLE}.subscribed_status;;}

  measure: views {
    type: sum
    sql: ${TABLE}.views;;}

    measure: comments {
    type: sum
    sql: ${TABLE}.comments;;}

    measure: shares {
    type: sum
    sql: ${TABLE}.shares;;}

  measure: watch_time_minutes {
    type: sum
    sql: ${TABLE}.watch_time_minutes;;}

  measure: average_view_duration_seconds {
    type: sum
    sql: ${TABLE}.average_view_duration_seconds;;}

  measure: average_view_duration_percentage {
    type: sum
    sql: ${TABLE}.average_view_duration_percentage;;}

  measure: annotation_impressions {
    type: sum
    sql: ${TABLE}.annotation_impressions;;}

  measure: annotation_clickable_impressions {
    type: sum
    sql: ${TABLE}.annotation_clickable_impressions;;}

  measure: annotation_clicks {
    type: sum
    sql: ${TABLE}.annotation_clicks;;}

  measure: annotation_click_through_rate {
    type: sum
    sql: ${TABLE}.annotation_click_through_rate;;}

  measure: annotation_closable_impressions {
    type: sum
    sql: ${TABLE}.annotation_closable_impressions;;}

  measure: annotation_closes {
    type: sum
    sql: ${TABLE}.annotation_closes;;}

  measure: annotation_close_rate {
    type: sum
    sql: ${TABLE}.annotation_close_rate;;}

  measure: card_teaser_impressions {
    type: sum
    sql: ${TABLE}.card_teaser_impressions;;}

  measure: card_teaser_clicks {
    type: sum
    sql: ${TABLE}.card_teaser_clicks;;}

  measure: card_teaser_click_rate {
    type: sum
    sql: ${TABLE}.card_teaser_click_rate;;}

  measure: card_impressions {
    type: sum
    sql: ${TABLE}.card_impressions;;}

  measure: card_clicks {
    type: sum
    sql: ${TABLE}.card_clicks;;}

  measure: card_click_rate {
    type: sum
    sql: ${TABLE}.card_click_rate;;}

  measure: subscribers_gained {
    type: sum
    sql: ${TABLE}.subscribers_gained;;}

  measure: subscribers_lost {
    type: sum
    sql: ${TABLE}.subscribers_lost;;}

  measure: videos_added_to_playlists {
    type: sum
    sql: ${TABLE}.videos_added_to_playlists;;}

  measure: videos_removed_from_playlists {
    type: sum
    sql: ${TABLE}.videos_removed_from_playlists;;}

  measure: likes {
    type: sum
    sql: ${TABLE}.likes;;}

  measure: dislikes {
    type: sum
    sql: ${TABLE}.dislikes;;}

  measure: red_views {
    type: sum
    sql: ${TABLE}.red_views;;}

  measure: red_watch_time_minutes {
    type: sum
    sql: ${TABLE}.red_watch_time_minutes;;}

}
