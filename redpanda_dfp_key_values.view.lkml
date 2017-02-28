view: dfp_key_values {
  sql_table_name: ad_platform.dfp_key_values ;;

  dimension: column_total_line_item_level_clicks {
    type: string
    sql: ${TABLE}."column.total_line_item_level_clicks" ;;
  }

  dimension: column_total_line_item_level_impressions {
    type: string
    sql: ${TABLE}."column.total_line_item_level_impressions" ;;
  }

  dimension: dimension_ad_unit_id {
    type: string
    sql: ${TABLE}."dimension.ad_unit_id" ;;
  }

  dimension: dimension_ad_unit_name {
    type: string
    sql: ${TABLE}."dimension.ad_unit_name" ;;
  }

  dimension: dimension_country_criteria_id {
    type: string
    sql: ${TABLE}."dimension.country_criteria_id" ;;
  }

  dimension: dimension_country_name {
    type: string
    sql: ${TABLE}."dimension.country_name" ;;
  }

  dimension: dimension_creative_id {
    type: string
    sql: ${TABLE}."dimension.creative_id" ;;
  }

  dimension: dimension_creative_name {
    type: string
    sql: ${TABLE}."dimension.creative_name" ;;
  }

  dimension: dimension_creative_size {
    type: string
    sql: ${TABLE}."dimension.creative_size" ;;
  }

  dimension: dimension_custom_criteria {
    type: string
    sql: ${TABLE}."dimension.custom_criteria" ;;
  }

  dimension: dimension_custom_targeting_value_id {
    type: string
    sql: ${TABLE}."dimension.custom_targeting_value_id" ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}."dimension.date",'YYYY-MM-DD') ;;
  }

  dimension: dimension_line_item_id {
    type: string
    sql: ${TABLE}."dimension.line_item_id" ;;
  }

  dimension: dimension_line_item_name {
    type: string
    sql: ${TABLE}."dimension.line_item_name" ;;
  }

  dimension: dimension_line_item_type {
    type: string
    sql: ${TABLE}."dimension.line_item_type" ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: count {
    type: count
    drill_fields: [dimension_line_item_name, dimension_creative_name, dimension_ad_unit_name, dimension_country_name]
  }
}
