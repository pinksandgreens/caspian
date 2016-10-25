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
    sql: (1.00)*(${TABLE}.revenue::float)

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




