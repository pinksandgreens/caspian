view: dfp_key_values {
  sql_table_name: ad_platform.dfp_key_values ;;

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

  dimension: dimension_custom_criteria {
    label: "Custom Criteria"
    type: string
    sql: ${TABLE}."dimension.custom_criteria" ;;
  }

  dimension: dimension_custom_criteria1 {
    label: "Custom Criteria Title"
    type: string
   sql: SPLIT_PART(${TABLE}."dimension.custom_criteria", '=', 1) ;;
  }

# ADDED FOR REPORTING BY ALEX
  dimension: dimension_custom_criteria2 {
    label: "Custom Criteria Value"
    type: string
    sql: SPLIT_PART(${TABLE}."dimension.custom_criteria", '=', 2) ;;
  }

  dimension: dimension_custom_criteria3 {
    label: "Custom Criteria Make"
    type: string
    sql: SPLIT_PART(${dimension_custom_criteria2}, '_', 1) ;;
  }

  dimension: dimension_custom_criteria4 {
    label: "Custom Criteria Model"
    type: string
    sql: SPLIT_PART(${dimension_custom_criteria2}, '_', 2) ;;
  }
# ALEX END


  dimension: dimension_custom_targeting_value_id {
    label: "Custom Targetting Value ID"
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

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [dimension_line_item_name, dimension_creative_name, dimension_ad_unit_name, dimension_country_name]
  }
}
