view: google_analytics_dfp {
  sql_table_name: publications.google_analytics_dfp ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: channel_grouping {
    type: string
    sql: CASE
        WHEN ${TABLE}.channelgrouping = 'Direct' THEN 'Direct'
        WHEN ${TABLE}.channelgrouping = 'Email' THEN 'Email'
        WHEN ${TABLE}.channelgrouping = 'Organic Search' THEN 'Organic Search'
        WHEN ${TABLE}.channelgrouping = 'Referral' THEN 'Referral'
        WHEN ${TABLE}.channelgrouping = 'Social' THEN 'Social'
        ELSE 'Referral'
      END
       ;;
  }

  dimension_group: date {
    label: "Recorded"
    type: time
    timeframes: [date, week, month, month_num]
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }

  dimension: device_category {
    type: string
    sql: CASE
        WHEN ${TABLE}.devicecategory = 'desktop' THEN 'Desktop'
        WHEN ${TABLE}.devicecategory = 'mobile' THEN 'Mobile'
        WHEN ${TABLE}.devicecategory = 'tablet' THEN 'Tablet'
        ELSE 'Desktop'
      END
       ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.dfpclicks ;;
  }

  measure: coverage {
    type: average
    value_format: "0.00\"%\""
    sql: ((1.00)*(${TABLE}.dfpcoverage::float)) ;;
  }

  measure: ctr {
    type: average
    value_format: "0.00\"%\""
    sql: (1.00)*(${TABLE}.dfpctr::float) ;;
  }

  measure: ecpm {
    type: average
    value_format: "0.00"
    sql: (1.00)*(${TABLE}.dfpecpm::float) ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.dfpimpressions ;;
  }

  measure: impressions_per_session {
    type: average
    value_format: "0.00"
    sql: (1.00)*(${TABLE}.dfpimpressionspersession::float) ;;
  }

  #    sql: AVG((1.00)*(${TABLE}.dfpimpressionspersession::float) WHERE (1.00)*(${TABLE}.dfpimpressionspersession::float)>0

  measure: monetized_pageviews {
    type: sum
    sql: ${TABLE}.dfpmonetizedpageviews ;;
  }

  measure: revenue {
    type: sum
    value_format: "$0.00"
    sql: (1.00)*(${TABLE}.dfprevenue::float) ;;
  }

  measure: revenue_per_1000_sessions {
    type: average
    sql: ${TABLE}.dfprevenueper1000sessions ;;
  }

  measure: viewable_impressions_percent {
    type: average
    sql: ${TABLE}.dfpviewableimpressions ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: page_path {
    type: string
    sql: ${TABLE}.pagepath ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
}
