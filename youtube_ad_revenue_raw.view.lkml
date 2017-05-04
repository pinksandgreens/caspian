view: youtube_ad_revenue_raw {

sql_table_name: ( SELECT * FROM Youtube.p_content_owner_ad_revenue_raw_a1_Youtube);;

  dimension: adjustment_type {
    type: string
    sql: ${TABLE}.adjustment_type;;}

    dimension: date {
    type: string
    sql: ${TABLE}.date;;}

    dimension: country_code {
    type: string
    sql: ${TABLE}.country_code;;}

    dimension: video_id {
    type: string
    sql: ${TABLE}.video_id;;}

    dimension: video_title {
    type: string
    sql: ${TABLE}.video_title;;}

    dimension: video_duration_sec {
    type: string
    sql: ${TABLE}.video_duration_sec;;}

    dimension: category {
    type: string
    sql: ${TABLE}.category;;}

    dimension: channel_id {
    type: string
    sql: ${TABLE}.channel_id;;}

    dimension: uploader {
    type: string
    sql: ${TABLE}.uploader;;}

    dimension: channel_display_name {
    type: string
    sql: ${TABLE}.channel_display_name;;}

    dimension: content_type {
    type: string
    sql: ${TABLE}.content_type;;}

    dimension: policy {
    type: string
    sql: ${TABLE}.policy;;}

    dimension: owned_views {
    type: string
    sql: ${TABLE}.owned_views;;}

    dimension: youtube_revenue_split_auction {
    type: string
    sql: ${TABLE}.youtube_revenue_split_auction;;}

    dimension: youtube_revenue_split_reserved {
    type: string
    sql: ${TABLE}.youtube_revenue_split_reserved;;}

    dimension: youtube_revenue_split_partner_sold_youtube_served {
    type: string
    sql: ${TABLE}.youtube_revenue_split_partner_sold_youtube_served;;}

    dimension: youtube_revenue_split_partner_sold_partner_served {
    type: string
    sql: ${TABLE}.youtube_revenue_split_partner_sold_partner_served;;}

    dimension: youtube_revenue_split {
    type: string
    sql: ${TABLE}.youtube_revenue_split;;}

    dimension: partner_revenue_auction {
    type: string
    sql: ${TABLE}.partner_revenue_auction;;}

    dimension: partner_revenue_reserved {
    type: string
    sql: ${TABLE}.partner_revenue_reserved;;}

    dimension: partner_revenue_partner_sold_youtube_served {
    type: string
    sql: ${TABLE}.partner_revenue_partner_sold_youtube_served;;}

    dimension: partner_revenue_partner_sold_partner_served {
    type: string
    sql: ${TABLE}.partner_revenue_partner_sold_partner_served;;}

    dimension: partner_revenue {
    type: string
    sql: ${TABLE}.partner_revenue;;}


}
