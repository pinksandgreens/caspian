view: nativo {
  sql_table_name: ad_platform.nativo ;;

  dimension: actual_end_date {
    type: string
    sql: ${TABLE}."actual.end.date" ;;
  }

  dimension: actual_start_date {
    type: string
    sql: ${TABLE}."actual.start.date" ;;
  }

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

  dimension: budget_id {
    type: string
    sql: ${TABLE}."budget.id" ;;
  }

  dimension: budget_name {
    type: string
    sql: ${TABLE}."budget.name" ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}."campaign.id" ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}."campaign.name" ;;
  }

  dimension: category_id {
    type: string
    sql: ${TABLE}."category.id" ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}."category.name" ;;
  }

  dimension: clicks {
    type: string
    sql: ${TABLE}.clicks ;;
  }

  dimension: cpm {
    type: string
    sql: ${TABLE}.cpm ;;
  }

  dimension: cpm_impressions {
    type: string
    sql: ${TABLE}."cpm.impressions" ;;
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

  dimension: direct_views {
    type: string
    sql: ${TABLE}."direct.views" ;;
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

  dimension: flight_end_date {
    type: string
    sql: ${TABLE}."flight.end.date" ;;
  }

  dimension: flight_start_date {
    type: string
    sql: ${TABLE}."flight.start.date" ;;
  }

  dimension: gross_budget_spent {
    type: string
    sql: ${TABLE}."gross.budget.spent" ;;
  }

  dimension: impressions {
    type: string
    sql: ${TABLE}.impressions ;;
  }

  dimension: page_views {
    type: string
    sql: ${TABLE}."page.views" ;;
  }

  dimension: page_views_rate {
    type: string
    sql: ${TABLE}."page.views.rate" ;;
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

  dimension: publisher_id {
    type: string
    sql: ${TABLE}."publisher.id" ;;
  }

  dimension: publisher_name {
    type: string
    sql: ${TABLE}."publisher.name" ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: shares {
    type: string
    sql: ${TABLE}.shares ;;
  }

  dimension: slide_views {
    type: string
    sql: ${TABLE}."slide.views" ;;
  }

  dimension: time_on_content {
    type: string
    sql: ${TABLE}."time.on.content" ;;
  }

  dimension: vcpm_impressions {
    type: string
    sql: ${TABLE}."vcpm.impressions" ;;
  }

  dimension: video_completion_rate {
    type: string
    sql: ${TABLE}."video.completion.rate" ;;
  }

  dimension: video_views {
    type: string
    sql: ${TABLE}."video.views" ;;
  }

  dimension: video_views_to_100_ {
    type: string
    sql: ${TABLE}."video.views.to.100." ;;
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

  dimension: vtr {
    type: string
    sql: ${TABLE}.vtr ;;
  }

  dimension: x__gross_budget_spent {
    type: string
    sql: ${TABLE}."x..gross.budget.spent" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      device_name,
      campaign_name,
      placement_name,
      publication_name,
      ad_name,
      publisher_name,
      advertiser_name,
      category_name,
      budget_name
    ]
  }
}
