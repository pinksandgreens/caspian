- view: bauer_list
  sql_table_name: publications.bauer_list
  fields:

  - dimension: age
    label: 'Age'
    type: number
    sql: ${TABLE}.age
    
  - dimension: age_tier
    label: 'Age Tier'
    type: tier
    tiers: [0,10,20,30,40,60,80]
    sql: ${age}
    style: integer
    
  - dimension: age_banding
    label: 'Age Banding'
    type: string
    sql: ${TABLE}.agebanding
    sql_case:
      18-24: ${TABLE}.agebanding = '18-24'
      25-34: ${TABLE}.agebanding = '25-34'
      35-44: ${TABLE}.agebanding = '35-44'
      45-54: ${TABLE}.agebanding = '45-54'
      55-64: ${TABLE}.agebanding = '55-64'
      65-74: ${TABLE}.agebanding = '65-74'
      75+: ${TABLE}.agebanding = '75+'
      else: 'Unknown' 


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
    label: 'City'
    type: string
    sql: ${TABLE}.city

  - dimension: country
    label: 'Country'
    type: string
    sql: |
       CASE 
         WHEN ${TABLE}.country = 'United States' THEN 'United States of America'
         ELSE INITCAP(${TABLE}.country)
       END


  - dimension_group: created
    label: 'Date Created'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.created

  - dimension: created_by
    label: 'Data From (ES/Nudge/Gigya)'
    type: string
    sql: ${TABLE}.created_by
    
  - dimension: customer_id
    hidden: TRUE
    type: string
    sql: ${TABLE}.customer_id

  - dimension_group: birth_day
    hidden: TRUE
    type: time
    timeframes: [date, week, month, year, day_of_week]
    convert_tz: false
    sql: ${TABLE}.dateofbirth

  - dimension_group: ddw_updated
    label: 'DDW Date'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.ddw_updated_date

  - dimension: educationlevel
    hidden: TRUE
    type: string
    sql: ${TABLE}.educationlevel

  - dimension: email_address
    hidden: TRUE
    type: string
    sql: ${TABLE}.email_address

  - dimension: email_permission_status
    type: string
    sql: ${TABLE}.email_permission_status

  - dimension: firstname
    hidden: TRUE
    type: string
    sql: ${TABLE}.firstname
    
  - dimension: gender
    hidden: TRUE
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
    hidden: TRUE
    type: string
    sql: ${TABLE}.hometown

  - dimension: household_income
    hidden: TRUE
    label: 'Household Income ($USD)'
    description: 'This is the income in USD '
    type: string
    sql: ${TABLE}.householdincome

  - dimension: is_registered
    label: 'Is Registered (Y/N)'
    type: yesno
    sql: ${TABLE}.isregistered = 'Y'

  - dimension: lastname
    hidden: TRUE
    type: string
    sql: ${TABLE}.lastname

  - dimension: mobile_country
    hidden: TRUE
    type: string
    sql: ${TABLE}.mobile_country

  - dimension: mobile_number
    hidden: TRUE
    type: string
    sql: ${TABLE}.mobile_number

  - dimension: nickname
    hidden: TRUE
    type: string
    sql: ${TABLE}.nickname

  - dimension: nudgeid
    hidden: TRUE
    type: string
    sql: ${TABLE}.nudgeid

  - dimension: occupation
    hidden: TRUE
    type: string
    sql: ${TABLE}.occupation

  - dimension: postal_code
    label: 'Postcode'
    type: string
    sql: ${TABLE}.postal_code

  - dimension: postal_area
    label: 'Postal Area'
    type: string
    sql: split_part(${postal_code},' ', 1)
    
  - dimension: postal_area1
    label: 'Postal Area - Area Code'
    type: string
    sql: substring(${postal_code},1,2)
    
  - dimension: postal_street_1
    hidden: TRUE
    type: string
    sql: ${TABLE}.postal_street_1

  - dimension: postal_street_2
    hidden: TRUE
    type: string
    sql: ${TABLE}.postal_street_2

  - dimension: postal_street_3
    hidden: TRUE
    type: string
    sql: ${TABLE}.postal_street_3

  - dimension_group: regdate
    label: 'Registered Date'
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.regdate

  - dimension: region
    label: 'British Region'
    type: string
    sql: ${TABLE}.region

  - dimension: regsource
    label: 'Registration Source'
    type: string
    sql: ${TABLE}.regsource

  - dimension: state
    label: 'US State'
    type: string
    sql: ${TABLE}.state

  - dimension: subsindividualid
    hidden: TRUE
    type: string
    sql: ${TABLE}.subsindividualid

  - dimension: telephonehomeadded
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonehomeadded

  - dimension: telephonehomeiso
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonehomeiso

  - dimension: telephonehomenumber
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonehomenumber

  - dimension: telephonemobileadded
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonemobileadded

  - dimension: telephonemobileiso
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephonemobileiso

  - dimension: telephoneworkadded
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephoneworkadded

  - dimension: telephone_work_iso
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephoneworkiso

  - dimension: telephoneworknumber
    hidden: TRUE
    type: string
    sql: ${TABLE}.telephoneworknumber

  - dimension: title
    hidden: TRUE
    type: string
    sql: ${TABLE}.title

  - dimension: updated_by
    hidden: TRUE
    type: string
    sql: ${TABLE}.updated_by

  - dimension: username
    hidden: TRUE
    type: string
    sql: ${TABLE}.username

  - dimension: zippafvalidated
    hidden: TRUE
    type: string
    sql: ${TABLE}.zippafvalidated
    
  - dimension: registered_date_banding
    label: 'Registered Date Banding'
    type: string
    sql: |
      CASE 
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) = 0 THEN 'Today'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 7 THEN '1-7 days'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 30 THEN '8-30 days'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 90 THEN '1-3 months'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 180 THEN '3-6 months'
        WHEN DATEDIFF('day', ${TABLE}.regdate, CURRENT_DATE) <= 365 THEN '6-12 months'
        ELSE 'Unknown'
      END
  
  - measure: count
    label: 'Count'
    type: count
    drill_fields: [firstname, lastname, nickname, username]
  
  - measure: registered_users_count
    label: 'Registered Users Count'
    type: count_distinct
    sql: ${customer_id}

