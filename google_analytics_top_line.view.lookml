- view: google_analytics_top_line
  sql_table_name: publications.google_analytics_top_line
  fields:

  - measure: bounce_rate
    type: avg
    value_format: '#,##0.00"%"'
    sql: ${TABLE}.bouncerate

  - dimension: brand
    type: string
    sql: ${TABLE}.brand
    
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
    
  - dimension: is_mobile_tablet
    label: 'Is Mobile/Tablet'
    type: yesno
    sql: (${TABLE}.devicecategory = 'mobile') OR (${TABLE}.devicecategory = 'tablet')

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
    sql: ${TABLE}.pageviews
    #sql: (${TABLE}.pageviews)*(1.10)

  - measure: percent_newsessions
    label: '% New Sessions'
    type: number
    value_format: '#,##0.00"%"'
    sql: avg(${TABLE}.percentnewsessions)

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
    #sql: (${TABLE}.sessions)*(1.10)

  - measure: unique_pageviews
    type: sum
    sql: ${TABLE}.uniquepageviews
    #sql: (${TABLE}.uniquepageviews)*(1.10)

  - measure: unique_users
    type: sum
    sql: ${TABLE}.users
    #sql: (${TABLE}.users)*(1.10)
    
  - measure: average_session_duration
    type: number
    sql: (${session_duration}/${sessions})/60

