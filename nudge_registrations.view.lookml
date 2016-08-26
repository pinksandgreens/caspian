- view: nudge_registrations
  sql_table_name: publications.nudge_registrations
  fields:

  - dimension: address_line1
    type: string
    sql: ${TABLE}.address_line1

  - dimension: address_line2
    type: string
    sql: ${TABLE}.address_line2

  - dimension: address_line3
    type: string
    sql: ${TABLE}.address_line3

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: county
    type: string
    sql: ${TABLE}.county

  - dimension: cre_user_id
    type: string
    sql: ${TABLE}.cre_user_id

  - dimension_group: date_of_birth
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.date_of_birth

  - dimension: email_address
    hidden: TRUE
    type: string
    sql: ${TABLE}.email_address

  - dimension: first_name
    type: string
    sql: ${TABLE}.first_name

  - dimension: home_phone
    type: string
    sql: ${TABLE}.home_phone

  - dimension: household_id
    type: number
    sql: ${TABLE}.household_id

  - dimension: individual_id
    type: number
    sql: ${TABLE}.individual_id

  - dimension: interactions_id
    type: string
    sql: ${TABLE}.interactions_id

  - dimension: last_name
    type: string
    sql: ${TABLE}.last_name

  - dimension_group: last_seen
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.last_seen_date

  - dimension: mobile_phone
    type: string
    sql: ${TABLE}.mobile_phone

  - dimension: ms_std_salacious_address
    type: string
    sql: ${TABLE}.ms_std_salacious_address

  - dimension: ms_std_salacious_email
    type: string
    sql: ${TABLE}.ms_std_salacious_email

  - dimension: ms_std_salacious_name
    type: string
    sql: ${TABLE}.ms_std_salacious_name

  - dimension: postcode
    type: string
    sql: ${TABLE}.postcode

  - dimension: source
    type: string
    sql: ${TABLE}.source

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: town
    type: string
    sql: ${TABLE}.town

  - dimension: user_id
    type: string
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [first_name, last_name, ms_std_salacious_name]

