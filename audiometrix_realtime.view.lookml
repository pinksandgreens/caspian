- view: audiometrix_realtime
  sql_table_name: publications.audiometrix_realtime
  fields:

  - measure: active_sessions
    type: sum
    sql: ${TABLE}.active_sessions

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

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



