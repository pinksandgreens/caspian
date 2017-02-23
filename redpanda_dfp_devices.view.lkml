view: dfp_devices {
  sql_table_name: ad_platform.dfp_devices ;;

  dimension: column_ad_exchange_line_item_level_clicks {
    type: string
    sql: ${TABLE}."column.ad_exchange_line_item_level_clicks" ;;
  }

  dimension: column_ad_exchange_line_item_level_impressions {
    type: string
    sql: ${TABLE}."column.ad_exchange_line_item_level_impressions" ;;
  }

  dimension: column_ad_exchange_line_item_level_revenue {
    type: string
    sql: ${TABLE}."column.ad_exchange_line_item_level_revenue" ;;
  }

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

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}."dimension.date",'YYYY-MM-DD') ;;
  }

  dimension: dimension_device_category_id {
    type: string
    sql: ${TABLE}."dimension.device_category_id" ;;
  }

  dimension: dimension_device_category_name {
    type: string
    sql: ${TABLE}."dimension.device_category_name" ;;
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

  dimension: dimension_order_id {
    type: string
    sql: ${TABLE}."dimension.order_id" ;;
  }

  dimension: dimension_order_name {
    type: string
    sql: ${TABLE}."dimension.order_name" ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      dimension_line_item_name,
      dimension_order_name,
      dimension_creative_name,
      dimension_ad_unit_name,
      dimension_device_category_name,
      dimension_country_name
    ]
  }
}
