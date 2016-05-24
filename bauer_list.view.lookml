- view: bauer_list
  sql_table_name: publications.bauer_list
  fields:

  - dimension: age
    type: number
    sql: ${TABLE}.age
    
  - dimension: age_tier
    type: tier
    tiers: [0,10,20,30,40,60,80]
    sql: ${age}
    style: integer
    
  - dimension: age_banding
    type: string
    sql: ${TABLE}.agebanding

#   - dimension: birthday
#     type: number
#     sql: ${TABLE}.birthday
# 
#   - dimension: birth_month
#     type: number
#     sql: ${TABLE}.birthmonth
# 
#   - dimension: birth_year
#     type: number
#     sql: ${TABLE}.birthyear

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: country
    type: string
    sql: INITCAP(${TABLE}.country)

  - dimension_group: created
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.created

  - dimension: created_by
    type: string
    sql: ${TABLE}.created_by

  - dimension: customer_id
    type: string
    sql: ${TABLE}.customer_id

  - dimension_group: birth_day
    type: time
    timeframes: [date, week, month, year, day_of_week]
    convert_tz: false
    sql: ${TABLE}.dateofbirth

  - dimension_group: ddw_updated
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.ddw_updated_date

  - dimension: educationlevel
    type: string
    sql: ${TABLE}.educationlevel

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

  - dimension: email_permission_status
    type: string
    sql: ${TABLE}.email_permission_status

  - dimension: firstname
    type: string
    sql: ${TABLE}.firstname
    
  - dimension: gender
    type: string
    sql_case:
      F: ${TABLE}.gender = 'f' or ${TABLE}.gender = 'Female' 
      M: ${TABLE}.gender = 'm' or ${TABLE}.gender = 'Male' 
      else: 'Unknown'
  
  - dimension: gender_name
    sql: |
      CASE 
        WHEN ${gender} = 'F' THEN 'Female' 
        WHEN ${gender} = 'M' THEN 'Male' 
        ELSE 'Unknown' 
      END
    
  
  - dimension: hometown
    type: string
    sql: ${TABLE}.hometown

  - dimension: household_income
    label: 'Household Income ($USD)'
    description: 'This is the income in USD '
    type: string
    sql: ${TABLE}.householdincome

  - dimension: is_registered
    type: yesno
    sql: ${TABLE}.isregistered = 'Y'

  - dimension: lastname
    type: string
    sql: ${TABLE}.lastname

  - dimension: mobile_country
    type: string
    sql: ${TABLE}.mobile_country

  - dimension: mobile_number
    type: string
    sql: ${TABLE}.mobile_number

  - dimension: nickname
    type: string
    sql: ${TABLE}.nickname

  - dimension: nudgeid
    type: string
    sql: ${TABLE}.nudgeid

  - dimension: occupation
    type: string
    sql: ${TABLE}.occupation

  - dimension: postal_code
    type: string
    sql: ${TABLE}.postal_code

  - dimension: postal_area
    type: string
    sql: split_part(${postal_code},' ', 1)

  - dimension: postal_street_1
    type: string
    sql: ${TABLE}.postal_street_1

  - dimension: postal_street_2
    type: string
    sql: ${TABLE}.postal_street_2

  - dimension: postal_street_3
    type: string
    sql: ${TABLE}.postal_street_3

  - dimension_group: regdate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.regdate

  - dimension: region
    type: string
    sql: ${TABLE}.region

  - dimension: regsource
    type: string
    sql: ${TABLE}.regsource

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: subsindividualid
    type: string
    sql: ${TABLE}.subsindividualid

  - dimension: telephonehomeadded
    type: string
    sql: ${TABLE}.telephonehomeadded

  - dimension: telephonehomeiso
    type: string
    sql: ${TABLE}.telephonehomeiso

  - dimension: telephonehomenumber
    type: string
    sql: ${TABLE}.telephonehomenumber

  - dimension: telephonemobileadded
    type: string
    sql: ${TABLE}.telephonemobileadded

  - dimension: telephonemobileiso
    type: string
    sql: ${TABLE}.telephonemobileiso

  - dimension: telephoneworkadded
    type: string
    sql: ${TABLE}.telephoneworkadded

  - dimension: telephone_work_iso
    type: string
    sql: ${TABLE}.telephoneworkiso

  - dimension: telephoneworknumber
    type: string
    sql: ${TABLE}.telephoneworknumber

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: updated_by
    type: string
    sql: ${TABLE}.updated_by

  - dimension: username
    type: string
    sql: ${TABLE}.username

  - dimension: zippafvalidated
    type: string
    sql: ${TABLE}.zippafvalidated
    
  - dimension: registered_date_banding
    type: string
    sql: |
      CASE 
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) = 0 THEN 'Today'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 7 THEN '1-7 days'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 30 THEN '8-30 days'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 90 THEN '1-3 months'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 180 THEN '3-6 months'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 365 THEN '6-12 months'
      END
  
  - dimension: registered_date_today
    type: yesno
    sql: DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) = 0
  
  - dimension: registered_date_last_7_days
    type: yesno
    sql: DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 7
  
  - dimension: registered_date_last_30_days
    type: yesno
    sql: DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 30
  
  - dimension: registered_date_last_3_months
    type: yesno
    sql: DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 90
  
  - dimension: registered_date_last_6_months
    type: yesno
    sql: DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 180
  
  - dimension: registered_date_last_12_months
    type: yesno
    sql: DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 365

  - measure: count
    type: count
    drill_fields: [firstname, lastname, nickname, username]
  
  - measure: registered_users_count
    type: count_distinct
    sql: ${customer_id}

