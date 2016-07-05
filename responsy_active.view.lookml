- view: responsy_active
  label: '2a. Email Data'
  sql_table_name: responsys.responsy_active
  fields:

#### EMAIL EVENTS

#   - dimension: open_count
#     type: string
#     sql: ${TABLE}.open_count 
# 
#   - dimension: click_count
#     type: string
#     sql: ${TABLE}.click_count

  - dimension: bounce_type
    type: string
    sql: ${TABLE}.bounce_type

  - dimension: unsub_type
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.unsub_type = 'LEGA' THEN 'BRAN'
        ELSE ${TABLE}.unsub_type
      END
    
#   - dimension: unsubscribe_count
#     type: string
#     sql: ${TABLE}.unsub_count  
    
###### DATE FIELDS

  - dimension_group: launch_date
    label: 'Sent'
    type: time
    timeframes: [date, week, month]
    sql: |
     TO_DATE (${TABLE}.launch_date, 'YYYY-MM-DD')

  - dimension: open_date
    label: 'Open'
    type: time
    timeframes: [date, week, month]
    sql: |
     TO_DATE (${TABLE}.open_date, 'YYYY-MM-DD')

  - dimension: click_date
    label: 'Click'
    type: time
    timeframes: [date, week, month]
    sql: |
     TO_DATE (${TABLE}.click_date, 'YYYY-MM-DD')

  - dimension: click_date_not_null
    label: 'Unique Clicks'
    type: string
    sql: |
     CASE
      WHEN ${TABLE}.click_date = ' ' THEN '0'
      ELSE '1'
     END

  - dimension: launch_id
    type: string
    label: 'Launch ID'
    sql: ${TABLE}.launch_id

  - dimension: launch_name
    label: 'Campaign Name'
    type: string
    sql: ${TABLE}.launch_name
    
  - dimension: Launch_Brand
    label: 'Brand Sent'
    type: string
    sql: substring(UPPER(${TABLE}.launch_name),1,3)
    
    ################################ ^^^^^ case these you silly sausage

  - dimension: concatid
    type: string
    hidden: TRUE
    sql: ${TABLE}.concatid

  - dimension: email_address
    type: string
    hidden: TRUE
    sql: ${TABLE}.email_address
    
  - dimension: riid
    type: string
    hidden: TRUE
    sql: ${TABLE}.riid

#######################

#### COUNT OF SENT/OPEN/CLICK/UNSUB

#   - measure: count
#     type: count
#     drill_fields: [launch_name]
     
    
  - measure: Uniqe_Send_Count
    type: count_distinct
    sql: ${TABLE}.concatid
    
  - measure: Open_Count
    type: sum
    sql: ${TABLE}.open_count
    
  - measure: Click_Count
    type: sum
    sql: ${TABLE}.click_count 
    
  - measure: Click_Count_Unique
    type: count_distinct
    sql: ${TABLE}.click_count   

  - measure: Unsubscribe_Count
    type: sum
    sql: ${TABLE}.unsub_count
  
  - measure: Bounce_Count
    type: sum
    sql: ${TABLE}.bounce_count
    