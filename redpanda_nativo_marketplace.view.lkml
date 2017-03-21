view: nativo_marketplace {
  sql_table_name: ad_platform.nativo_marketplace ;;

  dimension: ad_id {
    type: string
    sql: ${TABLE}."ad.id" ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}."ad.name" ;;
  }

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}."advertiser.id" ;;
  }

  dimension: advertiser_name {
    type: string
    sql: ${TABLE}."advertiser.name" ;;
  }

  measure: avg_time_on_content {
    value_format: "0.0000"
    type: average
    sql: ${TABLE}."avg.time.on.content"::float ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}."campaign.id" ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."campaign.name" ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  measure: cta {
    type: sum
    sql: ${TABLE}.cta ;;
  }

  measure: cta_rate {
    type: average
    value_format: "0.0000"
    sql: ${TABLE}."cta.rate"::float ;;
  }

  measure: ctr {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.ctr::float*100 ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(SPLIT_PART(${TABLE}.date, 'T', 1),'YYYY-MM-DD') ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}."device.id" ;;
  }

  dimension: device_name {
    type: string
    sql: ${TABLE}."device.name" ;;
  }

  measure: earned_views {
    type: sum
    sql: ${TABLE}."earned.views" ;;
  }

  measure: engaged_ctr {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}."engaged.ctr"::float*100 ;;
  }

  measure: engagement_rate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}."engagement.rate"::float*100 ;;
  }

  measure: engagements {
    type: sum
    sql: ${TABLE}.engagements ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  measure: page_views {
    type: sum
    sql: ${TABLE}."page.views" ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}."placement.id" ;;
  }

  dimension: placement_name {
    type: string
    sql: ${TABLE}."placement.name" ;;
  }

  dimension: publication_id {
    type: string
    sql: ${TABLE}."publication.id" ;;
  }

  dimension: publication_name {
    type: string
    sql: ${TABLE}."publication.name" ;;
  }

  measure: publisher_cpm {
    type: average
    value_format: "\£0.0000"
    sql: ${TABLE}."publisher.cpm"::float ;;
  }

  dimension: publisher_id {
    type: string
    sql: ${TABLE}."publisher.id" ;;
  }

  dimension: publisher_name {
    type: string
    sql: ${TABLE}."publisher.name" ;;
  }

  measure: publisher_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."publisher.revenue"::float ;;
  }



  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: shares {
    type: sum
    sql: ${TABLE}.shares ;;
  }

  measure: time_on_content {
    type: sum
    sql: ${TABLE}."time.on.content" ;;
  }

  measure: video_completion_rate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}."video.completion.rate"::float*100 ;;
  }

  measure: video_views {
    type: sum
    sql: ${TABLE}."video.views" ;;
  }

  measure: video_views_to_25_ {
    type: sum
    sql: ${TABLE}."video.views.to.25." ;;
  }

  measure: video_views_to_50_ {
    type: sum
    sql: ${TABLE}."video.views.to.50." ;;
  }

  measure: video_views_to_75_ {
    type: sum
    sql: ${TABLE}."video.views.to.75." ;;
  }

  measure: views_to_15_seconds {
    type: sum
    sql: ${TABLE}."views.to.15.seconds" ;;
  }

  measure: views_to_30_seconds {
    type: sum
    sql: ${TABLE}."views.to.30.seconds" ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      advertiser_name,
      campaign_name,
      ad_name,
      publisher_name,
      publication_name,
      placement_name,
      device_name
    ]
  }
}
