view: ga_page_metrics_month_20170301 {
  sql_table_name: [bauerxcel.com:api-project-792028032348:ga_editorial_data.ga_page_metrics_month_20170301]
    ;;

  dimension: account_id {
    type: string
    sql: ${TABLE}.accountId ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: mnth {
    type: number
    sql: ${TABLE}.mnth ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}.page_views ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  dimension: view_id {
    type: string
    sql: ${TABLE}.viewId ;;
  }

  dimension: web_property_id {
    type: string
    sql: ${TABLE}.webPropertyId ;;
  }

  dimension: yr {
    type: number
    sql: ${TABLE}.yr ;;
  }

  measure: Pageviews {
    type: count
    sql: ${TABLE}.page_views ;;
    approximate_threshold: 100000
    drill_fields: [hostname]
  }
}
