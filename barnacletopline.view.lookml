- view: barnacletopline
  sql_table_name: publications.barnacletopline
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: channelgrouping
    type: string
    sql: ${TABLE}.channelgrouping

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [date, week, month, month_num, day_of_month, day_of_week]
    convert_tz: false
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD')

  - dimension: market
    type: string
    sql: ${TABLE}.market

  - measure: users
    label: 'Unique Users'
    type: sum
    sql: ${TABLE}.users
    
  - measure: search_users
    label: 'Search Users'
    type: sum
    sql: ${TABLE}.users
    filters:
      channelgrouping: 'Organic Search'
    
  - measure: social_users
    label: 'Social Users'
    type: sum
    sql: ${TABLE}.users
    filters:
      channelgrouping: 'Social'

