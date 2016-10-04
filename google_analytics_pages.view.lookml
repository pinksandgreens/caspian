- view: google_analytics_pages
  sql_table_name: publications.google_analytics_pages
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [date, week, month, month_num]
    convert_tz: false
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD')

  - dimension: market
    type: string
    sql: ${TABLE}.market

  - dimension: pagepath
    label: 'Page path'
    type: string
    sql: ${TABLE}.pagepath

  - measure: pageviews
    label: 'Page Views'
    type: sum
    sql: ${TABLE}.pageviews

