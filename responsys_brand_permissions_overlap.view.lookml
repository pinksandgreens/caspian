- view: responsys_brand_permissions_overlap
  sql_table_name: responsys.responsys_brand_permissions_temp
  fields:

  - dimension: brandcode
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.brandcode LIKE '%campaign_brand%' THEN NULL
        WHEN ${TABLE}.brandcode LIKE '%BRANDCODE%' THEN NULL
        WHEN ${TABLE}.brandcode LIKE '%ABR%' THEN NULL
        ELSE ${TABLE}.brandcode
      END

  - dimension: email_address
    type: string
    hidden: TRUE
    sql: ${TABLE}.email_address

  - dimension: optin
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.optin = '6' THEN '0'
        ELSE ${TABLE}.optin
      END

  - measure: brand_optins
    label: 'Commercial/Marketing Optins'
    type: count_distinct
    sql: ${TABLE}.email_address
    filters:
      optin: '1'

