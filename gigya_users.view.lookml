- view: gigya_users
  sql_table_name: publications.gigya_users
  fields:

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: address2
    type: string
    sql: ${TABLE}.address2

  - dimension: address3
    type: string
    sql: ${TABLE}.address3

  - dimension: age
    type: number
    sql: ${TABLE}.age

  - dimension: baueremailoptin
    type: yesno
    sql: ${TABLE}.baueremailoptin

  - dimension: bauerphoneoptin
    type: yesno
    sql: ${TABLE}.bauerphoneoptin

  - dimension: bauerpostaloptin
    type: yesno
    sql: ${TABLE}.bauerpostaloptin

  - dimension: bauersmsoptin
    type: yesno
    sql: ${TABLE}.bauersmsoptin

  - dimension: bio
    type: string
    sql: ${TABLE}.bio

  - dimension: birthday
    type: number
    sql: ${TABLE}.birthday

  - dimension: birthmonth
    type: number
    sql: ${TABLE}.birthmonth

  - dimension: birthyear
    type: number
    sql: ${TABLE}.birthyear

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: created_timestamp
    type: number
    sql: ${TABLE}.created_timestamp

  - dimension_group: ddw_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_updated_date

  - dimension: education_level
    type: string
    sql: ${TABLE}.education_level

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: first_name
    type: string
    sql: ${TABLE}.first_name

  - dimension: followerscount
    type: number
    sql: ${TABLE}.followerscount

  - dimension: followingcount
    type: number
    sql: ${TABLE}.followingcount

  - dimension: gender
    type: string
    sql_case:
      female: ${TABLE}.gender = 'f' or ${TABLE}.gender = 'F' 
      male: ${TABLE}.gender = 'm' or ${TABLE}.gender = 'M' 
      else: 'unknown'    

  - dimension: gigya_id
    type: string
    primary_key: true
    sql: ${TABLE}.gigya_id

  - dimension: has_been_processed
    type: yesno
    sql: ${TABLE}.has_been_processed

  - dimension: home_country_iso_code
    type: string
    sql: ${TABLE}.home_country_iso_code

  - dimension: hometown
    type: string
    sql: ${TABLE}.hometown

  - dimension: individual_id
    type: number
    sql: ${TABLE}.individual_id

  - dimension: industry
    type: string
    sql: ${TABLE}.industry

  - dimension: interestedin
    type: string
    sql: ${TABLE}.interestedin

  - dimension: irank
    type: number
    sql: ${TABLE}.irank

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.is_active

  - dimension: is_lockedout
    type: yesno
    sql: ${TABLE}.is_lockedout

  - dimension: is_registered
    type: yesno
    sql: ${TABLE}.is_registered

  - dimension: is_verified
    type: yesno
    sql: ${TABLE}.is_verified

  - dimension_group: last_login
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_login

  - dimension: last_name
    type: string
    sql: ${TABLE}.last_name

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: last_updated_timestamp
    type: number
    sql: ${TABLE}.last_updated_timestamp

  - dimension: locale
    type: string
    sql: ${TABLE}.locale

  - dimension: location_city
    type: string
    sql: ${TABLE}.location_city

  - dimension: location_country
    type: string
    sql: ${TABLE}.location_country

  - dimension: location_lat
    type: number
    sql: ${TABLE}.location_lat

  - dimension: location_long
    type: number
    sql: ${TABLE}.location_long

  - dimension: location_state
    type: string
    sql: ${TABLE}.location_state

  - dimension: mobile_country_iso_code
    type: string
    sql: ${TABLE}.mobile_country_iso_code

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: nickname
    type: string
    sql: ${TABLE}.nickname

  - dimension_group: oldest_data_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.oldest_data_updated

  - dimension: oldest_data_updated_timestamp
    type: number
    sql: ${TABLE}.oldest_data_updated_timestamp

  - dimension: photourl
    type: string
    sql: ${TABLE}.photourl

  - dimension: political_view
    type: string
    sql: ${TABLE}.political_view

  - dimension: professional_headline
    type: string
    sql: ${TABLE}.professional_headline

  - dimension: profile_url
    type: string
    sql: ${TABLE}.profile_url

  - dimension: proxy_email
    type: string
    sql: ${TABLE}.proxy_email

  - dimension_group: registered
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.registered

  - dimension: registered_timestamp
    type: number
    sql: ${TABLE}.registered_timestamp

  - dimension: regsource
    type: string
    sql: ${TABLE}.regsource

  - dimension: relationship_status
    type: string
    sql: ${TABLE}.relationship_status

  - dimension: religion
    type: string
    sql: ${TABLE}.religion

  - dimension: social_providers
    type: string
    sql: ${TABLE}.social_providers

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: thirdpartyemailoptin
    type: yesno
    sql: ${TABLE}.thirdpartyemailoptin

  - dimension: thirdpartyphoneoptin
    type: yesno
    sql: ${TABLE}.thirdpartyphoneoptin

  - dimension: thirdpartypostaloptin
    type: yesno
    sql: ${TABLE}.thirdpartypostaloptin

  - dimension: thirdpartysmsoptin
    type: yesno
    sql: ${TABLE}.thirdpartysmsoptin

  - dimension: thumbnailurl
    type: string
    sql: ${TABLE}.thumbnailurl

  - dimension: timezone
    type: string
    sql: ${TABLE}.timezone

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: username
    type: string
    sql: ${TABLE}.username

  - dimension: verified
    type: yesno
    sql: ${TABLE}.verified

  - dimension: verified_timestamp
    type: number
    sql: ${TABLE}.verified_timestamp

  - dimension: work_country_iso_code
    type: string
    sql: ${TABLE}.work_country_iso_code

  - dimension: zipcode
    type: string
    sql: ${TABLE}.zipcode

  - measure: count
    type: count
    drill_fields: [first_name, last_name, name, nickname, username]
    
  - measure: users_count
    type: count_distinct
    sql: ${TABLE}.email

