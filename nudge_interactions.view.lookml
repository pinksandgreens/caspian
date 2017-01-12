- view: nudge_interactions
  sql_table_name: publications.nudge_interactions
  fields:

  - dimension: detail_source
    type: string
    sql: ${TABLE}.detail_source

  - dimension: individual_id
    type: number
    sql: ${TABLE}.individual_id
    
  - dimension: unique_table_id
    type: string
    primary_key: TRUE
    sql: ${TABLE}.source_key || ${TABLE}.individual_id

  - dimension: magazine_code
    type: string
    sql: ${TABLE}.magazine_code

  - dimension_group: response
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.response_date

  - dimension: response_value
    type: number
    sql: ${TABLE}.response_value

  - dimension: source
    type: string
    sql: ${TABLE}.source

  - dimension: source_key
    type: string
    sql: ${TABLE}.source_key

  - measure: count
    type: count
    drill_fields: []

