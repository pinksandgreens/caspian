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
    sql: CASE
        WHEN ${TABLE}.uk_pageviews = 'NA' THEN 0
        ELSE ${TABLE}.uk_pageviews::INT
        END
        ;;
  }

  measure: uk_sessions {
    type: sum
    sql: CASE
        WHEN ${TABLE}.uk_sessions = 'NA' THEN 0
        ELSE ${TABLE}.uk_sessions::INT
        END
        ;;
  }

  measure: uk_users {
    type: sum
    sql: CASE
        WHEN ${TABLE}.uk_users = 'NA' THEN 0
        ELSE ${TABLE}.uk_users::INT
        END
        ;;
  }

  measure: users {
    type: sum
    sql: ${TABLE}.users ;;
  }

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }


  measure: uk_pageviews1 {
    type: number
    hidden: yes
    sql: ${uk_pageviews}::float ;;
  }

  measure: uk_sessions1 {
    type: number
    hidden: yes
    sql: ${uk_sessions}::float ;;
  }

  measure: uk_pages_per_session {
    type: number
    value_format: "0.00"
    sql: ${uk_pageviews1}/${uk_sessions1} ;;
  }

  measure: pages_per_session {
    type: number
    value_format: "0.00"
    sql: ${pageviews}/${sessions} ;;
  }

}
