view: teads {
  sql_table_name: ad_platform.teads ;;

  dimension: ad {
    type: string
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_start {
    type: string
    sql: ${TABLE}.ad_start ;;
  }

  measure: click {
    type: sum
    sql: ${TABLE}.click ;;
  }

  measure: clickrate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}."click-rate"::float*100 ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.day,'YYYY/MM/DD') ;;
  }

  measure: impression {
    type: sum
    sql: ${TABLE}.impression ;;
  }

  measure: income_converted_gbp {
    label: "Income (USB)"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.income_converted_gbp::float ;;
  }

  measure: income_value {
    hidden: yes
    type: sum
    value_format: "0.0000"
    sql: ${TABLE}.income_value::float  ;;
  }

  dimension: placement {
    type: string
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}.placement_id ;;
  }

  measure: revenue {
    label: "Revenue GBP"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.revenue::float ;;
  }

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: start {
    label: "Video Starts"
    type: sum
    sql: ${TABLE}.start ;;
  }

  measure: count {
    hidden:  yes
    type: count
    drill_fields: []
  }
}
