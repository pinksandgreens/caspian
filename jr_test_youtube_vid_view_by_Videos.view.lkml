view: jr_test_youtube_vid_view_by_videos {
derived_table: {
  sql:
        SELECT
          A.title AS title,
          A.views_V2 AS V2_views,
          A.estrevenue_V2 AS V2_revenue,
          B.views_V1 AS V1_views,
          B.estrevenue_V1 AS V1_revenue,
          CASE WHEN B.estrevenue_V1 != 0 THEN ((A.estrevenue_V2/B.estrevenue_V1)-1) ELSE 0 END AS percentage_growth_estrevenue,
          CASE WHEN B.views_V1 != 0 THEN ((A.views_V2/B.views_V1)-1) ELSE 0 END AS percentage_growth_views
        FROM
          (SELECT
            title,
            SUM(views) AS views_V2,
            SUM(estimatedadrevenue) AS estrevenue_V2
          FROM
            (SELECT
              CASE
              WHEN datediff(day, cast(day as DATE), (current_date - 2)) BETWEEN 0 AND 29 THEN 0
              ELSE 1
              END AS bucket,
              title,
              views,
              CAST(estimatedadrevenue AS REAL) as estimatedadrevenue
            FROM
              publications.social_youtube_advanced
            WHERE cast(day AS DATE) BETWEEN (CURRENT_DATE - 61) AND (CURRENT_DATE-2)
            )
          WHERE bucket = 0
          GROUP BY title
          ) AS A
        LEFT OUTER JOIN
          (SELECT
              title,
              SUM(views) AS views_V1,
              SUM(estimatedadrevenue) AS estrevenue_V1
            FROM
              (SELECT
                CASE
                  WHEN datediff(day, cast(day as DATE), (current_date - 2)) BETWEEN 0 AND 29 THEN 0
                ELSE 1
                END AS bucket,
                title,
                views,
                CAST(estimatedadrevenue AS REAL) as estimatedadrevenue
              FROM
                publications.social_youtube_advanced
              WHERE cast(day AS DATE) BETWEEN (CURRENT_DATE - 61) AND (CURRENT_DATE-2)
              )
            WHERE bucket = 1
            GROUP BY title
          ) AS B
        ON A.title = B.title

;;
}

dimension: title {
  type: string
  label: "0. title"
  sql:
      CASE
        WHEN ${TABLE}.title LIKE '%boxes?%' THEN 'Absolute Radio'
        ELSE ${TABLE}.title
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



##################################################



###THIS IS FOR REFERENCE ONLY###
dimension: title_code {
  type: string
  sql: CASE
        WHEN ${TABLE}.title = '2fore1.co.uk' THEN  '2F1'
        WHEN ${TABLE}.title = 'ClassicCar.co.uk' THEN 'CLC'
        WHEN ${TABLE}.title = 'absoluteradio.co.uk' THEN  'ABR'
        WHEN ${TABLE}.title = 'bikemagazine.co.uk' THEN  'BIK'
        WHEN ${TABLE}.title = 'birdwatching.co.uk' THEN  'BWT'
        WHEN ${TABLE}.title = 'carmagazine.co.uk' THEN  'CAR'
        WHEN ${TABLE}.title = 'cfmradio.com' THEN  'CFM'
        WHEN ${TABLE}.title = 'citytalk.fm' THEN  'CTK'
        WHEN ${TABLE}.title = 'classicbike.co.uk' THEN  'CLB'
        WHEN ${TABLE}.title = 'classiccarsforsale.co.uk' THEN  'CCS'
        WHEN ${TABLE}.title = 'closeronline.co.uk' THEN  'CLO'
        WHEN ${TABLE}.title = 'clyde1.com' THEN  'CL1'
        WHEN ${TABLE}.title = 'coolfm.co.uk' THEN  'COO'
        WHEN ${TABLE}.title = 'downtown.co.uk' THEN  'DOW'
        WHEN ${TABLE}.title = 'empireonline.com' THEN  'EMP'
        WHEN ${TABLE}.title = 'forthone.com' THEN  'FO1'
        WHEN ${TABLE}.title = 'freeradio.co.uk' THEN  'FRE'
        WHEN ${TABLE}.title = 'gardenanswersmagazine.co.uk' THEN  'GAN'
        WHEN ${TABLE}.title = 'gardennewsmagazine.co.uk' THEN  'GNW'
        WHEN ${TABLE}.title = 'gem106.co.uk' THEN  'GEM'
        WHEN ${TABLE}.title = 'gofishing.co.uk' THEN  'GOF'
        WHEN ${TABLE}.title = 'graziadaily.co.uk' THEN  'GRA'
        WHEN ${TABLE}.title = 'hallamfm.co.uk' THEN  'HAL'
        WHEN ${TABLE}.title = 'heatworld.com' THEN  'HEA'
        WHEN ${TABLE}.title = 'horsedeals.co.uk' THEN  'HDE'
        WHEN ${TABLE}.title = 'kerrang.com' THEN  'KER'
        WHEN ${TABLE}.title = 'kerrangradio.co.uk' THEN  'KRR'
        WHEN ${TABLE}.title = 'key103.co.uk' THEN  'KEY'
        WHEN ${TABLE}.title = 'kissfmuk.com' THEN  'KIS'
        WHEN ${TABLE}.title = 'landscapemagazine.co.uk' THEN  'LSC'
        WHEN ${TABLE}.title = 'livefortheoutdoors.com' THEN  'LFT'
        WHEN ${TABLE}.title = 'lro.com' THEN  'LRO'
        WHEN ${TABLE}.title = 'magic.co.uk' THEN  'MAG'
        WHEN ${TABLE}.title = 'matchmag.co.uk' THEN  'MAT'
        WHEN ${TABLE}.title = 'metroradio.co.uk' THEN  'MET'
        WHEN ${TABLE}.title = 'model-rail.co.uk' THEN  'MDR'
        WHEN ${TABLE}.title = 'mojo4music.com' THEN  'MOJ'
        WHEN ${TABLE}.title = 'motherandbaby.co.uk' THEN  'MAB'
        WHEN ${TABLE}.title = 'motorcyclenews.com' THEN  'MCN'
        WHEN ${TABLE}.title = 'northsound1.com' THEN  'NO1'
        WHEN ${TABLE}.title = 'northsound2.com' THEN  'NO2'
        WHEN ${TABLE}.title = 'parkers.co.uk' THEN  'PCP'
        WHEN ${TABLE}.title = 'performancebikes.co.uk' THEN  'PBK'
        WHEN ${TABLE}.title = 'photoanswers.co.uk' THEN  'PAN'
        WHEN ${TABLE}.title = 'planetrock.com' THEN  'PLR'
        WHEN ${TABLE}.title = 'practicalclassics.co.uk' THEN  'PRC'
        WHEN ${TABLE}.title = 'practicalsportsbikesmag.co.uk' THEN  'PRS'
        WHEN ${TABLE}.title = 'qthemusic.com' THEN  'QQQ'
        WHEN ${TABLE}.title = 'radioaire.co.uk' THEN  'AIR'
        WHEN ${TABLE}.title = 'radioborders.com' THEN  'RBO'
        WHEN ${TABLE}.title = 'radiocity.co.uk' THEN  'RCT'
        WHEN ${TABLE}.title = 'railmagazine.com' THEN  'RAI'
        WHEN ${TABLE}.title = 'ride.co.uk' THEN  'RDE'
        WHEN ${TABLE}.title = 'rockfm.co.uk' THEN  'ROC'
        WHEN ${TABLE}.title = 'steamrailway.co.uk' THEN  'SRA'
        WHEN ${TABLE}.title = 'tayfm.co.uk' THEN  'TAF'
        WHEN ${TABLE}.title = 'tfmradio.co.uk' THEN  'TFM'
        WHEN ${TABLE}.title = 'thedebrief.co.uk' THEN  'DBF'
        WHEN ${TABLE}.title = 'todaysgolfer.co.uk' THEN  'TDG'
        WHEN ${TABLE}.title = 'topsante.co.uk' THEN  'TST'
        WHEN ${TABLE}.title = 'trailrunningmag.co.uk' THEN  'TRR'
        WHEN ${TABLE}.title = 'vikingfm.co.uk' THEN  'VIK'
        WHEN ${TABLE}.title = 'wave105.com' THEN  'WVE'
        WHEN ${TABLE}.title = 'westfm.co.uk' THEN  'WES'
        WHEN ${TABLE}.title = 'westsoundradio.com' THEN  'WSF'
        WHEN ${TABLE}.title = 'yourhorse.co.uk' THEN  'YHS'
        WHEN ${TABLE}.title = 'yours.co.uk' THEN  'YRS'
        WHEN ${TABLE}.title = 'fleetnewsnet.co.uk' THEN  'FLN'
        WHEN ${TABLE}.title = 'aloud.com' THEN  'ALU'
        WHEN ${TABLE}.title = 'yourhorselive.co.uk' THEN 'YHL'
        WHEN ${TABLE}.title = 'am-online.com' THEN 'AMN'
        WHEN ${TABLE}.title = 'Closer Weekly' THEN 'CWE'
        WHEN ${TABLE}.title = 'In Touch Weekly' THEN 'ITW'
        WHEN ${TABLE}.title = 'Womans World' THEN 'WOW'
        WHEN ${TABLE}.title = 'Life and Style' THEN 'LAS'
        WHEN ${TABLE}.title = 'J14' THEN 'JFT'
        WHEN ${TABLE}.title = 'FHM' THEN 'FHM'
        ELSE ${TABLE}.title
      END
       ;;
}



}
