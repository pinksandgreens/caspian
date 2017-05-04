view: youtube_ad_estimated_revenue {

  sql_table_name: Youtube.p_content_owner_estimated_revenue_a1_Youtube;;


dimension_group: date {
    label: ""
    type: time
    sql: TIMESTAMP(${TABLE}.date) ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code;;}

  dimension: ad_type{
    type: string
    sql: ${TABLE}.ad_type;;}

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id;;}

  dimension: channel_id {
    type: string
    sql: ${TABLE}.channel_id;;}

  dimension: uploader_type {
    type: string
    sql: ${TABLE}.uploader_type;;}

  dimension: claimed_status {
    type: string
    sql: ${TABLE}.claimed_status;;}

  measure: estimated_partner_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.estimated_partner_revenue;;}

  measure: ad_impressions {
    type: sum
    sql: ${TABLE}.ad_impressions;;}

  measure: estimated_partner_ad_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.estimated_partner_ad_revenue;;}

    measure: estimated_partner_ad_auction_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.estimated_partner_ad_auction_revenue;;}

    measure: estimated_partner_ad_reserved_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.estimated_partner_ad_reserved_revenue;;}

    measure: estimated_youtube_ad_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.estimated_youtube_ad_revenue;;}

    measure: estimated_monetized_playbacks {
    type: sum
    sql: ${TABLE}.estimated_monetized_playbacks;;}

    measure: estimated_playback_based_cpm {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.estimated_playback_based_cpm;;}

    measure: estimated_cpm {
    type: average
    value_format: "\£0.0000"
    sql: ${TABLE}.estimated_cpm;;}

    measure: estimated_partner_red_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.estimated_partner_red_revenue;;}

    measure: estimated_partner_transaction_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.estimated_partner_transaction_revenue;;}



}