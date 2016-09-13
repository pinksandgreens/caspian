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
    type: string
    sql: ${TABLE}.date

  - dimension: device_category
    type: string
    sql: ${TABLE}.devicecategory

  - measure: clicks
    type: sum
    sql: ${TABLE}.dfpclicks

  - measure: coverage
    type: avg
    sql: ${TABLE}.dfpcoverage

  - measure: ctr
    type: avg
    sql: ${TABLE}.dfpctr

  - measure: ecpm
    type: avg
    sql: ${TABLE}.dfpecpm

  - measure: impressions
    type: sum
    sql: ${TABLE}.dfpimpressions

  - measure: impressions_per_session
    type: avg
    sql: ${TABLE}.dfpimpressionspersession

  - measure: monetized_pageviews
    type: sum
    sql: ${TABLE}.dfpmonetizedpageviews

  - measure: revenue
    type: sum
    sql: ${TABLE}.dfprevenue

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

  - measure: count
    type: count
    drill_fields: []

