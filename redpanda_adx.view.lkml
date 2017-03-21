view: adx {
  sql_table_name: ad_platform.adx ;;

  measure: ad_requests {
    type: sum
    sql: ${TABLE}.ad_requests ;;
  }

  dimension: ad_tag_name {
    type: string
    sql: ${TABLE}.ad_tag_name ;;
  }

  dimension: ad_unit_size_name {
    type: string
    sql: ${TABLE}.ad_unit_size_name ;;
  }

  dimension: advertiser_name {
    type: string
    sql: ${TABLE}.advertiser_name ;;
  }

  dimension: buyer_network_name {
    type: string
    sql: ${TABLE}.buyer_network_name ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.domain_name ;;
  }

  dimension: dsp_name {
    type: string
    sql: ${TABLE}.dsp_name ;;
  }

  measure: earnings_gbp {
    label: "Earnings (GBP)"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."earnings..gbp."::float ;;
  }

  measure: individual_ad_impressions {
    type: sum
    sql: ${TABLE}.individual_ad_impressions ;;
  }

  measure: matched_ad_requests {
    type: sum
    sql: ${TABLE}.matched_ad_requests ;;
  }

  dimension: platform_type_name {
    type: string
    sql: ${TABLE}.platform_type_name ;;
  }

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: transaction_type_name {
    type: string
    sql: ${TABLE}.transaction_type_name ;;
  }

  dimension: url_channel_name {
    type: string
    sql: ${TABLE}.url_channel_name ;;
  }

  dimension: video_ad_format {
    type: string
    sql: ${TABLE}.video_ad_format ;;
  }

  dimension: video_ad_duration {
    type: string
    sql: ${TABLE}.video_ad_duration ;;
  }

  measure: video_ad_abandonment {
    type: average
    value_format: "0.00\%"
    description: "% of users that abandoned the video ad"
    sql: CASE
          WHEN ${TABLE}.video_ad_abandonment_ratio = 'NA' THEN '0'
          ELSE ${TABLE}.video_ad_abandonment_ratio::float*100
         END;;
  }

  measure: cost_per_click {
    label: "Cost Per Click (GBP)"
    description: "Revenue per click - revenue/clicks"
    type: average
    value_format: "\£0.0000"
    sql: CASE
          WHEN ${TABLE}."cost_per_click..gbp." = 'NA' THEN '0'
          ELSE ${TABLE}."cost_per_click..gbp."::float
         END;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      domain_name,
      ad_tag_name,
      ad_unit_size_name,
      advertiser_name,
      buyer_network_name,
      country_name,
      dsp_name,
      platform_type_name,
      transaction_type_name,
      url_channel_name
    ]
  }
}