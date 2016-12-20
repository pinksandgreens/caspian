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
    sql: |
        CASE      
          WHEN ${TABLE}.account_gender = 'm' THEN 'Male'
          WHEN ${TABLE}.account_gender = 'f' THEN 'Male'
          WHEN ${TABLE}.account_gender IS NULL THEN 'Null'
          ELSE 'Unknown'
        END
          


  - dimension: account_id
    type: string
    sql: ${TABLE}.account_id

  - dimension: account_origin
    type: string
    sql: ${TABLE}.account_origin
    sql: |
        CASE      
          WHEN ${TABLE}.account_origin = 'abr' THEN 'Absolute Radio'
          WHEN ${TABLE}.account_origin = 'air' THEN 'Radio Air'
          WHEN ${TABLE}.account_origin = 'bor' THEN 'Radio Borders'
          WHEN ${TABLE}.account_origin = 'cfm' THEN 'CFM'
          WHEN ${TABLE}.account_origin = 'cit' THEN 'Radio City'
          WHEN ${TABLE}.account_origin = 'cly' THEN 'Radio Clyde'
          WHEN ${TABLE}.account_origin = 'coo' THEN 'Cool FM'
          WHEN ${TABLE}.account_origin = 'dwn' THEN 'Downtown Radio'
          WHEN ${TABLE}.account_origin = 'for' THEN 'Forth Radio'
          WHEN ${TABLE}.account_origin = 'fre' THEN 'Free Radio'
          WHEN ${TABLE}.account_origin = 'gem' THEN 'Radio GEM'
          WHEN ${TABLE}.account_origin = 'hal' THEN 'Hallam FM'
          WHEN ${TABLE}.account_origin = 'hea' THEN 'Heat Radio'
          WHEN ${TABLE}.account_origin = 'hit' THEN 'The Hits'
          WHEN ${TABLE}.account_origin = 'key' THEN 'Key 103'
          WHEN ${TABLE}.account_origin = 'kis' THEN 'KISS FM'
          WHEN ${TABLE}.account_origin = 'krg' THEN 'Kerrang Radio'
          WHEN ${TABLE}.account_origin = 'met' THEN 'Metro Radio'
          WHEN ${TABLE}.account_origin = 'mfr' THEN 'MFR Radio'
          WHEN ${TABLE}.account_origin = 'mgc' THEN 'Magic 105 FM'
          WHEN ${TABLE}.account_origin = 'nth' THEN 'North Sound FM'
          WHEN ${TABLE}.account_origin = 'prk' THEN 'Planet Rock'
          WHEN ${TABLE}.account_origin = 'rok' THEN 'Rock FM'
          WHEN ${TABLE}.account_origin = 'tay' THEN 'Tay FM'
          WHEN ${TABLE}.account_origin = 'tfm' THEN 'TFM'
          WHEN ${TABLE}.account_origin = 'vik' THEN 'Viking FM'
          WHEN ${TABLE}.account_origin = 'wav' THEN 'Wave 105 FM'
          WHEN ${TABLE}.account_origin = 'wsa' THEN 'Westsound FM'
          WHEN ${TABLE}.account_origin = 'wsd' THEN 'Westsound'
          WHEN ${TABLE}.account_origin IS NULL THEN 'Null'
          ELSE 'Unknown' 
        END


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

