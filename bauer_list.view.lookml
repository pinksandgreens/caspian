- view: bauer_list
  sql_table_name: publications.bauer_list
  fields:

  - dimension: age
    type: string
    sql: ${TABLE}.age

  - dimension: agebanding
    type: string
    sql: ${TABLE}.agebanding

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
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.created

  - dimension: created_by
    type: string
    sql: ${TABLE}.created_by

  - dimension: customer_id
    type: string
    sql: ${TABLE}.customer_id

  - dimension_group: dateofbirth
    type: time
    timeframes: [date, week, month]
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
    sql: ${TABLE}.gender

  - dimension: hometown
    type: string
    sql: ${TABLE}.hometown

  - dimension: householdincome
    type: string
    sql: ${TABLE}.householdincome

  - dimension: isregistered
    type: string
    sql: ${TABLE}.isregistered

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

  - dimension: telephoneworkiso
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

  - measure: count
    type: count
    drill_fields: [firstname, lastname, nickname, username]

