view: dfp_reach {
  sql_table_name: ad_platform.dfp_reach;;

  measure: column_impressions_per_user {
    label: "Avg Impressions Per User"
    type: average
    value_format: "0.00"
    sql: CASE
          WHEN ${TABLE}."column.reach_frequency" = '-' THEN NULL
          ELSE ${TABLE}."column.reach_frequency"::float
         END;;
    }

  measure: column_reach {
    label: "Unique Users"
    type: sum
    sql: CASE
          WHEN ${TABLE}."column.reach" = '-' THEN NULL
          ELSE ${TABLE}."column.reach"
         END;;
  }

  measure: column_revenue_per_user {
    label: "Avg Revenue per User"
    type: average
    value_format: "\£0.0000"
    sql: CASE
          WHEN ${TABLE}."column.reach_average_revenue"  = '-' THEN NULL
          ELSE ${TABLE}."column.reach_average_revenue"::float/1000000
         END;;
  }

  measure: column_total_line_item_level_all_revenue {
    label: "Total Line Item Revenue"
    type: sum
    #value_format: "\£0.0000"
    value_format_name: gbp
    sql: ${TABLE}."column.total_line_item_level_all_revenue"::decimal/1000000 ;;
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

  dimension: dimension_placement_name {
    label: "Placement Name"
    type: string
    sql: ${TABLE}."dimension.placement_name";;
  }

  dimension: dimension_placement_id {
    type: string
    sql: ${TABLE}."dimension.placement_id" ;;
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

  # dimension: key {
  #   type: string
  #   label: "Key"
  #   hidden: yes
  #   primary_key: yes
  #   sql:  CASE
  #           WHEN ${TABLE}."dimension.ad_unit_name" LIKE '%brightcove%' THEN REGEXP_SUBSTR(${Ad_Unit_Name_Path_2},'[^()]*')||${date}
  #           WHEN ${TABLE}."dimension.ad_unit_name" LIKE '%editorial-player%' THEN REGEXP_SUBSTR(${Ad_Unit_Name_Path_2},'[^()]*')||${date}
  #         --ELSE
  #           --NULL
  #         END;;
  # }




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

  # dimension: dimension_creative_id {
  #   type: string
  #   sql: ${TABLE}."dimension.creative_id" ;;
  # }

  # dimension: dimension_creative_name {
  #   type: string
  #   sql: ${TABLE}."dimension.creative_name" ;;
  # }

  # dimension: dimension_creative_size {
  #   type: string
  #   sql: ${TABLE}."dimension.creative_size" ;;
  # }

  # dimension: date {
  #   type: date
  #   sql: ${TABLE}."dimension.date" ;;
  # }

#dimension_group: date {
    # type: time
    # label: ""
    # timeframes: []
    # convert_tz: no
#    sql: TO_DATE(${TABLE}."dimension.date",'YYYY-MM-DD') ;;
#  }


  dimension_group: date {
    type: time
    label: ""
    timeframes: [week]
    convert_tz: no
    sql: TO_DATE(${TABLE}."dimension.day",'YYYY-MM-DD') ;;
  }

  # dimension: rownum {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.rownum ;;
  # }

  measure: count {
    type: count
    drill_fields: [dimension_ad_unit_name]
  }

  dimension: 30_day_buckets  {
    type: number
    label: "30 Days"
    description: "Bucket [1] = Past 30 Days, [2] = Past 31 - 60 Days"
    sql:  CASE
                WHEN DATEDIFF(day,CAST("dimension.date" AS DATE),(CURRENT_DATE-3)) BETWEEN 0 AND 29 THEN 1
                WHEN DATEDIFF(day,CAST("dimension.date" AS DATE),(CURRENT_DATE-3)) BETWEEN 30 AND 59 THEN 2
            END ;;
  }

}
