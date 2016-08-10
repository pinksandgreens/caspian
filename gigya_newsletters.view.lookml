- view: gigya_newsletters
  label: '2d) Newsletter Optin'
  sql_table_name: publications.gigya_newsletters
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension_group: ddw_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_updated_date

  - dimension: gigya_id
    type: string
    sql: ${TABLE}.gigya_id

  - dimension: optin
    type: yesno
    sql: ${TABLE}.optin

  - dimension_group: optin_subscribe
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.optin_subscribe_date

  - dimension_group: optin_unsubscribe
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.optin_unsubscribe_date

