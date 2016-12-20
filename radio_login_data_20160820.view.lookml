- view: radio_login_data_20160820
  sql_table_name: publications.radio_login_data_20160820
  fields:

  - dimension: account_bauernewsletter
    type: string
    sql: ${TABLE}.account_bauernewsletter

  - dimension: account_bauerudid
    type: string
    sql: ${TABLE}.account_bauerudid

  - dimension: account_birthdate
    type: string
    sql: ${TABLE}.account_birthdate

  - dimension: account_confirmdate
    type: string
    sql: ${TABLE}.account_confirmdate

  - dimension: account_email
    type: string
    hidden: TRUE
    sql: ${TABLE}.account_email

  - dimension: account_fullname
    type: string
    sql: ${TABLE}.account_fullname

  - dimension: account_gender
    type: string
    sql: ${TABLE}.account_gender

  - dimension: account_id
    type: string
    sql: ${TABLE}.account_id

  - dimension: account_origin
    type: string
    sql: ${TABLE}.account_origin

  - dimension: account_password
    type: string
    hidden: TRUE
    sql: ${TABLE}.account_password

  - dimension: account_passwordreset
    type: string
    sql: ${TABLE}.account_passwordreset

  - dimension: account_registerdate
    type: string
    sql: ${TABLE}.account_registerdate

  - dimension_group: registered_date
    label: 'Registered Date'
    hidden: FALSE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.account_registerdate

  - dimension: account_securityid
    type: string
    sql: ${TABLE}.account_securityid

  - dimension: account_testuser
    type: string
    sql: ${TABLE}.account_testuser

  - dimension: account_thirdpartnewsletter
    type: string
    sql: ${TABLE}.account_thirdpartnewsletter

  - measure: count
    type: count
    drill_fields: [account_fullname]
    
  - measure: radio_users_count
    label: 'Registered Radio Users Count'
    type: count_distinct
    sql: ${TABLE}.account_email

