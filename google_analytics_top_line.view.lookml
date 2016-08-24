- view: google_analytics_top_line
  sql_table_name: publications.google_analytics_top_line
  fields:

  - measure: bounce_rate
    type: avg
    value_format: '#,##0.00"%"'
    sql: avg(${TABLE}.bouncerate)

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD')

  - dimension: device_category
    type: string
    sql: ${TABLE}.devicecategory

  - measure: page_views
    type: sum
    sql: (${TABLE}.pageviews)*(1.10)

  - measure: percent_newsessions
    type: number
    value_format: '#,##0.00"%"'
    sql: avg(${TABLE}.percentnewsessions)

  - dimension: platform
    type: string
    sql: ${TABLE}.platform

  - measure: session_duration
    type: sum
    hidden: TRUE
    sql: avg(${TABLE}.sessionduration)

  - measure: sessions
    type: sum
    sql: (${TABLE}.sessions)*(1.10)

  - measure: unique_pageviews
    type: sum
    sql: (${TABLE}.uniquepageviews)*(1.10)

  - measure: unique_users
    type: sum
    sql: (${TABLE}.users)*(1.10)
    
  - measure: average_session_duration
    type: number
    sql: (${session_duration}/${sessions})/60

