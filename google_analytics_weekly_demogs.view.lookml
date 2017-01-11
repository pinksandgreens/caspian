- view: google_analytics_weekly_demogs
  sql_table_name: publications.google_analytics_weekly_demogs
  fields:

  - dimension: interestinmarketcategory
    label: 'In-Market - All levels'
    type: string
    sql: ${TABLE}.interestinmarketcategory

  - dimension: useragebracket
    label: 'Age Banding'
    type: string
    sql: ${TABLE}.useragebracket

  - dimension: usergender
    label: 'Gender'
    type: string
    sql: INITCAP(${TABLE}.usergender)

  - dimension: operatingsystem
    type: string
    sql: ${TABLE}.operatingsystem

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [week,month]
    convert_tz: false
    sql: TO_DATE(${TABLE}.yearweek,'YYYYWW')

  - measure: bounce_rate
    type: avg
    value_format: '#,##0.00"%"'
    sql: ${TABLE}.bouncerate::float

  - dimension: brand
    type: string
    sql: ${TABLE}.brand
    
  - dimension: brand_code
    type: string
    sql: |
      CASE
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

    
  - dimension: market
    type: string
    sql: ${TABLE}.market

  - dimension: is_app #KEPT THIS NAME TO NOT BREAK ANYTHING, THIS IS ACTUALLY IS_WEB (YES/NO)
    label: 'Is Web Data'
    type: yesno
    sql: ${TABLE}.platform = 'Web'

  - measure: page_views
    type: sum
    sql: ${TABLE}.pageviews

  - dimension: platform
    type: string
    sql: ${TABLE}.platform
    
  - dimension: device
    label: 'Device Category'
    type: string
    sql: INITCAP(${TABLE}.deviceCategory)
    
  - dimension: channelGrouping
    label: 'Channel'
    type: string
    sql: ${TABLE}.channelGrouping

  - measure: session_duration
    type: sum
    hidden: TRUE
    sql: ${TABLE}.sessionduration

  - measure: sessions
    type: sum
    sql: ${TABLE}.sessions

  - measure: unique_pageviews
    type: sum
    sql: ${TABLE}.uniquepageviews
    
  - measure: unique_users
    hidden: FALSE
    label: 'Users'
    type: sum
    sql: ${TABLE}.users
    
  - measure: average_session_duration
    type: number
    sql: (${session_duration}/${sessions})/60
    
  - dimension: level_1
    label: 'In-Market - Level 1'
    type: string
    sql: split_part(${TABLE}.interestinmarketcategory,'/',1)

  - dimension: level_2
    label: 'In-Market - Level 2'
    type: string
    sql: split_part(${TABLE}.interestinmarketcategory,'/',2)

  - dimension: level_3
    label: 'In-Market - Level 3'
    type: string
    sql: split_part(${TABLE}.interestinmarketcategory,'/',3)
    
  - dimension: level_4
    label: 'In-Market - Level 4'
    type: string
    sql: split_part(${TABLE}.interestinmarketcategory,'/',4)
    
  - dimension: level_5
    label: 'In-Market - Level 5'
    type: string
    sql: split_part(${TABLE}.interestinmarketcategory,'/',5)
    



