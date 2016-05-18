- view: identities
  sql_table_name: publications.identities
  fields:

  - dimension: created_by
    type: string
    sql: ${TABLE}.created_by

  - dimension_group: date_created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: home_phone
    type: string
    sql: ${TABLE}.home_phone

  - dimension: idd_id
    primary_key: true
    type: number
    sql: ${TABLE}.idd_id

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: mobile_phone
    type: string
    sql: ${TABLE}.mobile_phone

  - dimension: postcode
    type: string
    sql: ${TABLE}.postcode

  - dimension: updated_by
    type: string
    sql: ${TABLE}.updated_by

  - dimension: work_phone
    type: string
    sql: ${TABLE}.work_phone

  - measure: count
    type: count
    drill_fields: []

