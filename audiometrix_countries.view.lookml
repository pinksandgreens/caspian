- view: audiometrix_countries
  sql_table_name: publications.audiometrix_countries
  fields:

  - measure: active_sessions
    type: sum
    sql: ${TABLE}.active_sessions

  - measure: avg_active_sessions
    type: avg
    sql: ${TABLE}.avg_active_sessions

  - dimension: avg_time_spent_listening
    type: string
    sql: ${TABLE}.avg_time_spent_listening

  - measure: bounce_rate
    type: avg
    sql: ${TABLE}.bounce_rate

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: country_name
    type: string
    sql: ${TABLE}.country_name

  - dimension: date
    type: string
    sql: ${TABLE}.date

  - measure: session_requests
    type: sum
    sql: ${TABLE}.session_requests

  - measure: total_listening_hours
    type: sum
    sql: ${TABLE}.total_listening_hours

