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

  dimension: avg_time_on_content {
    type: string
    sql: ${TABLE}."avg.time.on.content" ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}."campaign.id" ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."campaign.name" ;;
  }

  dimension: clicks {
    type: string
    sql: ${TABLE}.clicks ;;
  }

  dimension: cta {
    type: string
    sql: ${TABLE}.cta ;;
  }

  dimension: cta_rate {
    type: string
    sql: ${TABLE}."cta.rate" ;;
  }

  dimension: ctr {
    type: string
    sql: ${TABLE}.ctr ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}."device.id" ;;
  }

  dimension: device_name {
    type: string
    sql: ${TABLE}."device.name" ;;
  }

  dimension: earned_views {
    type: string
    sql: ${TABLE}."earned.views" ;;
  }

  dimension: engaged_ctr {
    type: string
    sql: ${TABLE}."engaged.ctr" ;;
  }

  dimension: engagement_rate {
    type: string
    sql: ${TABLE}."engagement.rate" ;;
  }

  dimension: engagements {
    type: string
    sql: ${TABLE}.engagements ;;
  }

  dimension: impressions {
    type: string
    sql: ${TABLE}.impressions ;;
  }

  dimension: page_views {
    type: string
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

  dimension: publisher_cpm {
    type: string
    sql: ${TABLE}."publisher.cpm" ;;
  }

  dimension: publisher_id {
    type: string
    sql: ${TABLE}."publisher.id" ;;
  }

  dimension: publisher_name {
    type: string
    sql: ${TABLE}."publisher.name" ;;
  }

  dimension: publisher_revenue {
    type: string
    sql: ${TABLE}."publisher.revenue" ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: shares {
    type: string
    sql: ${TABLE}.shares ;;
  }

  dimension: time_on_content {
    type: string
    sql: ${TABLE}."time.on.content" ;;
  }

  dimension: video_completion_rate {
    type: string
    sql: ${TABLE}."video.completion.rate" ;;
  }

  dimension: video_views {
    type: string
    sql: ${TABLE}."video.views" ;;
  }

  dimension: video_views_to_25_ {
    type: string
    sql: ${TABLE}."video.views.to.25." ;;
  }

  dimension: video_views_to_50_ {
    type: string
    sql: ${TABLE}."video.views.to.50." ;;
  }

  dimension: video_views_to_75_ {
    type: string
    sql: ${TABLE}."video.views.to.75." ;;
  }

  dimension: views_to_15_seconds {
    type: string
    sql: ${TABLE}."views.to.15.seconds" ;;
  }

  dimension: views_to_30_seconds {
    type: string
    sql: ${TABLE}."views.to.30.seconds" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      campaign_name,
      ad_name,
      publication_name,
      placement_name,
      advertiser_name,
      device_name,
      publisher_name
    ]
  }
}
