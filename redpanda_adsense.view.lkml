view: adsense {
  sql_table_name: ad_platform.adsense ;;

  measure: ad_requests {
    type: sum
    sql: ${TABLE}.ad_requests ;;
  }

  measure: ad_requests_coverage {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.ad_requests_coverage::float*100;;
        }

  measure: ad_requests_ctr {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.ad_requests_ctr::float*100 ;;
  }

  measure: ad_requests_rpm_gbp {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."ad_requests_rpm (gbp)" ;;
  }

  dimension: ad_unit_code {
    type: string
    sql: ${TABLE}.ad_unit_code ;;
  }

  dimension: ad_unit_id {
    type: string
    sql: ${TABLE}.ad_unit_id ;;
  }

  dimension: ad_unit_name {
    type: string
    sql: ${TABLE}.ad_unit_name ;;
  }

  dimension: ad_unit_size_code {
    type: string
    sql: ${TABLE}.ad_unit_size_code ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  measure: cost_per_click_gbp {
    type: average
    value_format: "\£0.0000"
    sql: ${TABLE}."cost_per_click (gbp)"::float ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }

  measure: earnings_gbp {
    type: sum
    value_format: "\£0.00"
    sql: ${TABLE}."earnings (gbp)"::float ;;
  }

  measure: individual_ad_impressions {
    type: sum
    sql: ${TABLE}.individual_ad_impressions ;;
  }

  measure: individual_ad_impressions_ctr {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.individual_ad_impressions_ctr::float*100 ;;
  }

  measure: individual_ad_impressions_rpm_gbp {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."individual_ad_impressions_rpm (gbp)"::float ;;
  }

  measure: matched_ad_requests {
    type: sum
    sql: ${TABLE}.matched_ad_requests ;;
  }

  measure: matched_ad_requests_ctr {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.matched_ad_requests_ctr::float*100 ;;
  }

  measure: matched_ad_requests_rpm_gbp {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."matched_ad_requests_rpm (gbp)"::float ;;
  }

  measure: page_views {
    type: sum
    sql: ${TABLE}.page_views ;;
  }

  measure: page_views_ctr {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}.page_views_ctr::float*100 ;;
  }

  measure: page_views_rpm_gbp {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."page_views_rpm (gbp)"::float ;;
  }

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [ad_unit_name, country_name]
  }
}
