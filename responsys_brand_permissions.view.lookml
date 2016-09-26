- view: responsys_brand_permissions
  sql_table_name: responsys.responsys_brand_permissions_temp
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
    sql: |
      CASE
        WHEN ${TABLE}.optin = '6' THEN '0'
        ELSE ${TABLE}.optin
      END

  - dimension: optin_date
    type: string
    sql: ${TABLE}.optin_date

  - dimension: unsub_date
    type: string
    sql: ${TABLE}.unsub_date

  - measure: brand_optins
    type: count_distinct
    sql: ${TABLE}.email_address
    filters:
      optin: '1'
