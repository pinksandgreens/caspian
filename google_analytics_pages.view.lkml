view: google_analytics_pages {
  sql_table_name: publications.google_analytics_pages ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension_group: date {
    label: "Recorded"
    type: time
    timeframes: [date, week, month, month_num]
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: pagepath {
    label: "Page path"
    type: string
    sql: ${TABLE}.pagepath ;;
  }

  measure: pageviews {
    label: "Page Views"
    type: sum
    sql: ${TABLE}.pageviews ;;
  }
}
