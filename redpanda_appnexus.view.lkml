view: appnexus {
  sql_table_name: ad_platform.appnexus ;;

  dimension: advertiser_currency {
    type: string
    sql: ${TABLE}.advertiser_currency ;;
  }

  dimension: click_thru_pct {
    type: string
    sql: ${TABLE}.click_thru_pct ;;
  }

  dimension: clicks {
    type: string
    sql: ${TABLE}.clicks ;;
  }

  dimension: clicks_1 {
    type: string
    sql: ${TABLE}."clicks.1" ;;
  }

  dimension: convs_rate {
    type: string
    sql: ${TABLE}.convs_rate ;;
  }

  dimension: cost {
    type: string
    sql: ${TABLE}.cost ;;
  }

  dimension: cpm {
    type: string
    sql: ${TABLE}.cpm ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.day,'YYYY-MM-DD') ;;
  }

  dimension: imps {
    type: string
    sql: ${TABLE}.imps ;;
  }

  dimension: imps_1 {
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

  dimension: ppm {
    type: string
    sql: ${TABLE}.ppm ;;
  }

  dimension: profit {
    type: string
    sql: ${TABLE}.profit ;;
  }

  dimension: publisher_id {
    type: string
    sql: ${TABLE}.publisher_id ;;
  }

  dimension: publisher_name {
    type: string
    sql: ${TABLE}.publisher_name ;;
  }

  dimension: revenue {
    type: string
    sql: ${TABLE}.revenue ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: rpm {
    type: string
    sql: ${TABLE}.rpm ;;
  }

  dimension: total_convs {
    type: string
    sql: ${TABLE}.total_convs ;;
  }

  dimension: total_network_rpm {
    type: string
    sql: ${TABLE}.total_network_rpm ;;
  }

  measure: count {
    type: count
    drill_fields: [placement_name, publisher_name]
  }
}
