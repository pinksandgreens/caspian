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
    sql: (${total_timeouts}/${total_requests})*100
    
    
  - measure: Avg_Bid_CPM_Revenue
    type: sum
    value_format: '$0.00'
    sql: ((1.00)*(${TABLE}.avg_bid_cpm::float))/1000

  - measure: Avg_Win_CPM_Revenue
    type: sum
    value_format: '$0.00'
    sql: ((1.00)*(${TABLE}.avg_win_cpm::float))/1000




