- view: identities
  sql_table_name: publications.identities
  fields:

  - dimension: created_by
    hidden: TRUE
    type: string
    sql: ${TABLE}.created_by

  - dimension_group: date_created
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created

  - dimension: email
    hidden: TRUE
    type: string
    sql: ${TABLE}.email

  - dimension: home_phone
    hidden: TRUE
    type: string
    sql: ${TABLE}.home_phone

  - dimension: idd_id
    hidden: TRUE
    primary_key: true
    type: number
    sql: ${TABLE}.idd_id

  - dimension_group: last_updated
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: mobile_phone
    hidden: TRUE
    type: string
    sql: ${TABLE}.mobile_phone

  - dimension: postcode
    hidden: TRUE
    type: string
    sql: ${TABLE}.postcode

  - dimension: updated_by
    hidden: TRUE
    type: string
    sql: ${TABLE}.updated_by

  - dimension: work_phone
    hidden: TRUE
    type: string
    sql: ${TABLE}.work_phone

  - measure: count
    hidden: TRUE
    type: count
    drill_fields: []

