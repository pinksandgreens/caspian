view: youtube_devices {

  sql_table_name: Youtube.p_content_owner_device_os_a2_Youtube;;


  dimension_group: date {
    label: ""
    type: time
    sql: TIMESTAMP(${TABLE}.date) ;;
  }

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${TABLE}.date,${TABLE}.video_id);;}

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

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type;;}

    dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system;;}

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
