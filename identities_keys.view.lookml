- view: identities_keys
  sql_table_name: publications.identities_keys
  fields:

  - dimension: idd_key_id
    hidden: FALSE
    type: number
    sql: ${TABLE}.idd_key_id

  - dimension_group: last_updated
    hidden: FALSE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated

  - dimension: type
    hidden: FALSE
    type: string
    sql: ${TABLE}.type

  - dimension: value
    hidden: FALSE
    type: string
    sql: ${TABLE}.value

  - measure: Unique_IDKEYS_Count
    hidden: FALSE
    type: count


