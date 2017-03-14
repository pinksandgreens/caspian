view: vibrant_media {
  sql_table_name: ad_platform.vibrant_media ;;

  dimension: adviews {
    type: string
    sql: ${TABLE}.adviews ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYYMMDD') ;;
  }

  dimension: pageviews {
    type: string
    sql: ${TABLE}.pageviews ;;
  }

  measure: revenue {
    label: "Revenue (GBP)"
    type: sum
    value_format: "\£0.00"
    sql: ${TABLE}.revenue::float ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
