view: youtube_demogs {

sql_table_name: Youtube.p_content_owner_asset_demographics_a1_Youtube;;

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

  dimension: age_group {
    type: string
    sql: ${TABLE}.age_group;;}

  dimension: gender {
    type: string
    sql: ${TABLE}.gender;;}

measure: views_percentage {
  type: average
  sql: ${TABLE}.views_percentage;;}

measure: count {
  type: count
}

}
