- view: barnaclepages
  sql_table_name: publications.barnaclepages
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: channelgrouping
    type: string
    sql: ${TABLE}.channelgrouping
    
  - dimension: pagetitle
    label: Page Title
    type: string
    sql: ${TABLE}.pagetitle

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [date, week, month, month_num]
    convert_tz: false
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD')

  - dimension: market
    type: string
    sql: ${TABLE}.market

  - measure: pageviews
    label: 'Page Views'
    type: sum
    sql: ${TABLE}.pageviews
    
  - measure: revenue
    type: sum
    value_format: '$0.00'
    sql: (1.00)*(${TABLE}.dfprevenue::float)

  - measure: search_pageviews
    label: 'Search Pageviews'
    type: sum
    sql: ${TABLE}.pageviews
    filters:
      channelgrouping: 'Organic Search'
    
  - measure: social_pageviews
    label: 'Social Pageviews'
    type: sum
    sql: ${TABLE}.pageviews
    filters:
      channelgrouping: 'Social'


