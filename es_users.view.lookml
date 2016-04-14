- view: es_users
  sql_table_name: publications.es_users
  fields:

  - dimension: address_line1
    type: string
    sql: ${TABLE}.address_line1

  - dimension: address_line2
    type: string
    sql: ${TABLE}.address_line2

  - dimension: age
    type: tier
    tiers: [0,10,20,30,40,50,60,70,80]
    sql: ${TABLE}.age

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date

  - dimension: date_of_birth
    type: string
    sql: ${TABLE}.date_of_birth

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: first_name
    type: string
    sql: ${TABLE}.first_name

  - dimension: gender
    type: string
    sql: ${TABLE}.gender

  - dimension: groupoptin
    type: yesno
    sql: ${TABLE}.groupoptin

  - dimension: has_been_processed
    type: yesno
    sql: ${TABLE}.has_been_processed

  - dimension: homephonenumber
    type: string
    sql: ${TABLE}.homephonenumber

  - dimension: last_name
    type: string
    sql: ${TABLE}.last_name

  - dimension: mobilephonenumber
    type: string
    sql: ${TABLE}.mobilephonenumber

  - dimension: optin
    type: yesno
    sql: ${TABLE}.optin

  - dimension: phone
    type: string
    sql: ${TABLE}.phone

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: thirdpartyoptin
    type: yesno
    sql: ${TABLE}.thirdpartyoptin

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date

  - dimension: user_id
    type: string
    primary_key: true
    sql: ${TABLE}.user_id

  - dimension: workphonenumber
    type: string
    sql: ${TABLE}.workphonenumber

  - dimension: zipcode
    type: string
    sql: ${TABLE}.zipcode

  - measure: users_count
    type: count_distinct
    sql: ${user_id}
    drill_fields: [first_name, last_name]

