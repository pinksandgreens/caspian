- view: gigya_users
  label: '2a. Registered Users'
  sql_table_name: publications.gigya_users
  fields:

  - dimension: address
    hidden: TRUE
    type: string
    sql: ${TABLE}.address

  - dimension: address2
    hidden: TRUE
    type: string
    sql: ${TABLE}.address2

  - dimension: address3
    hidden: TRUE
    type: string
    sql: ${TABLE}.address3

  - dimension: age
    hidden: TRUE
    type: number
    sql: ${TABLE}.age
      
  - dimension: baueremailoptin
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.baueremailoptin

  - dimension: bauerphoneoptin
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.bauerphoneoptin

  - dimension: bauerpostaloptin
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.bauerpostaloptin

  - dimension: bauersmsoptin
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.bauersmsoptin

  - dimension: bio
    hidden: TRUE
    type: string
    sql: ${TABLE}.bio

  - dimension: birthday
    hidden: TRUE
    type: number
    sql: ${TABLE}.birthday

  - dimension: birthmonth
    hidden: TRUE
    type: number
    sql: ${TABLE}.birthmonth

  - dimension: birthyear
    hidden: TRUE
    type: number
    sql: ${TABLE}.birthyear

  - dimension: city
    hidden: TRUE
    type: string
    sql: ${TABLE}.city

  - dimension: country
    hidden: TRUE
    type: string
    sql: ${TABLE}.country

  - dimension_group: created
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: created_timestamp
    hidden: TRUE
    type: number
    sql: ${TABLE}.created_timestamp

  - dimension_group: ddw_updated
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_updated_date

  - dimension: education_level
    hidden: TRUE
    type: string
    sql: ${TABLE}.education_level

  - dimension: email
    hidden: TRUE
    type: string
    sql: ${TABLE}.email

  - dimension: first_name
    hidden: TRUE
    type: string
    sql: ${TABLE}.first_name

  - dimension: followerscount
    hidden: TRUE
    type: number
    sql: ${TABLE}.followerscount

  - dimension: followingcount
    hidden: TRUE
    type: number
    sql: ${TABLE}.followingcount
    
  - dimension: location_test
    label: 'Latitude/Longitude Location'
    type: location
    sql_latitude: ROUND(${TABLE}.location_lat,1)
    sql_longitude: ROUND(${TABLE}.location_long,1)
   
  - dimension: gender
    hidden: TRUE
    type: string
    sql_case:
      female: ${TABLE}.gender = 'f' or ${TABLE}.gender = 'F' 
      male: ${TABLE}.gender = 'm' or ${TABLE}.gender = 'M' 
      else: 'unknown'    

  - dimension: gigya_id
    label: 'User ID'
    type: string
    primary_key: true
    sql: ${TABLE}.gigya_id

  - dimension: has_been_processed
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.has_been_processed

  - dimension: home_country_iso_code
    hidden: TRUE
    type: string
    sql: ${TABLE}.home_country_iso_code

  - dimension: hometown
    hidden: TRUE
    type: string
    sql: ${TABLE}.hometown

  - dimension: individual_id
    label: 'Individual ID'
    type: number
    sql: ${TABLE}.individual_id

  - dimension: industry
    hidden: TRUE
    type: string
    sql: ${TABLE}.industry

  - dimension: interestedin
    hidden: TRUE
    type: string
    sql: ${TABLE}.interestedin

  - dimension: irank
    hidden: TRUE
    type: number
    sql: ${TABLE}.irank

  - dimension: is_active
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.is_active

  - dimension: is_lockedout
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.is_lockedout

  - dimension: is_registered
    label: 'Is Registered on Gigya'
    type: yesno
    sql: ${TABLE}.is_registered

  - dimension: is_verified
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.is_verified

  - dimension_group: last_login
    label: 'DEPRICATED'
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_login

  - dimension: last_name
    hidden: TRUE
    type: string
    sql: ${TABLE}.last_name

  - dimension_group: last_updated
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: last_updated_timestamp
    hidden: TRUE
    type: number
    sql: ${TABLE}.last_updated_timestamp

  - dimension: locale
    hidden: TRUE
    type: string
    sql: ${TABLE}.locale

  - dimension: location_city
    hidden: TRUE
    type: string
    sql: ${TABLE}.location_city

  - dimension: location_country
    hidden: TRUE
    type: string
    sql: ${TABLE}.location_country

  - dimension: location_lat
    hidden: TRUE
    type: number
    sql: ${TABLE}.location_lat

  - dimension: location_long
    hidden: TRUE
    type: number
    sql: ${TABLE}.location_long

  - dimension: location_state
    hidden: TRUE
    type: string
    sql: ${TABLE}.location_state

  - dimension: mobile_country_iso_code
    hidden: TRUE
    type: string
    sql: ${TABLE}.mobile_country_iso_code

  - dimension: name
    hidden: TRUE
    type: string
    sql: ${TABLE}.name

  - dimension: nickname
    hidden: TRUE
    type: string
    sql: ${TABLE}.nickname

  - dimension_group: oldest_data_updated
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.oldest_data_updated

  - dimension: oldest_data_updated_timestamp
    hidden: TRUE
    type: number
    sql: ${TABLE}.oldest_data_updated_timestamp

  - dimension: photourl
    hidden: TRUE
    type: string
    sql: ${TABLE}.photourl

  - dimension: political_view
    hidden: TRUE
    type: string
    sql: ${TABLE}.political_view

  - dimension: professional_headline
    label: 'Job Title'
    type: string
    sql: ${TABLE}.professional_headline

  - dimension: profile_url
    hidden: TRUE
    type: string
    sql: ${TABLE}.profile_url

  - dimension: proxy_email
    hidden: TRUE
    type: string
    sql: ${TABLE}.proxy_email

  - dimension_group: registered
    label: 'Registered'
    hidden: FALSE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.registered

  - dimension: registered_timestamp
    hidden: TRUE
    type: number
    sql: ${TABLE}.registered_timestamp

  - dimension: regsource
    hidden: TRUE
    type: string
    sql: ${TABLE}.regsource

  - dimension: relationship_status
    hidden: TRUE
    type: string
    sql: ${TABLE}.relationship_status

  - dimension: religion
    hidden: TRUE
    type: string
    sql: ${TABLE}.religion

  - dimension: social_providers
    label: 'Social Providers'
    type: string
    sql: ${TABLE}.social_providers

  - dimension: state
    label: 'County'
    type: string
    sql: ${TABLE}.state

  - dimension: thirdpartyemailoptin
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.thirdpartyemailoptin

  - dimension: thirdpartyphoneoptin
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.thirdpartyphoneoptin

  - dimension: thirdpartypostaloptin
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.thirdpartypostaloptin

  - dimension: thirdpartysmsoptin
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.thirdpartysmsoptin

  - dimension: thumbnailurl
    hidden: TRUE
    type: string
    sql: ${TABLE}.thumbnailurl

  - dimension: timezone
    hidden: TRUE
    type: string
    sql: ${TABLE}.timezone

  - dimension: title
    hidden: TRUE
    type: string
    sql: ${TABLE}.title

  - dimension: username
    hidden: TRUE
    type: string
    sql: ${TABLE}.username

  - dimension: verified
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.verified

  - dimension: verified_timestamp
    hidden: TRUE
    type: number
    sql: ${TABLE}.verified_timestamp

  - dimension: work_country_iso_code
    hidden: TRUE
    type: string
    sql: ${TABLE}.work_country_iso_code

  - dimension: zipcode
    hidden: TRUE
    type: string
    sql: ${TABLE}.zipcode
  
  - dimension: logged_in_date_banding
    label: 'Last Logged In - Date Banding'
    type: string
    sql: |
      CASE 
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) = 0 THEN 'Today'
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) > 0 AND DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) <= 7 THEN '1-7 days'
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) > 7 AND DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) <= 30 THEN '8-30 days'
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) > 30 AND DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) <= 90 THEN '1-3 months'
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) > 90 AND DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) <= 180 THEN '3-6 months'
        WHEN DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) > 180 AND DATEDIFF('day', ${TABLE}.last_login, CURRENT_DATE) <= 365 THEN '6-12 months'
        ELSE 'Unknown'
      END
  
  - dimension: active_user
    label: 'Is Active User'
    type: yesno
    sql: DATEDIFF('month', ${TABLE}.last_login, CURRENT_DATE) >= 0  AND DATEDIFF('month', ${TABLE}.last_login, CURRENT_DATE) <= 3

  - measure: count
    hidden: TRUE
    type: count
    drill_fields: [first_name, last_name, name, nickname, username]
    
  - measure: users_count
    label: 'Registered Users Count'
    type: count_distinct
    sql: ${TABLE}.email

