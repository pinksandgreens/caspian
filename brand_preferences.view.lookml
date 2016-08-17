- view: brand_preferences
  label: '2b. Brand Preferences'
  sql_table_name: publications.brand_preferences
  fields:

  - dimension: brand
    label: 'Brand Name'
    type: string
    sql: ${TABLE}.brand

  - dimension: created_by
    hidden: TRUE
    label: 'Created By (ES/Gigya/Nudge)'
    type: string
    sql: ${TABLE}.created_by

  - dimension_group: date_created
    label: 'Created'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created

  - dimension: email_bauer_optin
    label: 'Email Optin - Bauer'
    type: string
    sql: ${TABLE}.email_bauer_optin

  - dimension: email_brand_optin
    label: 'Email Optin - Brand'
    type: string
    sql: ${TABLE}.email_brand_optin

  - dimension: email_third_optin
    label: 'Email Optin - Third'
    type: string
    sql: ${TABLE}.email_third_optin

  - dimension: idd_id
    hidden: TRUE
    type: string
    sql: ${TABLE}.idd_id

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: phone_bauer_optin
    hidden: TRUE
    type: string
    sql: ${TABLE}.phone_bauer_optin

  - dimension: phone_brand_optin
    hidden: TRUE
    type: string
    sql: ${TABLE}.phone_brand_optin

  - dimension: phone_third_optin
    hidden: TRUE
    type: string
    sql: ${TABLE}.phone_third_optin

  - dimension: post_bauer_optin
    hidden: TRUE
    type: string
    sql: ${TABLE}.post_bauer_optin

  - dimension: post_brand_optin
    hidden: TRUE
    type: string
    sql: ${TABLE}.post_brand_optin

  - dimension: post_third_optin
    hidden: TRUE
    type: string
    sql: ${TABLE}.post_third_optin

  - dimension: sms_bauer_optin
    hidden: TRUE
    type: string
    sql: ${TABLE}.sms_bauer_optin

  - dimension: sms_brand_optin
    hidden: TRUE
    type: string
    sql: ${TABLE}.sms_brand_optin

  - dimension: sms_third_optin
    hidden: TRUE
    type: string
    sql: ${TABLE}.sms_third_optin

  - dimension: updated_by
    type: string
    sql: ${TABLE}.updated_by

  - measure: Brand_Optin_Count
    type: count_distinct
    sql: ${TABLE}.idd_id
    filters:
      email_brand_optin: 'true'

  - measure: count
    hidden: TRUE
    type: count
    drill_fields: []

