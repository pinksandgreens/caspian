view: google_analytics_top_line {
  sql_table_name: publications.google_analytics_top_line ;;

  measure: bounce_rate {
    type: average
    value_format: "#,##0.00\"%\""
    sql: ${TABLE}.bouncerate::float ;;
  }

  dimension: brand {
    label: "Data Source"
    type: string
    sql: SPLIT_PART(${TABLE}.brand, '|', 1) ;;
  }

  dimension: brand_name {
    type: string
    sql: SPLIT_PART(${TABLE}.brand, '|', 2) ;;
  }

  dimension: brand123 {
    hidden: yes
    label: "Brand Name and Source"
    type: string
    sql: ${TABLE}.brand ;;
  }


  dimension: brand_code {
    type: string
    hidden: yes
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
        ELSE ${TABLE}.brand
      END
       ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: country {
    label: "UK/Overseas"
    type: string
    sql: CASE ${TABLE}.country
        WHEN 'United Kingdom' THEN 'UK'
        ELSE 'Overseas'
      END
       ;;
  }

  dimension: country_name {
    label: "Country"
    type: string
    sql: ${TABLE}.country ;;
  }

  #KEPT THIS NAME TO NOT BREAK ANYTHING, THIS IS ACTUALLY IS_WEB (YES/NO)
  dimension: is_app {
    label: "Is Web Data"
    hidden: yes
    type: yesno
    sql: ${TABLE}.platform = 'Web' ;;
  }

  dimension: date_str {
    label: "Recorded"
    hidden: yes
    type: string
    sql: SPLIT_PART(${TABLE}.date,' ',1) ;;
  }

  dimension_group: date {
    label: "Recorded"
    type: time
    timeframes: [date, week, month, month_num, year]
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }

  measure: page_views {
    type: sum
    sql: ${TABLE}.pageviews ;;
  }

  measure: uk_page_views {
    type: sum
    sql: ${TABLE}.pageviews ;;
    filters: {
      field: country_name
      value: "United Kingdom"
    }
  }

  measure: mobile_page_views {
    type: sum
    sql: ${TABLE}.pageviews ;;
    filters: {
      field: device
      value: "Mobile"
    }
  }

  measure: desktop_page_views {
    type: sum
    sql: ${TABLE}.pageviews ;;
    filters: {
      field: device
      value: "Desktop"
    }
  }

  measure: tablet_page_views {
    type: sum
    sql: ${TABLE}.pageviews ;;
    filters: {
      field: device
      value: "Tablet"
    }
  }


  dimension: platform {
    label: "Digital Platform"
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: device {
    label: "Device Category"
    type: string
    sql: INITCAP(${TABLE}.deviceCategory) ;;
  }

  dimension: channelGrouping {
    label: "Channel"
    type: string
    sql: ${TABLE}.channelGrouping ;;
  }

  measure: session_duration {
    type: sum
    hidden: yes
    sql: ${TABLE}.sessionduration ;;
  }

  measure: sessions {
    type: sum
    sql: ${TABLE}.sessions ;;
  }


  measure: unique_users {
    hidden: no
    description: "Only unique per day. NOT by month or week."
    label: "Users"
    type: sum
    sql: ${TABLE}.users ;;
  }

  measure: unique_users1 {
    hidden: yes
    label: "Avg Unique Web Sessions p/day"
    type: average
    sql: ${TABLE}.sessions ;;

    filters: {
      field: is_app
      value: "Yes"
    }
  }

  measure: unique_users12 {
    hidden: yes
    label: "Avg Unique App Sessions p/day"
    type: average
    sql: ${TABLE}.sessions ;;

    filters: {
      field: is_app
      value: "No"
    }
  }

  measure: average_session_duration {
    description: "Average session duration in minutes"
    type: number
    sql: (NULLIF(${session_duration},0)/NULLIF(${sessions},0))/60 ;;
  }

  measure: count {
    type: count
  }
}
