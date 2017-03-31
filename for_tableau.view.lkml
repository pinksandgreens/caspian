view: for_tableau {
  sql_table_name: [bauerxcel.com:api-project-792028032348:Staging.for_tableau]
    ;;

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: hits_page_hostname {
    type: string
    sql: ${TABLE}.hits_page_hostname ;;
  }

  dimension: hits_page_page_path {
    type: string
    sql: ${TABLE}.hits_page_pagePath ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: traffic_source_medium {
    type: string
    sql: ${TABLE}.trafficSource_medium ;;
  }

  dimension: traffic_source_source {
    type: string
    sql: ${TABLE}.trafficSource_source ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [hits_page_hostname]
  }
}
