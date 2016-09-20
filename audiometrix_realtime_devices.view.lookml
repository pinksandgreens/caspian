- view: audiometrix_realtime_devices
  sql_table_name: publications.audiometrix_realtime_devices
  fields:

  - measure: active_sessions
    type: sum
    sql: ${TABLE}.active_sessions
    
  - measure: total_sessions_today
    type: sum
    sql: ${TABLE}.total_sessions_today

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: device_category
    type: string
    sql: ${TABLE}.device
    

  - dimension: date
    label: 'Recorded'
    type: time
    timeframes: [time, date, week, month]
    convert_tz: true
    sql: CONVERT_TIMEZONE('UTC','BST',${TABLE}.date::timestamp) # BST/GMT depending on date
