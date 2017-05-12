view: jr_yt_onsite_offsite_revenue {

  label: "YouTube Onsite Revenue Calculation"

  derived_table: {
    sql_trigger_value: SELECT COUNT(*) FROM table ;;

    sql: SELECT
          playback_table.Date AS Date,
          playback_table.channel_id AS channel_id,
          playback_table.video_id AS video_id,
          playback_table.daily_yt_views AS daily_yt_views,
          playback_table.daily_external_views AS daily_external_views,
          playback_table.daily_total_views AS daily_total_views,
          playback_table.percent_daily_yt_views AS percent_daily_yt_views,
          playback_table.percent_daily_external_views AS percent_daily_external_views,
          IF(revenue_table.daily_estimated_partner_revenue IS NULL, 0, revenue_table.daily_estimated_partner_revenue) AS daily_estimated_partner_revenue,
          (IF(revenue_table.daily_estimated_partner_revenue IS NULL, 0, revenue_table.daily_estimated_partner_revenue)*playback_table.percent_daily_yt_views) AS daily_onsite_yt_revenue,
          IF(revenue_table.daily_estimated_partner_revenue IS NULL, 0, revenue_table.daily_estimated_partner_revenue)*(playback_table.percent_daily_external_views) AS daily_offsite_revenue,
          IF(revenue_table.daily_avg_estimated_cpm IS NULL, 0, revenue_table.daily_avg_estimated_cpm) AS daily_avg_estimated_cpm,
          (revenue_table.daily_avg_estimated_cpm*playback_table.percent_daily_yt_views) AS daily_onsite_avg_estimated_cpm,
          (revenue_table.daily_avg_estimated_cpm*playback_table.percent_daily_external_views) AS daily_offsite_avg_estimated_cpm
        FROM
        (SELECT
          A.date AS Date,
          A.channel_id AS channel_id,
          A.video_id As video_id,
          IF(A.daily_yt_onsite_views IS NULL, 0, A.daily_yt_onsite_views)  AS daily_yt_views,
          IF(B.daily_external_views IS NULL, 0, B.daily_external_views) AS daily_external_views,
          (IF(A.daily_yt_onsite_views IS NULL, 0, A.daily_yt_onsite_views) + IF(B.daily_external_views IS NULL, 0, B.daily_external_views)) AS daily_total_views,
          IF(A.daily_yt_onsite_views IS NULL, 0, ((A.daily_yt_onsite_views*1.00)/(IF(A.daily_yt_onsite_views IS NULL, 0, A.daily_yt_onsite_views*1.00) + IF(B.daily_external_views IS NULL, 0, B.daily_external_views)))) AS percent_daily_yt_views,
          IF(B.daily_external_views IS NULL, 0, ((B.daily_external_views*1.00)/(IF(A.daily_yt_onsite_views IS NULL, 0, A.daily_yt_onsite_views) + IF(B.daily_external_views IS NULL, 0 ,B.daily_external_views)))) AS percent_daily_external_views
          FROM
            (SELECT --Seperate out YT viewing Activity
              date,
              channel_id,
              video_id,
              IF(SUM((views + red_views)) IS NULL, 0, SUM((views + red_views))) AS daily_yt_onsite_views
            FROM
              Youtube.p_content_owner_playback_location_a2_Youtube
            WHERE TIMESTAMP(date) BETWEEN DATE_ADD(TIMESTAMP(CURRENT_DATE()),-62,"DAY") AND DATE_ADD(TIMESTAMP(CURRENT_DATE()),-3,"DAY") AND (playback_location_type = 0 OR playback_location_type = 2 OR playback_location_type = 5)
            GROUP BY date,channel_id,video_id) AS A
          LEFT OUTER JOIN
            (SELECT --Seperate out external Viewing Activity
              date,
              channel_id,
              video_id,
              IF(SUM((views + red_views)) IS NULL, 0, SUM((views + red_views))) AS daily_external_views
            FROM
              Youtube.p_content_owner_playback_location_a2_Youtube
            WHERE TIMESTAMP(date) BETWEEN DATE_ADD(TIMESTAMP(CURRENT_DATE()),-62,"DAY") AND DATE_ADD(TIMESTAMP(CURRENT_DATE()),-3,"DAY") AND playback_location_type = 1
            GROUP BY date,channel_id,video_id) AS B
          ON A.video_id = B.video_id AND A.date = B.date) AS playback_table
        LEFT JOIN
        (SELECT
           date,
           video_id,
           SUM(estimated_partner_revenue) AS daily_estimated_partner_revenue,
           AVG(estimated_cpm) AS daily_avg_estimated_cpm
          FROM
            Youtube.p_content_owner_estimated_revenue_a1_Youtube
          WHERE TIMESTAMP(date) BETWEEN DATE_ADD(TIMESTAMP(CURRENT_DATE()),-62,"DAY") AND DATE_ADD(TIMESTAMP(CURRENT_DATE()),-3,"DAY")
          GROUP BY date,video_id) AS revenue_table
        ON playback_table.video_id = revenue_table.video_id AND playback_table.Date = revenue_table.date
        ORDER BY Date ASC
;;
      }

  dimension_group: date {
    label: ""
    type: time
    sql: TIMESTAMP(${TABLE}.Date) ;;
  }

  dimension: channel_id {
    type: string
    sql: ${TABLE}.channel_id;;
  }

  dimension: brand {
    type: string
    sql: CASE
          WHEN ${TABLE}.channel_id = 'UCsaDOOjq5Y6yLrxgGJUqsEw' THEN 'Clyde 1'
          WHEN ${TABLE}.channel_id = 'UCJmOp0HWnwmxjTIsqksvMXA' THEN 'West FM'
          WHEN ${TABLE}.channel_id = 'UCwnMEHO_yyQzIyPHJm5suIA' THEN 'Aire'
          WHEN ${TABLE}.channel_id = 'UCq2B-pDb-6jUAHEV-h8m_3g' THEN 'Cool FM'
          WHEN ${TABLE}.channel_id = 'UCphyqKNSQIbR5ZMUN1J8Gxg' THEN 'Absolute Radio'
          WHEN ${TABLE}.channel_id = 'UC9gQ6iuq7ynk1wszK5R7Zwg' THEN 'Mother&Baby'
          WHEN ${TABLE}.channel_id = 'UCe27AY7BFke681LR73NSNSA' THEN 'Bike Magazine'
          WHEN ${TABLE}.channel_id = 'UC2xJqlJyVh0ASDwmOvMMYZA' THEN 'Car Magazine'
          WHEN ${TABLE}.channel_id = 'UCjHJvp64ixm7wwd1G3OlHPQ' THEN 'CFM Radio'
          WHEN ${TABLE}.channel_id = 'UCK_Ey4Yj197icxmslBI46nw' THEN 'Radio City Talk'
          WHEN ${TABLE}.channel_id = 'UCzPgsTOJpM5lXfvKdxczQDQ' THEN 'Closer'
          WHEN ${TABLE}.channel_id = 'UC7SYsaZNNprwAJ_zi02rf_A' THEN 'Empire Magazine'
          WHEN ${TABLE}.channel_id = 'UCz9-OtzaTxc-uTSZwA1MI1w' THEN 'FHM'
          WHEN ${TABLE}.channel_id = 'UCdUVQ1yuFigC5MsoRXuiZqQ' THEN 'Fleet News'
          WHEN ${TABLE}.channel_id = 'UC6VVsuDvNhzqVh8ysdzisQg' THEN 'Forth 1'
          WHEN ${TABLE}.channel_id = 'UCND41OGEHM7ZlQwbvxatDYA' THEN 'Wave 105 (GPW Archive)'
          WHEN ${TABLE}.channel_id = 'UCoN0D7sJJrjd7Rg436hrDAQ' THEN 'Gem 106'
          WHEN ${TABLE}.channel_id = 'UClh2Uaj8qUOSafi4rpCpLYg' THEN 'Go Fishing'
          WHEN ${TABLE}.channel_id = 'UC5NJ_leC14h-uzCYF2_2czg' THEN 'GoThinkBig'
          WHEN ${TABLE}.channel_id = 'UCSkWgJ-6ynzAyC8f5CSKlHw' THEN 'Grazia'
          WHEN ${TABLE}.channel_id = 'UCfUA3lzPECT7cjLLwXd9k0g' THEN 'hallamfm'
          WHEN ${TABLE}.channel_id = 'UCHWwD2vfT0yql0A5zcYUtqg' THEN 'Heat'
          WHEN ${TABLE}.channel_id = 'UClzGCR7nK-VxIV3vC05GL6w' THEN 'HighStreetHoney'
          WHEN ${TABLE}.channel_id = 'UCfWfdemygVrKmvlK50dvI1w' THEN 'KerrangPodcast'
          WHEN ${TABLE}.channel_id = 'UCIJmMzDdBcfOMNhRdG25dtg' THEN 'Kerrang! Radio'
          WHEN ${TABLE}.channel_id = 'UCkJSVi5NPCKT0l02UWyyu7g' THEN 'Key103'
          WHEN ${TABLE}.channel_id = 'UCWg7ZcouKaf4TQc_too6kGQ' THEN 'KISS FM'
          WHEN ${TABLE}.channel_id = 'UC4ZkTipGMK5aUE__0ogI1ow' THEN 'LRO'
          WHEN ${TABLE}.channel_id = 'UCzOKCkUEjveoFbRWexEZeSw' THEN 'Magic Radio'
          WHEN ${TABLE}.channel_id = 'UCwhHM5Nf2LuPKkJaa0fBsgw' THEN 'MATCH Magazine'
          WHEN ${TABLE}.channel_id = 'UCzINUBmgZp-GgGKK3stfiDQ' THEN 'metroradiouk'
          WHEN ${TABLE}.channel_id = 'UC1ycDbyYfJuTne7fP9pr_8Q' THEN 'MorayFirthRadio'
          WHEN ${TABLE}.channel_id = 'UCB_cdRhIDhlavY2I5URSC7g' THEN 'MCN'
          WHEN ${TABLE}.channel_id = 'UCAeuYqX16dx_Rj-4lROHw1A' THEN 'Northsound 1'
          WHEN ${TABLE}.channel_id = 'UCodlGhfgwcYHsxaYj-cyUNg' THEN 'Parkers'
          WHEN ${TABLE}.channel_id = 'UCaTrfvx4EHCy0LPcw1tuTug' THEN 'Planet Rock'
          WHEN ${TABLE}.channel_id = 'UCEYHoGxBS8-rwhccl6yf7Lg' THEN 'Practical Classics'
          WHEN ${TABLE}.channel_id = 'UC--fz-Y9Zn6cZ-XKcIBjeGw' THEN 'Practical Fishkeeping'
          WHEN ${TABLE}.channel_id = 'UCf6vfs-sihdcWjkGbVQ9EBQ' THEN 'Q4music'
          WHEN ${TABLE}.channel_id = 'UCt6A_WQf7ff4OvKFTIwjEEQ' THEN 'Radio City 96.7'
          WHEN ${TABLE}.channel_id = 'UCnWN3UHOQFnNld7j973GFuw' THEN 'RAILmagazineOnline'
          WHEN ${TABLE}.channel_id = 'UCA-WSoyBMVvq67zbHJhhB4w' THEN 'rockfm974'
          WHEN ${TABLE}.channel_id = 'UCsR0pEi7x5mqTCseagCbDAA' THEN 'tfmradio'
          WHEN ${TABLE}.channel_id = 'UCnHrK50EAIJCizTYwdR6Aiw' THEN 'The Debrief'
          WHEN ${TABLE}.channel_id = 'UCTQoFwsYcbeXoDad9qCIm7g' THEN 'The Hits Official'
          WHEN ${TABLE}.channel_id = 'UC_cG5BDdc3JPE5bVB_nRFVA' THEN "Today's Golfer"
          WHEN ${TABLE}.channel_id = 'UCt-LOc-hy5M6cv__qSJs4vA' THEN 'Trail Magazine'
          WHEN ${TABLE}.channel_id = 'UCcnwtc3sBCWyPXNJYoPbUpQ' THEN 'vikingfmvideos'
          WHEN ${TABLE}.channel_id = 'UCSUxt6XusHNslT99IbeMMNA' THEN 'Wave 105'
          WHEN ${TABLE}.channel_id = 'UCe01z0SeV3JVGgKwD31BGmA' THEN 'YourHorseOnline'
          WHEN ${TABLE}.channel_id = 'UCUm6Y1TgZdVfrkNTkOMTpfQ' THEN 'zootoday'
          WHEN ${TABLE}.channel_id = 'UCwWyFRy2l6aUFMsRemP51Sw' THEN 'Practical Photography Magazine'
          WHEN ${TABLE}.channel_id = 'UCr6y-jKLdgQPWrt-O5LrRHQ' THEN 'TV Choice'
        ELSE
          '3rd Party'
        END
;;
  }

  dimension: video_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.video_id;;
  }

  measure: daily_yt_views {
    label: "Onsite Views"
    type: sum
    sql: ${TABLE}.daily_yt_views ;;
  }

  measure: daily_external_views {
    label: "External Views"
    type: sum
    sql: ${TABLE}.daily_external_views ;;
  }

  measure: daily_total_views {
    label: "Onsite/Offsite Views"
    type: sum
    sql: ${TABLE}.daily_total_views ;;
  }

  #measure: percent_daily_yt_views {
  #  label: "% Onsite Views"
  #  type: average
  #  sql: ${daily_yt_views}/${daily_total_views}
  #  value_format_name: percent_2
  #}

  #measure: percent_daily_external_views {
  #  label: "% External Views"
  #  type: average
  #  sql: ${daily_external_views}/${daily_total_views} ;;
  #  value_format_name: percent_2
  #}

  measure: daily_estimated_partner_revenue {
    label: "Est. Revenue"
    type: sum
    sql: ${TABLE}.daily_estimated_partner_revenue * 0.77 ;;
    value_format_name: gbp
  }

  measure: daily_onsite_yt_revenue {
    label: "Est. Onsite Revenue"
    type: sum
    sql: ${TABLE}.daily_onsite_yt_revenue * 0.77 ;;
    value_format_name: gbp
  }

  measure: daily_offsite_revenue {
    label: "Est. Offsite Revenue"
    type: sum
    sql: ${TABLE}.daily_offsite_revenue * 0.77 ;;
    value_format_name: gbp
  }

  measure: daily_avg_estimated_cpm {
    label: "Est. CPM"
    type: average
    sql: ${TABLE}.daily_avg_estimated_cpm ;;
  }

  dimension: 30_day_buckets  {
    type: number
    label: "30 Days"
    description: "Bucket [1] = Past 30 Days, [2] = Past 31 - 60 Days"
    sql:  CASE
                WHEN DATEDIFF(DATE_ADD(CURRENT_TIMESTAMP(),-3,"DAY"),TIMESTAMP(${TABLE}.Date)) BETWEEN 0 AND 29 THEN 1
                WHEN DATEDIFF(DATE_ADD(CURRENT_TIMESTAMP(),-3,"DAY"),TIMESTAMP(${TABLE}.Date)) BETWEEN 30 AND 59 THEN 2
            END ;;
  }

  #measure: daily_onsite_avg_estimated_cpm {
  #  label: "Est. Onsite CPM"
  #  type: average
  #  sql: ${TABLE}.daily_onsite_avg_estimated_cpm ;;
  #}

  #measure: daily_offsite_avg_estimated_cpm {
  #  label: "Est. Offsite CPM"
  #  type: average
  #  sql: ${TABLE}.daily_offsite_avg_estimated_cpm ;;
  #}
}
