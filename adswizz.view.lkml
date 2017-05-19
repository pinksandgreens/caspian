view: adswizz {
  sql_table_name: ad_platform.adswizz ;;

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: brand_id {
    type: string
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_id_name {
    type: string
    sql: ${TABLE}.brand_id_name ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: brand_region {
    type: string
    sql: ${TABLE}.brand_region ;;
  }

  dimension: brand_station {
    type: string
    sql: ${TABLE}.brand_station ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  dimension_group: date {
    label: "Recorded"
    type: time
    timeframes: [date, week, month, month_num, month_name, day_of_month, year]
    convert_tz: no
    sql: ${TABLE}.datetime::timestamp ;;
  }



  measure: ecpm {
    type: average
    value_format: "0.00"
    sql: ${TABLE}.ecpm::float ;;
  }

  measure: exposure_time_seconds {
    label: "Total Exposure Time (s)"
    type: sum
    value_format: "0.00"
    sql: ${TABLE}.exposure_time_seconds::float ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  measure: impressions_booked_campaign_objective {
    type: sum
    sql: ${TABLE}.impressions_booked_campaign_objective ;;
  }

  measure: impressions_booked_clickable_ads {
    type: sum
    sql: ${TABLE}.impressions_booked_clickable_ads ;;
  }

  measure: listening_view_through_rate {
    type: average
    value_format: "0.00\%"
    sql: ${TABLE}.listening_view_through_rate::float*100 ;;
  }

  dimension: publisher_id {
    type: string
    sql: ${TABLE}.publisher_id ;;
  }

  measure: revenue {
    type: sum
    value_format: "\£0.00"
    sql: ${TABLE}.revenue::float ;;
  }

  measure: count {
    type: count
    drill_fields: [brand_id_name, brand_name]
  }
}
