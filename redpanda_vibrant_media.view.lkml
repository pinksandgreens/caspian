view: vibrant_media {
  sql_table_name: ad_platform.vibrant_media ;;

  measure: adviews {
    label: "Ad Views"
    type: sum
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

  measure: pageviews {
    type: sum
    sql: ${TABLE}.pageviews ;;
  }

  measure: revenue {
    label: "Revenue (GBP)"
    type: sum
    value_format: "\£0.00"
    sql: ${TABLE}.revenue::float ;;
  }

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
