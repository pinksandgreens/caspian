- view: audiometrix_devices
  sql_table_name: publications.audiometrix_devices
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

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD')

  - dimension: device
    type: string
    sql: ${TABLE}.device

  - measure: session_requests
    type: sum
    sql: ${TABLE}.session_requests

  - measure: total_listening_hours
    type: sum
    sql: ${TABLE}.total_listening_hours

