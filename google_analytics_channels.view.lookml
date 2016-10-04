- view: google_analytics_channels
  sql_table_name: publications.google_analytics_channels
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: channelgrouping
    label: 'Channel'
    type: string
    sql: ${TABLE}.channelgrouping

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [date, week, month, month_num]
    convert_tz: false
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD')

  - dimension: landingpagepath
    label: 'Landing Page'
    type: string
    sql: ${TABLE}.landingpagepath

  - dimension: market
    type: string
    sql: ${TABLE}.market

  - measure: sessions
    type: sum
    sql: ${TABLE}.sessions

