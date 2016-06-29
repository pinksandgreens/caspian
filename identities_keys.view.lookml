- view: identities_keys
  sql_table_name: publications.identities_keys
  fields:

  - dimension: idd_key_id
    hidden: TRUE
    type: number
    sql: ${TABLE}.idd_key_id

  - dimension_group: last_updated
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: type
    hidden: TRUE
    type: string
    sql: ${TABLE}.type

  - dimension: value
    hidden: TRUE
    type: string
    sql: ${TABLE}.value

  - measure: count
    hidden: TRUE
    type: count
    drill_fields: []

