view: google_analytics_marconi {
  sql_table_name: publications.google_analytics_marconi ;;

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

  dimension: channelgrouping {
    type: string
    sql: ${TABLE}.channelgrouping ;;
  }

  dimension_group: date {
    label: "Recorded"
    type: time
    timeframes: [date, week, week_of_year, month, month_num, month_name, year, quarter]
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: devicecategory {
    type: string
    sql: ${TABLE}.devicecategory ;;
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

  measure: users {
    type: sum
    sql: ${TABLE}.users ;;
  }

  measure: pages_per_session {
    type: number
    value_format: "0.00"
    sql: ${pageviews}/${sessions} ;;
  }

}
