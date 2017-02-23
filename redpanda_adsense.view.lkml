view: adsense {
  sql_table_name: ad_platform.adsense ;;

  dimension: ad_requests {
    type: string
    sql: ${TABLE}.ad_requests ;;
  }

  dimension: ad_requests_coverage {
    type: string
    sql: ${TABLE}.ad_requests_coverage ;;
  }

  dimension: ad_requests_ctr {
    type: string
    sql: ${TABLE}.ad_requests_ctr ;;
  }

  dimension: ad_requests_rpm_gbp {
    type: string
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

  dimension: clicks {
    type: string
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost_per_click_gbp {
    type: string
    sql: ${TABLE}."cost_per_click (gbp)" ;;
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

  dimension: earnings_gbp {
    type: string
    sql: ${TABLE}."earnings (gbp)" ;;
  }

  dimension: individual_ad_impressions {
    type: string
    sql: ${TABLE}.individual_ad_impressions ;;
  }

  dimension: individual_ad_impressions_ctr {
    type: string
    sql: ${TABLE}.individual_ad_impressions_ctr ;;
  }

  dimension: individual_ad_impressions_rpm_gbp {
    type: string
    sql: ${TABLE}."individual_ad_impressions_rpm (gbp)" ;;
  }

  dimension: matched_ad_requests {
    type: string
    sql: ${TABLE}.matched_ad_requests ;;
  }

  dimension: matched_ad_requests_ctr {
    type: string
    sql: ${TABLE}.matched_ad_requests_ctr ;;
  }

  dimension: matched_ad_requests_rpm_gbp {
    type: string
    sql: ${TABLE}."matched_ad_requests_rpm (gbp)" ;;
  }

  dimension: page_views {
    type: string
    sql: ${TABLE}.page_views ;;
  }

  dimension: page_views_ctr {
    type: string
    sql: ${TABLE}.page_views_ctr ;;
  }

  dimension: page_views_rpm_gbp {
    type: string
    sql: ${TABLE}."page_views_rpm (gbp)" ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: count {
    type: count
    drill_fields: [ad_unit_name, country_name]
  }
}
