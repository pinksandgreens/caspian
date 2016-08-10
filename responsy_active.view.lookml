- view: responsy_active
  label: '2a. Email Data'
  sql_table_name: responsys.lm_ced_replacement_24h
  fields:




#### Marketing Info

  - dimension: marketing_strategy
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.marketing_strategy = ' ' THEN NULL
        WHEN ${TABLE}.marketing_strategy = 'Car Magazine' THEN NULL
        WHEN ${TABLE}.marketing_strategy = 'LandScape' THEN NULL
        WHEN ${TABLE}.marketing_strategy = 'Motorcycle News' THEN NULL
        WHEN ${TABLE}.marketing_strategy = 'Parkers' THEN NULL
        WHEN ${TABLE}.marketing_strategy = 'Todays Golfer' THEN NULL
        ELSE ${TABLE}.marketing_strategy
      END

  - dimension: marketing_program
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.marketing_program = ' ' THEN NULL
        ELSE ${TABLE}.marketing_program
      END


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
        WHEN ${TABLE}.unsub_type = 'LEGA' THEN 'Brand'
        WHEN ${TABLE}.unsub_type = 'BRAN' THEN 'Brand'
        WHEN ${TABLE}.unsub_type = 'NEWS' THEN 'Newsletter'
        WHEN ${TABLE}.unsub_type = 'BAUR' THEN 'Bauer'
        WHEN ${TABLE}.unsub_type = 'THRD' THEN 'Third Party'
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
    sql: ${TABLE}.launch_date

  - dimension: open_date
    label: 'Open'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.open_date

  - dimension: click_date
    label: 'Click'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.click_date

  - dimension: click_date_not_null
    label: 'Unique Clicks'
    hidden: TRUE
    type: string
    sql: |
     CASE
      WHEN ${TABLE}.click_date IS NULL THEN '0'
      ELSE '1'
     END

  - dimension: open_date_not_null
    label: 'Unique Opens'
    hidden: TRUE
    type: string
    sql: |
     CASE
      WHEN ${TABLE}.open_date IS NULL THEN '0'
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
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/54?Campaign%20Name={{ value }}&Timeframe=21%20weeks" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
    
  - dimension: Launch_Brand
    label: 'Brand Sent'
    type: string
    sql: substring(UPPER(${TABLE}.launch_name),1,3)
    
    
    ################################ ^^^^^ case these

  - dimension: concatid
    type: string
    hidden: TRUE
    primary_key: TRUE
    sql: ${TABLE}.concat_id

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
    label: 'Send Count Unique'
    type: count_distinct
    sql: ${TABLE}.concat_id
    
  - measure: Uniqe_Send_Count_Without_Bounces
    hidden: TRUE
    label: 'Not for human eyes'
    type: count_distinct
    sql: ${TABLE}.concat_id
    filters:
      bounce_type: -'H',-'S'
    
  - measure: Open_Count
    type: sum
    sql: |
      CASE
        WHEN ${TABLE}.open_count >0 THEN ${TABLE}.open_count
      END
      
  - measure: Click_Count
    type: sum
    sql: |
      CASE
        WHEN ${TABLE}.click_count >0 THEN ${TABLE}.click_count
      END

  - measure: Open_Count_For_Individuals
    hidden: TRUE
    type: sum
    sql: |
      CASE
        WHEN ${TABLE}.open_count IS NULL THEN '0'
        WHEN ${TABLE}.open_count = '0' THEN '0'
        ELSE ${TABLE}.open_count
      END
      
  - measure: Open_Count_TEST
    type: sum
    hidden: TRUE
    sql: |
      CASE
        WHEN ${TABLE}.open_count >0 THEN ${TABLE}.open_count
      END
    
  - measure: Click_Count_Unique
    type: number
    sql: |
      CASE
        WHEN sum(${click_date_not_null}) >0 THEN sum(${click_date_not_null}) 
      END
    
  - measure: Open_Count_Unique
    type: number
    sql: |
      CASE
        WHEN sum(${open_date_not_null}) >0 THEN sum(${open_date_not_null})
      END
 
  
  - measure: Click_to_Open_Rate
    label: 'Click-to-Open Rate'
    type: number
    value_format: '0.00\%'
    sql: (${Click_Count_Unique}/${Open_Count_Unique})*100
    
  - measure: Send_to_Open_Rate
    label: 'Send-to-Open Rate'
    type: number
    value_format: '0.00\%'
    sql: (${Open_Count_Unique}/${Uniqe_Send_Count})*100
    
  - measure: Click_Through_Rate
    label: 'Click-Through-Rate'
    type: number
    value_format: '0.00\%'
    sql: (${Click_Count_Unique}/${Uniqe_Send_Count_Without_Bounces}) * 100
    
  - measure: Unsubscribe_Count
    type: sum
    sql: ${TABLE}.unsub_count
  
  - measure: Bounce_Count
    type: sum
    sql: ${TABLE}.bounce_count
    