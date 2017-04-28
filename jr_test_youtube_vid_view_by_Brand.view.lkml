view: jr_test_youtube_vid_view_brand {

    derived_table: {
        sql:
        SELECT
          A.brand AS brand,
          A.views_V2 AS V2_views,
          A.estrevenue_V2 AS V2_revenue,
          B.views_V1 AS V1_views,
          B.estrevenue_V1 AS V1_revenue,
          CASE WHEN B.estrevenue_V1 != 0 THEN ((A.estrevenue_V2/B.estrevenue_V1)-1) ELSE 0 END AS percentage_growth_estrevenue,
          CASE WHEN B.views_V1 != 0 THEN ((A.views_V2/B.views_V1)-1) ELSE 0 END AS percentage_growth_views
        FROM
          (SELECT
            brand,
            SUM(views) AS views_V2,
            SUM(estimatedrevenue) AS estrevenue_V2
          FROM
            (SELECT
              CASE
              WHEN datediff(day, cast(day as DATE), (current_date - 3)) BETWEEN 0 AND 29 THEN 0
              ELSE 1
              END AS bucket,
              brand,
              views,
              CAST(estimatedrevenue AS REAL) as estimatedrevenue
            FROM
              publications.social_youtube_advanced
            WHERE cast(day AS DATE) BETWEEN (CURRENT_DATE - 62) AND (CURRENT_DATE-3)
            )
          WHERE bucket = 0
          GROUP BY brand
          ) AS A
        LEFT OUTER JOIN
          (SELECT
              brand,
              SUM(views) AS views_V1,
              SUM(estimatedrevenue) AS estrevenue_V1
            FROM
              (SELECT
                CASE
                  WHEN datediff(day, cast(day as DATE), (current_date - 3)) BETWEEN 0 AND 29 THEN 0
                ELSE 1
                END AS bucket,
                brand,
                views,
                CAST(estimatedrevenue AS REAL) as estimatedrevenue
              FROM
                publications.social_youtube_advanced
              WHERE cast(day AS DATE) BETWEEN (CURRENT_DATE - 62) AND (CURRENT_DATE-3)
              )
            WHERE bucket = 1
            GROUP BY brand
          ) AS B
        ON A.brand = B.brand

;;
    }

  dimension: brand {
    type: string
    label: "0. Brand"
    sql:
      CASE
        WHEN ${TABLE}.brand LIKE '%boxes?%' THEN 'Absolute Radio'
        ELSE ${TABLE}.brand
      END;;
  }


  measure: test_views_V2 {
    type: sum
    label: "1. Views: Last 30 Days"
    sql: ${TABLE}.V2_views ;;
  }

  measure: test_views_V1 {
    type: sum
    label: "3. Views: Between 30 to 60 Days"
    sql: ${TABLE}.V1_views ;;
  }

  measure: test_estrevenue_V2 {
    type: sum
    label: "2. Est. Rev: Last 30 Days"
    sql: ${TABLE}.V2_revenue ;;
    value_format_name: gbp
  }

  measure: test_estrevenue_V1 {
    type: sum
    label: "4. Est. Rev: Between last 30 to 60 Days"
    sql: ${TABLE}.V1_revenue ;;
    value_format_name: gbp

  }

  measure: percentage_growth_views {
    type: sum
    label: "5. Views: 30 Day Change"
    sql: ${TABLE}.percentage_growth_views ;;
    value_format_name: percent_2

  }

  measure: percentage_growth_estrevenue {
    type: sum
    label: "6. Rev: 30 Day Change"
    sql: ${TABLE}.percentage_growth_estrevenue ;;
    value_format_name: percent_2
  }

  ###############################################################################

  measure: total_views_v2 {
    type: sum
    label: "7. Total Views Past 30 days"
    sql: ${TABLE}.V2_views ;;

  }

  measure: total_views_v1 {
    type: sum
    label: "8. Total Views Past 30 - 60 days"
    sql: ${TABLE}.V1_views ;;

  }

  measure: total_rev_v2 {
    type: sum
    label: "9. Total Revenue Past 30 days"
    sql: ${TABLE}.V2_revenue ;;
    value_format_name: gbp
  }

  measure: total_rev_v1 {
    type: sum
    label: "9.1. Total Revenue Past 30 - 60 days"
    sql: ${TABLE}.V1_revenue ;;
    value_format_name: gbp
  }

  measure: total_views_perc_growth {
    type: number
    label: "9.2. Total Views % Growth"
    sql: (${total_views_v2}/NULLIF(${total_views_v1},0))-1 ;;
    value_format_name: percent_2
  }

  measure: total_revenue_perc_growth {
    type: number
    label: "9.3. Total Revenue % Growth"
    sql: (${total_rev_v2}/NULLIF(${total_rev_v1},0))-1 ;;
    value_format_name: percent_2
  }

  measure: eCPM {
    type: number
    label: "9.4. eCPM"
    sql: (${total_rev_v2}/NULLIF((${total_views_v2}/1000),0)) ;;
    value_format_name: gbp
  }

##################################################


  ###THIS IS FOR REFERENCE ONLY###
  dimension: brand_code {
    type: string
    sql: CASE
        WHEN ${TABLE}.brand = '2fore1.co.uk' THEN  '2F1'
        WHEN ${TABLE}.brand = 'ClassicCar.co.uk' THEN 'CLC'
        WHEN ${TABLE}.brand = 'absoluteradio.co.uk' THEN  'ABR'
        WHEN ${TABLE}.brand = 'bikemagazine.co.uk' THEN  'BIK'
        WHEN ${TABLE}.brand = 'birdwatching.co.uk' THEN  'BWT'
        WHEN ${TABLE}.brand = 'carmagazine.co.uk' THEN  'CAR'
        WHEN ${TABLE}.brand = 'cfmradio.com' THEN  'CFM'
        WHEN ${TABLE}.brand = 'citytalk.fm' THEN  'CTK'
        WHEN ${TABLE}.brand = 'classicbike.co.uk' THEN  'CLB'
        WHEN ${TABLE}.brand = 'classiccarsforsale.co.uk' THEN  'CCS'
        WHEN ${TABLE}.brand = 'closeronline.co.uk' THEN  'CLO'
        WHEN ${TABLE}.brand = 'clyde1.com' THEN  'CL1'
        WHEN ${TABLE}.brand = 'coolfm.co.uk' THEN  'COO'
        WHEN ${TABLE}.brand = 'downtown.co.uk' THEN  'DOW'
        WHEN ${TABLE}.brand = 'empireonline.com' THEN  'EMP'
        WHEN ${TABLE}.brand = 'forthone.com' THEN  'FO1'
        WHEN ${TABLE}.brand = 'freeradio.co.uk' THEN  'FRE'
        WHEN ${TABLE}.brand = 'gardenanswersmagazine.co.uk' THEN  'GAN'
        WHEN ${TABLE}.brand = 'gardennewsmagazine.co.uk' THEN  'GNW'
        WHEN ${TABLE}.brand = 'gem106.co.uk' THEN  'GEM'
        WHEN ${TABLE}.brand = 'gofishing.co.uk' THEN  'GOF'
        WHEN ${TABLE}.brand = 'graziadaily.co.uk' THEN  'GRA'
        WHEN ${TABLE}.brand = 'hallamfm.co.uk' THEN  'HAL'
        WHEN ${TABLE}.brand = 'heatworld.com' THEN  'HEA'
        WHEN ${TABLE}.brand = 'horsedeals.co.uk' THEN  'HDE'
        WHEN ${TABLE}.brand = 'kerrang.com' THEN  'KER'
        WHEN ${TABLE}.brand = 'kerrangradio.co.uk' THEN  'KRR'
        WHEN ${TABLE}.brand = 'key103.co.uk' THEN  'KEY'
        WHEN ${TABLE}.brand = 'kissfmuk.com' THEN  'KIS'
        WHEN ${TABLE}.brand = 'landscapemagazine.co.uk' THEN  'LSC'
        WHEN ${TABLE}.brand = 'livefortheoutdoors.com' THEN  'LFT'
        WHEN ${TABLE}.brand = 'lro.com' THEN  'LRO'
        WHEN ${TABLE}.brand = 'magic.co.uk' THEN  'MAG'
        WHEN ${TABLE}.brand = 'matchmag.co.uk' THEN  'MAT'
        WHEN ${TABLE}.brand = 'metroradio.co.uk' THEN  'MET'
        WHEN ${TABLE}.brand = 'model-rail.co.uk' THEN  'MDR'
        WHEN ${TABLE}.brand = 'mojo4music.com' THEN  'MOJ'
        WHEN ${TABLE}.brand = 'motherandbaby.co.uk' THEN  'MAB'
        WHEN ${TABLE}.brand = 'motorcyclenews.com' THEN  'MCN'
        WHEN ${TABLE}.brand = 'northsound1.com' THEN  'NO1'
        WHEN ${TABLE}.brand = 'northsound2.com' THEN  'NO2'
        WHEN ${TABLE}.brand = 'parkers.co.uk' THEN  'PCP'
        WHEN ${TABLE}.brand = 'performancebikes.co.uk' THEN  'PBK'
        WHEN ${TABLE}.brand = 'photoanswers.co.uk' THEN  'PAN'
        WHEN ${TABLE}.brand = 'planetrock.com' THEN  'PLR'
        WHEN ${TABLE}.brand = 'practicalclassics.co.uk' THEN  'PRC'
        WHEN ${TABLE}.brand = 'practicalsportsbikesmag.co.uk' THEN  'PRS'
        WHEN ${TABLE}.brand = 'qthemusic.com' THEN  'QQQ'
        WHEN ${TABLE}.brand = 'radioaire.co.uk' THEN  'AIR'
        WHEN ${TABLE}.brand = 'radioborders.com' THEN  'RBO'
        WHEN ${TABLE}.brand = 'radiocity.co.uk' THEN  'RCT'
        WHEN ${TABLE}.brand = 'railmagazine.com' THEN  'RAI'
        WHEN ${TABLE}.brand = 'ride.co.uk' THEN  'RDE'
        WHEN ${TABLE}.brand = 'rockfm.co.uk' THEN  'ROC'
        WHEN ${TABLE}.brand = 'steamrailway.co.uk' THEN  'SRA'
        WHEN ${TABLE}.brand = 'tayfm.co.uk' THEN  'TAF'
        WHEN ${TABLE}.brand = 'tfmradio.co.uk' THEN  'TFM'
        WHEN ${TABLE}.brand = 'thedebrief.co.uk' THEN  'DBF'
        WHEN ${TABLE}.brand = 'todaysgolfer.co.uk' THEN  'TDG'
        WHEN ${TABLE}.brand = 'topsante.co.uk' THEN  'TST'
        WHEN ${TABLE}.brand = 'trailrunningmag.co.uk' THEN  'TRR'
        WHEN ${TABLE}.brand = 'vikingfm.co.uk' THEN  'VIK'
        WHEN ${TABLE}.brand = 'wave105.com' THEN  'WVE'
        WHEN ${TABLE}.brand = 'westfm.co.uk' THEN  'WES'
        WHEN ${TABLE}.brand = 'westsoundradio.com' THEN  'WSF'
        WHEN ${TABLE}.brand = 'yourhorse.co.uk' THEN  'YHS'
        WHEN ${TABLE}.brand = 'yours.co.uk' THEN  'YRS'
        WHEN ${TABLE}.brand = 'fleetnewsnet.co.uk' THEN  'FLN'
        WHEN ${TABLE}.brand = 'aloud.com' THEN  'ALU'
        WHEN ${TABLE}.brand = 'yourhorselive.co.uk' THEN 'YHL'
        WHEN ${TABLE}.brand = 'am-online.com' THEN 'AMN'
        WHEN ${TABLE}.brand = 'Closer Weekly' THEN 'CWE'
        WHEN ${TABLE}.brand = 'In Touch Weekly' THEN 'ITW'
        WHEN ${TABLE}.brand = 'Womans World' THEN 'WOW'
        WHEN ${TABLE}.brand = 'Life and Style' THEN 'LAS'
        WHEN ${TABLE}.brand = 'J14' THEN 'JFT'
        WHEN ${TABLE}.brand = 'FHM' THEN 'FHM'
        ELSE ${TABLE}.brand
      END
       ;;
  }



}
