view: youtube_ad_estimated_revenue {

  sql_table_name: Youtube.p_content_owner_estimated_revenue_a1_Youtube;;


dimension_group: date {
    label: ""
    type: time
    sql: TIMESTAMP(${TABLE}.date) ;;
  }

  dimension: 30_day_buckets  {
    type: number
    label: "30 Days"
    description: "Bucket [1] = Past 30 Days, [2] = Past 31 - 60 Days"
    sql:  CASE
                WHEN DATEDIFF(DATE_ADD(CURRENT_TIMESTAMP(),-3,"DAY"),TIMESTAMP(${TABLE}.date)) BETWEEN 3 AND 32 THEN 1 --Adding Offset for Gregs presentation
                WHEN DATEDIFF(DATE_ADD(CURRENT_TIMESTAMP(),-3,"DAY"),TIMESTAMP(${TABLE}.date)) BETWEEN 33 AND 62 THEN 2 --Adding Offset for Gregs presentation
            END ;;
  }

  #dimension: key {
  #  type: string
  #  primary_key: yes
  #  sql: CONCAT(${TABLE}.date,${TABLE}.video_id);;}

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code;;}

  dimension: ad_type{
    type: string
    sql: ${TABLE}.ad_type;;}

  dimension: video_id {
    primary_key: yes
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
    value_format: "\$0.0000"
    sql: ${TABLE}.estimated_partner_revenue;;}

  measure: ad_impressions {
    type: sum
    sql: ${TABLE}.ad_impressions;;}

  measure: estimated_partner_ad_revenue {
    type: sum
    value_format: "\$0.0000"
    sql: ${TABLE}.estimated_partner_ad_revenue;;}

    measure: estimated_partner_ad_auction_revenue {
    type: sum
    value_format: "\$0.0000"
    sql: ${TABLE}.estimated_partner_ad_auction_revenue;;}

    measure: estimated_partner_ad_reserved_revenue {
    type: sum
    value_format: "\$0.0000"
    sql: ${TABLE}.estimated_partner_ad_reserved_revenue;;}

    measure: estimated_youtube_ad_revenue {
    type: sum
    value_format: "\$0.0000"
    sql: ${TABLE}.estimated_youtube_ad_revenue;;}

    measure: estimated_monetized_playbacks {
    type: sum
    sql: ${TABLE}.estimated_monetized_playbacks;;}

    measure: estimated_playback_based_cpm {
    type: sum
    value_format: "\$0.0000"
    sql: ${TABLE}.estimated_playback_based_cpm;;}

    measure: estimated_cpm {
    type: average
    value_format: "\$0.0000"
    sql: ${TABLE}.estimated_cpm;;}

    measure: estimated_partner_red_revenue {
    type: sum
    value_format: "\$0.0000"
    sql: ${TABLE}.estimated_partner_red_revenue;;}

    measure: estimated_partner_transaction_revenue {
    type: sum
    value_format: "\$0.0000"
    sql: ${TABLE}.estimated_partner_transaction_revenue;;}



}
