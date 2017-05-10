view: dfp_lookup {
  sql_table_name: ad_platform.dfp_lookup ;;

  dimension: column_total_line_item_level_impressions {
    hidden: yes
    type: string
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
    sql: REPLACE(REPLACE(${TABLE}."dimension.ad_unit_name", '»','?'),' ','') ;;
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

  dimension: dimension_advertiser_id {
    label: "Advertiser ID"
    type: string
    sql: ${TABLE}."dimension.advertiser_id" ;;
  }

  dimension: dimension_advertiser_name {
    label: "Advertiser Name"
    type: string
    sql: ${TABLE}."dimension.advertiser_name" ;;
  }

  dimension: dimension_aggregated_demand_channel {
    label: "Demand Channel"
    type: string
    sql: ${TABLE}."dimension.aggregated_demand_channel" ;;
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

  dimension: key {
    type: string
    primary_key: yes
    sql: ${TABLE}.key ;;
  }

  measure: count {
    type: count
    drill_fields: [dimension_creative_name, dimension_ad_unit_name, dimension_advertiser_name, dimension_order_name, dimension_line_item_name]
  }
}
