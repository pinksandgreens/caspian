view: dfp_devices {
  sql_table_name: ad_platform.dfp_devices ;;

  measure: column_ad_exchange_line_item_level_clicks {
    label: "Adx - Line Item Clicks"
    type: sum
    sql: ${TABLE}."column.ad_exchange_line_item_level_clicks" ;;
  }

  measure: column_ad_exchange_line_item_level_impressions {
    label: "Adx - Line Item Impressions"
    type: sum
    sql: ${TABLE}."column.ad_exchange_line_item_level_impressions" ;;
  }

  measure: column_ad_exchange_line_item_level_revenue {
    label: "Adx - Line Item Revenue"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."column.ad_exchange_line_item_level_revenue"::float/1000000 ;;
  }

  measure: column_total_line_item_level_clicks {
    label: "Total Line Item Clicks"
    type: sum
    sql: ${TABLE}."column.total_line_item_level_clicks" ;;
  }

  measure: column_total_line_item_level_impressions {
    label: "Total Line Item Impressions"
    type: sum
    sql: ${TABLE}."column.total_line_item_level_impressions" ;;
  }

  dimension: dimension_ad_unit_id {
    label: "Ad Unit ID"
    type: string
    sql: ${TABLE}."dimension.ad_unit_id" ;;
  }

  dimension: dimension_ad_unit_name {
    label: "Ad Unit Name"
    type: string
     sql: REPLACE(REPLACE(${TABLE}."dimension.ad_unit_name", '»','?'),' ','');;
  }

  dimension: Ad_Unit_Name_Path_1 {
    type: string
    sql: SPLIT_PART(${dimension_ad_unit_name}, '?', 1) ;;
  }

  dimension: Ad_Unit_Name_Path_2 {
    type: string
    sql: SPLIT_PART(${dimension_ad_unit_name}, '?', 2) ;;
  }

  dimension: Ad_Unit_Name_Path_3 {
    type: string
    sql: SPLIT_PART(${dimension_ad_unit_name}, '?', 3) ;;
  }

  dimension: Ad_Unit_Name_Path_4 {
    type: string
    sql: SPLIT_PART(${dimension_ad_unit_name}, '?', 4) ;;
  }

  dimension: Ad_Unit_Name_Path_5 {
    type: string
    sql: SPLIT_PART(${dimension_ad_unit_name}, '?', 5) ;;
  }

  dimension: Ad_Unit_Name_Path_6 {
    type: string
    sql: SPLIT_PART(${dimension_ad_unit_name}, '?', 6) ;;
  }


  dimension: dimension_country_criteria_id {
    label: "Country Criteria ID"
    type: string
    sql: ${TABLE}."dimension.country_criteria_id" ;;
  }

  dimension: dimension_country_name {
    label: "Country Name"
    type: string
    sql: ${TABLE}."dimension.country_name" ;;
  }

  dimension: dimension_creative_id {
    label: "Creative ID"
    type: string
    sql: ${TABLE}."dimension.creative_id" ;;
  }

  dimension: dimension_creative_name {
    label: "Creative Name"
    type: string
    sql: ${TABLE}."dimension.creative_name" ;;
  }

  dimension: dimension_creative_size {
    label: "Creative Size"
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
    label: "Category ID"
    type: string
    sql: ${TABLE}."dimension.device_category_id" ;;
  }

  dimension: dimension_device_category_name {
    label: "Category Name"
    type: string
    sql: ${TABLE}."dimension.device_category_name" ;;
  }

  dimension: dimension_line_item_id {
    label: "Line Item ID"
    type: string
    sql: ${TABLE}."dimension.line_item_id" ;;
  }

  dimension: dimension_line_item_name {
    label: "Line Item Name"
    type: string
    sql: ${TABLE}."dimension.line_item_name" ;;
  }

  dimension: dimension_line_item_type {
    label: "Line Item Type"
    type: string
    sql: ${TABLE}."dimension.line_item_type" ;;
  }

  dimension: dimension_order_id {
    label: "Order ID"
    type: string
    sql: ${TABLE}."dimension.order_id" ;;
  }

  dimension: dimension_order_name {
    label: "Order Name"
    type: string
    sql: ${TABLE}."dimension.order_name" ;;
  }

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: count {
    hidden: yes
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
