- view: responsy_active
  sql_table_name: responsys.responsy_active
  fields:

  - dimension: unsub_type
    type: string
    sql: ${TABLE}.unsub_type
    
  - dimension: unsubscribe_count
    type: string
    sql: ${TABLE}.unsub_count  
 
  - dimension: bounce_type
    type: string
    sql: ${TABLE}.bounce_type

  - dimension: click_count
    type: string
    sql: ${TABLE}.click_count

  - dimension: click_date
    type: string
    sql: ${TABLE}.click_date

  - dimension: concatid
    type: string
    sql: ${TABLE}.concatid

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

  - dimension: launch_date
    type: string
    sql: ${TABLE}.launch_date
    
  - dimension_group: launch_date
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.launch_date

  - dimension: launch_id
    type: string
    sql: ${TABLE}.launch_id

  - dimension: launch_name
    type: string
    sql: ${TABLE}.launch_name

  - dimension: open_count
    type: string
    sql: ${TABLE}.open_count

  - dimension: open_date
    type: string
    sql: ${TABLE}.open_date

  - dimension: riid
    type: string
    sql: ${TABLE}.riid

  - measure: count
    type: count
    drill_fields: [launch_name]
    
  - measure: Unique_Riid_Count
    type: count_distinct
    sql: ${TABLE}.riid
    
  - measure: sends
    type: count_distinct
    sql: ${TABLE}.riid
    