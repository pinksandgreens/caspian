view: nativo {
  sql_table_name: ad_platform.nativo ;;

  dimension_group: actual_end_date {
      type: time
      timeframes: []
      convert_tz: no
    sql: TO_DATE(SPLIT_PART(${TABLE}."actual.end.date", 'T', 1),'YYYY-MM-DD');;
  }

  dimension_group: actual_start_date {
    type: time
    timeframes: []
    convert_tz: no
    sql: TO_DATE(SPLIT_PART(${TABLE}."actual.start.date", 'T', 1),'YYYY-MM-DD');;
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

  measure: avg_time_on_content {
    type: average
    value_format: "0.00\%"
    sql: ${TABLE}."avg.time.on.content"::float*100 ;;
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

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  dimension: cpm {
    type: string
    sql: ${TABLE}.cpm ;;
  }

  measure: cpm_impressions {
    type: sum
    sql: ${TABLE}."cpm.impressions" ;;
  }

  measure: cta {
    type: sum
    sql: ${TABLE}.cta ;;
  }

  dimension: cta_rate {
    type: string
    value_format: "0.00\%"
    sql: ${TABLE}."cta.rate"::float*100 ;;
  }

  measure: ctr {
    type: average
    value_format: "0.00\%"
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

  measure: direct_views {
    type: sum
    sql: ${TABLE}."direct.views" ;;
  }

  measure: earned_views {
    type: sum
    sql: ${TABLE}."earned.views" ;;
  }

  measure: engaged_ctr {
    type: average
    value_format: "0.00\%"
    sql: ${TABLE}."engaged.ctr"::float*100 ;;
  }

  measure: engagement_rate {
    type: average
    value_format: "0.00\%"
    sql: ${TABLE}."engagement.rate"::float*100 ;;
  }

  dimension: engagements {
    type: string
    sql: ${TABLE}.engagements ;;
  }

  dimension_group: flight_end_date {
      type: time
      timeframes: []
      convert_tz: no
    sql: TO_DATE(SPLIT_PART(${TABLE}."flight.end.date", 'T', 1),'YYYY-MM-DD');;

  }

  dimension_group: flight_start_date {
    type: time
    timeframes: []
    convert_tz: no
    sql: TO_DATE(SPLIT_PART(${TABLE}."flight.start.date", 'T', 1),'YYYY-MM-DD');;
  }

  dimension: gross_budget_spent {
    type: string
    sql: ${TABLE}."gross.budget.spent" ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  measure: page_views {
    type: sum
    sql: ${TABLE}."page.views" ;;
  }

  measure: page_views_rate {
    type: average
    value_format: "0.00\%"
    sql: ${TABLE}."page.views.rate"::float*100 ;;
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
    hidden: yes
    sql: ${TABLE}.rownum ;;
  }

  measure: shares {
    type: sum
    sql: ${TABLE}.shares ;;
  }

  measure: slide_views {
    type: sum
    sql: ${TABLE}."slide.views" ;;
  }

  measure: time_on_content {
    type: sum
    sql: ${TABLE}."time.on.content" ;;
  }

  measure: vcpm_impressions {
    type: sum
    sql: ${TABLE}."vcpm.impressions" ;;
  }

  measure: video_completion_rate {
    type: average
    value_format: "0.00\%"
    sql: ${TABLE}."video.completion.rate"::float*100 ;;
  }

  measure: video_views {
    type: sum
    sql: ${TABLE}."video.views" ;;
  }

  measure: video_views_to_100_ {
    type: sum
    sql: ${TABLE}."video.views.to.100." ;;
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

  measure: vtr {
    type: average
    value_format: "0.00\%"
    sql: ${TABLE}.vtr::float*100 ;;
  }

  measure: x__gross_budget_spent {
    type: average
    value_format: "0.00\%"
    label: "% Gross Budget Spent"
    sql: ${TABLE}."x..gross.budget.spent"::float*100 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      advertiser_name,
      campaign_name,
      budget_name,
      ad_name,
      category_name,
      publisher_name,
      publication_name,
      placement_name,
      device_name
    ]
  }
}
