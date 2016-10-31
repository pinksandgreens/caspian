- view: google_analytics_prebid
  sql_table_name: publications.google_analytics_prebid
  fields:

  - measure: avg_bid_cpm
    type: avg
    sql: ${TABLE}.avg_bid_cpm

  - measure: avg_bid_load_time
    label: 'Average Bid Load Time (ms)'
    type: avg
    sql: ${TABLE}.avg_bid_load_time

  - dimension: banded_avg_bid_load_time
    label: 'Banded Average Bid Load Time (ms)'
    type: tier
    tiers: [0-200,200-300,300-400,400-500,500-600,600-800,800-1000,1000-1200,1200-1500,1500-2000,2000-5000,5000-10000,10000-15000,15000-20000,20000-30000]
    style: classic                # the default value, could be excluded
    sql: ${TABLE}.avg_bid_load_time

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

#0-200ms  200-300ms   300-400ms   400-500ms   500-600ms   600-800ms   800-1000ms  t2:1000-1200ms  t2:1200-1500ms  t2:1500-2000ms  t2:2000ms above 

  - measure: avg_win_cpm
    type: avg
    sql: ${TABLE}.avg_win_cpm

  - dimension: bidder
    hidden: TRUE
    label: 'Prebid.js'
    type: string
    sql: ${TABLE}.bidder

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: datehour
    label: 'Recorded'
    type: time
    timeframes: [time, date, week, month, month_num]
    convert_tz: false
    sql: ${TABLE}.datehour::timestamp

  - dimension: eventaction
    label: 'Event'
    type: string
    sql: ${TABLE}.eventaction

  - dimension: eventlabel
    label: 'Bidder'
    type: string
    sql: ${TABLE}.eventlabel

  - dimension: market
    type: string
    sql: ${TABLE}.market

  - measure: number_of_bids
    type: sum
    sql: ${TABLE}.number_of_bids

  - measure: revenue
    type: sum
    value_format: '$0.00'
    sql: (1.00)*(${TABLE}.revenue::float)*10

  - measure: total_requests
    type: sum
    sql: ${TABLE}.total_requests

  - measure: total_timeouts
    type: sum
    sql: ${TABLE}.total_timeouts

  - measure: total_wins
    type: sum
    sql: ${TABLE}.total_wins
    
  - measure: timeout_rate
    type: number
    value_format: '#.##%'
    sql: (${total_timeouts}/${total_requests})
    
  - measure: win_rate
    type: number
    value_format: '#.##%'
    sql: (${total_wins}/${total_requests})

  - measure: Avg_Bid_CPM_Revenue
    type: sum
    value_format: '$0.00'
    sql: ((1.00)*(${TABLE}.avg_bid_cpm::float))/1000

  - measure: Avg_Win_CPM_Revenue
    type: sum
    value_format: '$0.00'
    sql: ((1.00)*(${TABLE}.avg_win_cpm::float))/1000




