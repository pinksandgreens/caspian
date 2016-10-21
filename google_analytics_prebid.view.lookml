- view: google_analytics_prebid
  sql_table_name: publications.google_analytics_prebid
  fields:

  - measure: avgeventvalue
    type: avg
    sql: ${TABLE}.avgeventvalue

  - dimension: bidder
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
    type: string
    sql: ${TABLE}.eventaction

  - dimension: eventcategory
    type: string
    sql: ${TABLE}.eventcategory

  - measure: eventvalue
    type: sum
    sql: POWER((${TABLE}.eventvalue)*10,-6)

  - dimension: market
    type: string
    sql: ${TABLE}.market

  - measure: totalevents
    type: sum
    sql: ${TABLE}.totalevents

