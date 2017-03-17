view: appnexus {
  sql_table_name: ad_platform.appnexus ;;

  dimension: advertiser_currency {
    hidden: no
    type: string
    sql: ${TABLE}.advertiser_currency ;;
  }

  dimension: click_thru_pct_1 {
    hidden: yes
    type: string
    sql: REPLACE(${TABLE}.click_thru_pct, '%', '') ;;
  }

  measure: click_thru_pct {
    type: average
    value_format: "0.0000\%"
    sql: ${click_thru_pct_1}::float;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  dimension: clicks_1 {
    hidden: yes
    type: string
    sql: ${TABLE}."clicks.1" ;;
  }

  measure: convs_rate {
    type: average
    value_format: "0.0000"
    sql: ${TABLE}.convs_rate::float ;;
  }

  measure: cost {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.cost::float ;;
  }

  measure: cpm {
    type: average
    value_format: "\£0.0000"
    sql: ${TABLE}.cpm::float ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.day,'YYYY-MM-DD') ;;
  }

  measure: imps {
    type: sum
    sql: ${TABLE}.imps ;;
  }

  dimension: imps_1 {
    hidden: yes
    type: string
    sql: ${TABLE}."imps.1" ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}.placement_id ;;
  }

  dimension: placement_name {
    type: string
    sql: ${TABLE}.placement_name ;;
  }

  measure: ppm {
    type: average
    value_format: "0.0000"
    sql: ${TABLE}.ppm::float ;;
  }

  measure: profit {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.profit::float ;;
  }

  dimension: publisher_id {
    type: string
    sql: ${TABLE}.publisher_id ;;
  }

  dimension: publisher_name {
    type: string
    sql: ${TABLE}.publisher_name ;;
  }

  measure: revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.revenue::float ;;
  }

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: rpm {
    value_format: "\£0.0000"
    type: average
    sql: ${TABLE}.rpm::float ;;
  }

  measure: total_convs {
    type: sum
    sql: ${TABLE}.total_convs ;;
  }

  measure: total_network_rpm {
    value_format: "\£0.0000"
    type: average
    sql: ${TABLE}.total_network_rpm::float ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [placement_name, publisher_name]
  }
}
