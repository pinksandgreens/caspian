- view: google_analytics_top_line
  sql_table_name: publications.google_analytics_top_line
  fields:

  - measure: bounce_rate
    type: avg
    value_format: '#,##0.00"%"'
    sql: ${TABLE}.bouncerate::float

  - dimension: brand
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.brand = 'am-online.com' THEN ''
        WHEN ${TABLE}.brand = 'mojo4music.com' THEN ''
        WHEN ${TABLE}.brand = 'qthemusic.com' THEN ''
        WHEN ${TABLE}.brand = 'aloud.com' THEN ''
        ELSE ${TABLE}.brand
      END
    
  - dimension: market
    type: string
    sql: ${TABLE}.market
    
  - dimension: country
    type: string
    sql: ${TABLE}.country
    sql: |
      CASE ${TABLE}.country
        WHEN 'United Kingdom' THEN 'UK'
        WHEN 'Non-UK' THEN 'Overseas'
      END

  - dimension: is_app
    label: 'Is App Data'
    type: yesno
    sql: ${TABLE}.platform = 'App'

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [date, week, month, month_num]
    convert_tz: false
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD')

  - measure: page_views
    type: sum
    sql: ${TABLE}.pageviews

  - measure: percent_newsessions
    label: '% New Sessions'
    type: number
    value_format: '#,##0.00"%"'
    sql: avg(${TABLE}.percentnewsessions::float)

  - dimension: platform
    type: string
    sql: ${TABLE}.platform

  - measure: session_duration
    type: sum
    hidden: TRUE
    sql: ${TABLE}.sessionduration

  - measure: sessions
    type: sum
    sql: ${TABLE}.sessions

  - measure: unique_pageviews
    type: sum
    sql: ${TABLE}.uniquepageviews
    
  - measure: unique_users
    label: 'Total Users'
    type: sum
    sql: ${TABLE}.users
    
  - measure: unique_users1
    label: 'Avg Unique Web Sessions p/day'
    type: avg
    sql: ${TABLE}.sessions
    filters:
      is_app: 'No'
      
  - measure: unique_users12
    label: 'Avg Unique App Sessions p/day'
    type: avg
    sql: ${TABLE}.sessions
    filters:
      is_app: 'Yes'
    
  - measure: average_session_duration
    type: number
    sql: (${session_duration}/${sessions})/60

