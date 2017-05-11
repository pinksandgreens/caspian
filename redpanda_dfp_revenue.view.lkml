view: dfp_revenue {
  sql_table_name: ad_platform.dfp_revenue ;;

  measure: column_ad_exchange_line_item_level_clicks {
    label: "Adx Line Item Clicks"
    type: sum
    sql: ${TABLE}."column.ad_exchange_line_item_level_clicks" ;;
  }

  measure: column_ad_exchange_line_item_level_impressions {
    label: "Adx Line Item Impressions"
    type: sum
    sql: ${TABLE}."column.ad_exchange_line_item_level_impressions" ;;
  }

  measure: column_ad_exchange_line_item_level_revenue {
    label: "Adx Line Item Revenue"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."column.ad_exchange_line_item_level_revenue"::float/1000000 ;;
  }


  measure: column_ad_server_all_revenue {
    label: "Ad Server Revenue"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."column.ad_server_all_revenue"::float/1000000 ;;
  }

  measure: column_ad_server_clicks {
    label: "Ad Server Clicks"
    type: sum
    sql: ${TABLE}."column.ad_server_clicks" ;;
  }

  measure: column_ad_server_cpm_and_cpc_revenue {
    label: "Ad Server CPM & CPC Revenue"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."column.ad_server_cpm_and_cpc_revenue"::float/1000000 ;;
  }

  measure: column_ad_server_ctr {
    label: "Ad Server CTR"
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}."column.ad_server_ctr"::float*100;;
  }

  measure: column_ad_server_impressions {
    label: "Ad Server Impressions"
    type: sum
    sql: ${TABLE}."column.ad_server_impressions" ;;
  }

  measure: column_ad_server_with_cpd_average_ecpm {
    label: "Ad Server with CPD Average eCPM"
    type: average
    value_format: "\£0.0000"
    sql: ${TABLE}."column.ad_server_with_cpd_average_ecpm"::float/1000000 ;;
  }

  measure: column_ad_server_without_cpd_average_ecpm {
    label: "Ad Server without CPD Average eCPM"
    type: average
    value_format: "\£0.0000"
    sql: ${TABLE}."column.ad_server_without_cpd_average_ecpm"::float/1000000 ;;
  }

  measure: column_adsense_line_item_level_clicks {
    label: "Adsense Line Item Clicks"
    type: sum
    sql: ${TABLE}."column.adsense_line_item_level_clicks" ;;
  }

  measure: column_adsense_line_item_level_impressions {
    label: "Adsense Line Item Impressions"
    type: sum
    sql: ${TABLE}."column.adsense_line_item_level_impressions" ;;
  }

  measure: column_adsense_line_item_level_revenue {
    label: "Adsense Line Item Revenue"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."column.adsense_line_item_level_revenue"::float/1000000 ;;
  }

  measure: column_total_line_item_level_all_revenue {
    label: "Total Line Item Revenue"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."column.total_line_item_level_all_revenue"::float/1000000 ;;
  }

  measure: column_total_line_item_level_clicks {
    label: "Total Line Item Clicks"
    type: sum
    sql: ${TABLE}."column.total_line_item_level_clicks" ;;
  }

  measure: column_total_line_item_level_cpm_and_cpc_revenue {
    label: "Total Line Item CPM and CPC Revenue"
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}."column.total_line_item_level_cpm_and_cpc_revenue" ::float/1000000 ;;
  }

  measure: column_total_line_item_level_ctr {
    label: "Total Line Item CTR"
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}."column.total_line_item_level_ctr"::float*100;;
  }

  measure: column_total_line_item_level_impressions {
    label: "Total Line Item Impressions"
    type: sum
    sql: ${TABLE}."column.total_line_item_level_impressions" ;;
  }

  measure: column_total_line_item_level_with_cpd_average_ecpm {
    label: "Total Line Item with CPD Average eCPM"
    type: average
    value_format: "\£0.0000"
    sql: ${TABLE}."column.total_line_item_level_with_cpd_average_ecpm" ::float/1000000 ;;
  }

  measure: column_total_line_item_level_without_cpd_average_ecpm {
    label: "Total Line Item without CPD Average eCPM"
    type: average
    value_format: "\£0.0000"
    sql: ${TABLE}."column.total_line_item_level_without_cpd_average_ecpm" ::float/1000000 ;;
  }

  dimension: dimension_ad_unit_id {
    type: string
    sql: ${TABLE}."dimension.ad_unit_id" ;;
  }

  dimension: dimension_ad_unit_name {
    label: "Ad Unit Name"
    type: string
    sql: REPLACE(REPLACE(${TABLE}."dimension.ad_unit_name", '»','?'),' ','');;
  }

  #Need to create User Defined Ad_Sub_Unit_Name
  #dimension: dimension_ad_sub_unit_name {
  #  label: "Ad Sub Unit Name"
  #  type: string
  #  sql:  CASE
  #          WHEN ${TABLE}."dimension.ad_unit_name" LIKE '%brightcove%' THEN REGEXP_SUBSTR(${TABLE}."dimension.ad_unit_name", '^.+?»(.+?)\(.*')
  #        END ;;
  #}

  dimension: Ad_Unit_Name_Path_1 {
    type: string
    sql: SPLIT_PART(${dimension_ad_unit_name}, '?', 1) ;;
  }

  dimension: Ad_Unit_Name_Path_2 {
    type: string
    sql: SPLIT_PART(${dimension_ad_unit_name}, '?', 2) ;;
  }

  dimension: Ad_Unit_Name_Path_2_StringOnly {
    type: string
    primary_key: yes
    sql:  CASE
            WHEN ${TABLE}."dimension.ad_unit_name" LIKE '%brightcove%' THEN REGEXP_SUBSTR(SPLIT_PART(${dimension_ad_unit_name}, '?', 2),'[^()]*')
          ELSE
            NULL
          END;;
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

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: count {
    type: count
    drill_fields: [dimension_creative_name, dimension_ad_unit_name]
  }
}
