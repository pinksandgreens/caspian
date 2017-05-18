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
    value_format_name: gbp
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

  dimension: Ad_Unit_Sub_Category_Name {
    type: string
    sql: CASE
          WHEN ${TABLE}."dimension.ad_unit_name" LIKE '%brightcove%' THEN REGEXP_SUBSTR(SPLIT_PART(REPLACE(REPLACE(${TABLE}."dimension.ad_unit_name", '»','?'),' ',''), '?', 2),'[^()]*')
          WHEN ${TABLE}."dimension.ad_unit_name" LIKE '%editorial-player%' THEN REGEXP_SUBSTR(SPLIT_PART(REPLACE(REPLACE(${TABLE}."dimension.ad_unit_name", '»','?'),' ',''), '?', 2),'[^()]*')
        ELSE
          'Not Brightcove Platform Related Ad Revenue'
        END ;;
  }


  #Several Radio Stations are sharing the BCN Ad Tag yet BCN itself does not have a tag yet. Keep an eye on this.
  #No player for CCFS Yet.
  dimension: key {
    type: string
    label: "Key"
    hidden: yes
    primary_key: yes
    sql:  CASE
            WHEN ${Ad_Unit_Sub_Category_Name} = 'RBCN_video' THEN 'BCN'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SSPT_Angling-Times' THEN 'Angling Times'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SMOD_Car' THEN 'CAR Magazine'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SAUT_Classic-Cars-for-Sale' THEN 'CCFS'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'LWLN_Closer' THEN 'Closer'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'LMENS_Empire' THEN 'Empire Magazine'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'LWLN_Grazia' THEN 'Grazia'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'RNAT_heat' THEN 'Heat Radio'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'LWLN_Heatworld' THEN 'Heat'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SPET_Horse-Deals' THEN 'Horse Deals'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'RNAT_kerrang' THEN 'Kerrang! Radio'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'LMENS_Kerrang' THEN 'Kerrang'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'RNAT_kiss' THEN 'KISS FM'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SAUT_LRO' THEN 'LRO'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'RNAT_magic' THEN 'Magic Radio'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SMOT_MCN' THEN 'MCN'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'LMENS_Mojo' THEN 'Mojo'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SWSP_Mother-and-Baby' THEN 'Mother&Baby'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SMOD_Mustard' THEN 'Mustard'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SMOD_Parkers' THEN 'Parkers'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'RNAT_planet-rock' THEN 'Planet Rock'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SLEI_Practical-Photography' THEN 'Practical Photography Magazine'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'LMENS_Q' THEN 'Q4music'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'LWLN_The-Debrief' THEN 'The Debrief'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SSPT_Todays-Golfer' THEN 'Today''s Golfer'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SPET_Your-Horse' THEN 'YourHorse Online'||${date}
            WHEN ${Ad_Unit_Sub_Category_Name} = 'SWSP_Yours' THEN 'Yours'||${date}
          ELSE
            'No Ad Tag Exists'
          END;;
  }

  #UPDATE Key to generate Brand from Ad_Unit_Name_Path_2. Then create Key based on Brand + Day
  #dimension: old_key {
  #  type: string
  #  label: "Key"
  #  primary_key: yes
  #  sql:  CASE
  #          WHEN ${TABLE}."dimension.ad_unit_name" LIKE '%brightcove%' THEN REGEXP_SUBSTR(${Ad_Unit_Name_Path_2},'[^()]*')||${date}
  #          WHEN ${TABLE}."dimension.ad_unit_name" LIKE '%editorial-player%' THEN REGEXP_SUBSTR(${Ad_Unit_Name_Path_2},'[^()]*')||${date}
  #        --ELSE
  #          --NULL
  #        END;;
  #}




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

dimension: date {
  type: date
  sql: ${TABLE}."dimension.date" ;;
}

#dimension_group: date {
#    type: time
#    label: ""
#    timeframes: []
#    convert_tz: no
#    sql: TO_DATE(${TABLE}."dimension.date",'YYYY-MM-DD') ;;
#  }

  dimension: rownum {
    hidden: yes
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: count {
    type: count
    drill_fields: [dimension_creative_name, dimension_ad_unit_name]
  }

  dimension: 30_day_buckets  {
    type: number
    label: "30 Days"
    description: "Bucket [1] = Past 30 Days, [2] = Past 31 - 60 Days"
    sql:  CASE
                WHEN DATEDIFF(day,CAST("dimension.date" AS DATE),(CURRENT_DATE-4)) BETWEEN 0 AND 29 THEN 1
                WHEN DATEDIFF(day,CAST("dimension.date" AS DATE),(CURRENT_DATE-4)) BETWEEN 30 AND 59 THEN 2
            END ;;
  }

}
