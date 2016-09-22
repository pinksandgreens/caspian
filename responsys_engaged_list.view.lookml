- view: responsys_engaged_list
  sql_table_name: responsys.responsys_engaged_list
  fields:

  - dimension: age_banding
    type: string
    sql: ${TABLE}.age_banding

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

  - dimension: gender
    type: string
    sql: ${TABLE}.gender

  - dimension: postal_code
    type: string
    sql: ${TABLE}.postal_code

  - dimension: riid
    type: string
    sql: ${TABLE}.riid

  - measure: unique_users
    type: count_distinct
    sql: ${TABLE}.email_address

