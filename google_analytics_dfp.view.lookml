- view: google_analytics_dfp
  sql_table_name: publications.google_analytics_dfp
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: channel_grouping
    type: string
    sql: ${TABLE}.channelgrouping

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD')

  - dimension: device_category
    type: string
    sql: ${TABLE}.devicecategory

  - measure: clicks
    type: sum
    sql: ${TABLE}.dfpclicks

  - measure: coverage
    type: avg
    value_format: '0.00"%"'
    sql: ((1.00)*(${TABLE}.dfpcoverage::float))

  - measure: ctr
    type: avg
    value_format: '0.00"%"'
    sql: (1.00)*(${TABLE}.dfpctr::float)

  - measure: ecpm
    type: avg
    value_format: '0.00'
    sql: (1.00)*(${TABLE}.dfpecpm::float)

  - measure: impressions
    type: sum
    sql: ${TABLE}.dfpimpressions

  - measure: impressions_per_session
    type: number
    value_format: '0.00'
    sql: AVG((1.00)*(${TABLE}.dfpimpressionspersession::float)
#    sql: AVG((1.00)*(${TABLE}.dfpimpressionspersession::float) WHERE (1.00)*(${TABLE}.dfpimpressionspersession::float)>0

  - measure: monetized_pageviews
    type: sum
    sql: ${TABLE}.dfpmonetizedpageviews

  - measure: revenue
    type: sum
    value_format: '$0.00'
    sql: (1.00)*(${TABLE}.dfprevenue::float)

  - measure: revenue_per_1000_sessions
    type: avg
    sql: ${TABLE}.dfprevenueper1000sessions

  - measure: viewable_impressions_percent
    type: avg
    sql: ${TABLE}.dfpviewableimpressions

  - dimension: market
    type: string
    sql: ${TABLE}.market

  - dimension: page_path
    type: string
    sql: ${TABLE}.pagepath

  - dimension: source
    type: string
    sql: ${TABLE}.source

