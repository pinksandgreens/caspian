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

  dimension: Brand_Name {
    hidden: no
    label: "Brand Name"
    type: string
    sql: CASE
            WHEN ${TABLE}.ad_unit_name LIKE '%Angling Times%' THEN 'Angling Times'
            WHEN ${TABLE}.ad_unit_name LIKE '%Bike%' THEN 'Bike'
            WHEN ${TABLE}.ad_unit_name LIKE '%Car%' THEN 'Car'
            WHEN ${TABLE}.ad_unit_name LIKE '%CAR%' THEN 'Car'
            WHEN ${TABLE}.ad_unit_name LIKE '%Car Mechanic%' THEN 'Car Mechanic'
            WHEN ${TABLE}.ad_unit_name LIKE '%Carpfeed%' THEN 'Carpfeed'
            WHEN ${TABLE}.ad_unit_name LIKE '%CCFS%' THEN 'CCFS'
            WHEN ${TABLE}.ad_unit_name LIKE '%Classic Bike%' THEN 'Classic Bike'
            WHEN ${TABLE}.ad_unit_name LIKE '%Classic Cars%' THEN 'Classic Cars'
            WHEN ${TABLE}.ad_unit_name LIKE '%Closer%' THEN 'Closer'
            WHEN ${TABLE}.ad_unit_name LIKE '%Empire%' THEN 'Empire'
            WHEN ${TABLE}.ad_unit_name LIKE '%Food to Love%' THEN 'Food to Love'
            WHEN ${TABLE}.ad_unit_name LIKE '%Garden News%' THEN 'Garden News'
            WHEN ${TABLE}.ad_unit_name LIKE '%Go Fishing%' THEN 'Go Fishing'
            WHEN ${TABLE}.ad_unit_name LIKE '%Grazia%' THEN 'Grazia'
            WHEN ${TABLE}.ad_unit_name LIKE '%Heatworld%' THEN 'Heatworld'
            WHEN ${TABLE}.ad_unit_name LIKE '%Horse Deals%' THEN 'Horse Deals'
            WHEN ${TABLE}.ad_unit_name LIKE '%Kerrang%' THEN 'Kerrang'
            WHEN ${TABLE}.ad_unit_name LIKE '%Landscape%' THEN 'Landscape'
            WHEN ${TABLE}.ad_unit_name LIKE '%LFTO%' THEN 'LFTO'
            WHEN ${TABLE}.ad_unit_name LIKE '%LRO%' THEN 'LRO'
            WHEN ${TABLE}.ad_unit_name LIKE '%MCN%' THEN 'MCN'
            WHEN ${TABLE}.ad_unit_name LIKE '%MCN Sport%' THEN 'MCN Sport'
            WHEN ${TABLE}.ad_unit_name LIKE '%Model Rail%' THEN 'Model Rail'
            WHEN ${TABLE}.ad_unit_name LIKE '%Modern Classics%' THEN 'Modern Classics'
            WHEN ${TABLE}.ad_unit_name LIKE '%Mojo%' THEN 'Mojo'
            WHEN ${TABLE}.ad_unit_name LIKE '%Mother and Baby%' THEN 'Mother and Baby'
            WHEN ${TABLE}.ad_unit_name LIKE '%Parkers%' THEN 'Parkers'
            WHEN ${TABLE}.ad_unit_name LIKE '%Performance Bikes%' THEN 'Performance Bikes'
            WHEN ${TABLE}.ad_unit_name LIKE '%PFK%' THEN 'PFK'
            WHEN ${TABLE}.ad_unit_name LIKE '%Photo Answers%' THEN 'Photo Answers'
            WHEN ${TABLE}.ad_unit_name LIKE '%Practical Classics%' THEN 'Practical Classics'
            WHEN ${TABLE}.ad_unit_name LIKE '%Practical Photography%' THEN 'Practical Photography'
            WHEN ${TABLE}.ad_unit_name LIKE '%Practical Sportsbikes%' THEN 'Practical Sportsbikes'
            WHEN ${TABLE}.ad_unit_name LIKE '%Ride%' THEN 'Ride'
            WHEN ${TABLE}.ad_unit_name LIKE '%Sea Angler%' THEN 'Sea Angler'
            WHEN ${TABLE}.ad_unit_name LIKE '%Skill Shack%' THEN 'Skill Shack'
            WHEN ${TABLE}.ad_unit_name LIKE '%Steam Railway%' THEN 'Steam Railway'
            WHEN ${TABLE}.ad_unit_name LIKE '%TG%' THEN 'TG'
            WHEN ${TABLE}.ad_unit_name LIKE '%Today''s Golfer%' THEN 'Today''s Golfer'
            WHEN ${TABLE}.ad_unit_name LIKE '%Top Sante%' THEN 'Top Sante'
            WHEN ${TABLE}.ad_unit_name LIKE '%Trail Running%' THEN 'Trail Running'
            WHEN ${TABLE}.ad_unit_name LIKE '%Trout and Salmon%' THEN 'Trout and Salmon'
            WHEN ${TABLE}.ad_unit_name LIKE '%WSUK%' THEN 'WSUK'
            WHEN ${TABLE}.ad_unit_name LIKE '%Your Horse%' THEN 'Your Horse'
            WHEN ${TABLE}.ad_unit_name LIKE '%Yours%' THEN 'Yours'
            WHEN ${TABLE}.ad_unit_name LIKE '%Trout Fisherman%' THEN 'Trout Fisherman'
            WHEN ${TABLE}.ad_unit_name LIKE '%Matched Content Unit%' THEN 'Unknown'
            ELSE ${TABLE}.ad_unit_name
          END;;
          }

  dimension: marketplace {
    type: string
    sql: CASE
          WHEN ${TABLE}.ad_unit_name LIKE 'There is no OMP/PMP classifier in Adsense' THEN NULL
          ELSE 'OMP'
          END;;
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
