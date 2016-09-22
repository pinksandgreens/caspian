- view: responsys_newsletter_permissions
  sql_table_name: responsys.responsys_newsletter_permissions
  fields:

  - dimension: brandcode
    type: string
    sql: ${TABLE}.brandcode

  - dimension: created_date
    type: string
    sql: ${TABLE}.created_date

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

  - dimension: modified_date
    type: string
    sql: ${TABLE}.modified_date

  - dimension: optin
    type: string
    sql: ${TABLE}.optin

  - dimension: optin_date
    type: string
    sql: ${TABLE}.optin_date

  - dimension: unsub_date
    type: string
    sql: ${TABLE}.unsub_date

