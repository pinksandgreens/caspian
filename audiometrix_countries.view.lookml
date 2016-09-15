- view: audiometrix_countries
  sql_table_name: publications.audiometrix_countries
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - measure: active_sessions
    type: sum
    sql: ${TABLE}.active_sessions

  - measure: avg_active_sessions
    type: avg
    sql: ${TABLE}.avg_active_sessions

  - dimension: avg_time_spent_listening
    type: string
    sql: ${TABLE}.avg_time_spent_listening

  - dimension: UK_ROW
    label: 'UK/RoW'
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.country_name = 'United Kingdom' THEN 'UK'
        ELSE 'RoW'
      END

  - measure: bounce_rate
    type: avg
    value_format: '#"%"'
    sql: ${TABLE}.bounce_rate

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: country_name
    type: string
    sql: ${TABLE}.country_name

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD')

  - measure: session_requests
    type: sum
    sql: ${TABLE}.session_requests

  - measure: total_listening_hours
    type: sum
    sql: ${TABLE}.total_listening_hours

