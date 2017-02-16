view: google_analytics_trafficreport {
  sql_table_name: publications.google_analytics_trafficreport ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: branding {
    type: string
    sql: ${TABLE}.branding ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: devicecategory {
    type: string
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  measure: pageviews {
    type: sum
    sql: ${TABLE}.pageviews ;;
  }

  measure: sessions {
    type: sum
    sql: ${TABLE}.sessions ;;
  }

  measure: uk_pageviews {
    type: sum
    sql: ${TABLE}.uk_pageviews ;;
  }

  measure: uk_sessions {
    type: sum
    sql: ${TABLE}.uk_sessions ;;
  }

  measure: uk_users {
    type: sum
    sql: ${TABLE}.uk_users ;;
  }

  measure: users {
    type: sum
    sql: ${TABLE}.users ;;
  }

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }

  measure: count {
    type: count
    drill_fields: [brand_name]
  }
}
