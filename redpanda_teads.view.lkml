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

  dimension: click {
    type: string
    sql: ${TABLE}.click ;;
  }

  dimension: clickrate {
    type: string
    sql: ${TABLE}."click-rate" ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.day,'YYYY/MM/DD') ;;
  }

  dimension: impression {
    type: string
    sql: ${TABLE}.impression ;;
  }

  measure: income_converted_gbp {
    type: sum
    value_format: "0.00"
    sql: ${TABLE}.income_converted_gb::float ;;
  }

  measure: income_value {
    type: sum
    value_format: "0.00"
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
    type: sum
    value_format: "0.00"
    sql: ${TABLE}.revenue::float ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: start {
    type: string
    sql: ${TABLE}.start ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
