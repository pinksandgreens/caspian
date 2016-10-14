- view: google_analytics_top_line
  sql_table_name: publications.google_analytics_top_line
  fields:

  - measure: bounce_rate
    type: avg
    value_format: '#,##0.00"%"'
    sql: ${TABLE}.bouncerate::float

  - dimension: brand
    type: string
    sql: ${TABLE}.brand
    
  - dimension: market
    type: string
    sql: ${TABLE}.market
    
  - dimension: country
    label: 'UK/Overseas'
    type: string
    sql: |
      CASE ${TABLE}.country
        WHEN 'United Kingdom' THEN 'UK'
        ELSE 'Overseas'
      END
      
  - dimension: country_name
    label: 'Country'
    type: string
    sql: ${TABLE}.country

  - dimension: is_app #KEPT THIS NAME TO NOT BREAK ANYTHING, THIS IS ACTUALLY IS_WEB (YES/NO)
    label: 'Is Web Data'
    type: yesno
    sql: ${TABLE}.platform = 'Web'

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [date, week, month, month_num]
    convert_tz: false
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD')

  - measure: page_views
    type: sum
    sql: ${TABLE}.pageviews

  - dimension: platform
    type: string
    sql: ${TABLE}.platform
    
  - dimension: device
    label: 'Device Category'
    type: string
    sql: ${TABLE}.deviceCategory
    
  - dimension: channelGrouping
    label: 'Channel'
    type: string
    sql: ${TABLE}.channelGrouping


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
      is_app: 'Yes'
      
  - measure: unique_users12
    label: 'Avg Unique App Sessions p/day'
    type: avg
    sql: ${TABLE}.sessions
    filters:
      is_app: 'No'
    
  - measure: average_session_duration
    type: number
    sql: (${session_duration}/${sessions})/60
    
    

