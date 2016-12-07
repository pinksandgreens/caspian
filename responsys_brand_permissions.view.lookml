- view: responsys_brand_permissions
  sql_table_name: responsys.responsys_brand_permissions_temp
  fields:

  - dimension: brandcode
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.brandcode LIKE '%campaign_brand%' THEN NULL
        WHEN ${TABLE}.brandcode LIKE '%BRANDCODE%' THEN NULL
        WHEN ${TABLE}.brandcode LIKE '%ABR%' THEN NULL
        ELSE ${TABLE}.brandcode
      END
      
  - dimension: created_date                   # HIDING ABR HERE ^
    label: 'Created'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.created_date,'YYYY-MM-DD')

  - dimension: email_address
    type: string
    hidden: TRUE
    sql: ${TABLE}.email_address

  - dimension: modified_date
    label: 'Updated'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.modified_date,'YYYY-MM-DD')

  - dimension: optin
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.optin = '6' THEN '0'
        ELSE ${TABLE}.optin
      END

  - dimension: optin_date
    label: 'Optin'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.optin_date,'YYYY-MM-DD')

  - dimension: unsub_date
    label: 'Unsub'
    type: time
    timeframes: [day_of_week, date, week, month]    
    convert_tz: false
    sql: TO_DATE(${TABLE}.unsub_date,'YYYY-MM-DD')

  - measure: brand_optins
    label: 'Commercial/Marketing Optins'
    type: count_distinct
    sql: ${TABLE}.email_address
    filters:
      optin: '1'





  - dimension: optin_count1
    label: 'Unsubs sddsaasddsa'
    hidden: TRUE
    type: string
    sql: |
     CASE
      WHEN ${TABLE}.optin_date IS NULL THEN '0'
      ELSE '1'
     END
    
    
  - measure: optin_count
    label: 'Optin Count'
    type: number
    sql: |
      CASE
        WHEN sum(${optin_count1}) >0 THEN sum(${optin_count1})
        ELSE 0
      END
      
    



    
    
  - dimension: unsub_count1
    label: 'Unsubs sddsaasddsa'
    hidden: TRUE
    type: string
    sql: |
     CASE
      WHEN ${TABLE}.unsub_date IS NULL THEN '0'
      ELSE '1'
     END
    
    
  - measure: unsub_count
    label: 'Unsubscribe Count'
    type: number
    sql: |
      CASE
        WHEN sum(${unsub_count1}) >0 THEN sum(${unsub_count1})
        ELSE 0
      END
    
    
    
    
    
    