- view: gigya_social_identities
  label: 'Registered Social Identities'
  sql_table_name: publications.gigya_social_identities
  fields:

  - dimension_group: ddw_updated
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_updated_date

  - dimension: fb_account_connected
    label: 'Facebook Account Connected'
    type: yesno
    sql: ${TABLE}.fb_account_connected

  - dimension_group: fb_account_first_connected
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.fb_account_first_connected

  - dimension_group: fb_account_last_connected
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.fb_account_last_connected

  - dimension: gigya_id
    label: 'User ID'
    type: string
    sql: ${TABLE}.gigya_id

  - dimension: googleplus_account_connected
    label: 'G+ Account Connected'
    type: yesno
    sql: ${TABLE}.googleplus_account_connected

  - dimension_group: googleplus_account_first_connected
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.googleplus_account_first_connected

  - dimension_group: googleplus_account_last_connected
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.googleplus_account_last_connected

  - dimension: native_account_connected
    label: 'Native Account Connected'
    type: yesno
    sql: ${TABLE}.native_account_connected

  - dimension_group: native_account_first_connected
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.native_account_first_connected

  - dimension_group: native_account_last_connected
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.native_account_last_connected

  - dimension: twitter_account_connected
    type: yesno
    sql: ${TABLE}.twitter_account_connected

  - dimension_group: twitter_account_first_connected
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.twitter_account_first_connected

  - dimension_group: twitter_account_last_connected
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.twitter_account_last_connected

  - measure: count
    hidden: TRUE
    type: count
    drill_fields: []

