- view: identities_keys
  sql_table_name: publications.identities_keys
  fields:

  - dimension: idd_key_id
    type: number
    sql: ${TABLE}.idd_key_id

  - dimension_group: last_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension: value
    type: string
    sql: ${TABLE}.value

  - measure: count
    type: count
    drill_fields: []

