- view: es_users
  label: 'Competition Users'
  sql_table_name: publications.es_users
  fields:

  - dimension: address_line1
    hidden: TRUE
    type: string
    sql: ${TABLE}.address_line1

  - dimension: address_line2
    hidden: TRUE
    type: string
    sql: ${TABLE}.address_line2

  - dimension: age
    hidden: TRUE
    type: tier
    tiers: [0,10,20,30,40,50,60,70,80]
    sql: ${TABLE}.age

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
    sql: ${TABLE}.created_date

  - dimension: date_of_birth
    hidden: TRUE
    type: string
    sql: ${TABLE}.date_of_birth

  - dimension: email
    hidden: TRUE
    type: string
    sql: ${TABLE}.email

  - dimension: first_name
    hidden: TRUE
    type: string
    sql: ${TABLE}.first_name

  - dimension: gender
    hidden: TRUE
    type: string
    sql: ${TABLE}.gender

  - dimension: groupoptin
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.groupoptin

  - dimension: has_been_processed
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.has_been_processed

  - dimension: homephonenumber
    hidden: TRUE
    type: string
    sql: ${TABLE}.homephonenumber

  - dimension: last_name
    hidden: TRUE
    type: string
    sql: ${TABLE}.last_name

  - dimension: mobilephonenumber
    hidden: TRUE
    type: string
    sql: ${TABLE}.mobilephonenumber

  - dimension: optin
    hidden: TRUE
    type: yesno
    sql: ${TABLE}.optin

  - dimension: phone
    hidden: TRUE
    type: string
    sql: ${TABLE}.phone

  - dimension: state
    hidden: TRUE
    type: string
    sql: ${TABLE}.state

  - dimension: thirdpartyoptin
    label: 'Third Party Optin'
    type: yesno
    sql: ${TABLE}.thirdpartyoptin

  - dimension: title
    hidden: TRUE
    type: string
    sql: ${TABLE}.title

  - dimension_group: updated
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date

  - dimension: user_id
    label: 'User ID'
    type: string
    primary_key: true
    sql: ${TABLE}.user_id

  - dimension: workphonenumber
    hidden: TRUE
    type: string
    sql: ${TABLE}.workphonenumber

  - dimension: zipcode
    hidden: TRUE
    type: string
    sql: ${TABLE}.zipcode

  - measure: users_count
    label: 'Users Count'
    type: count_distinct
    sql: ${user_id}
    drill_fields: [user_ID]

