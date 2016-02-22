- view: nudge_email_events_history
  sql_table_name: publications.nudge_email_events_history
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: commercial_list
    type: string
    sql: ${TABLE}.commercial_list

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

  - dimension: event_sub_type
    type: string
    sql: ${TABLE}.event_sub_type

  - dimension: event_type
    type: string
    sql: ${TABLE}.event_type

  - dimension_group: first_event
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.first_event_date

  - dimension: individual_id
    type: number
    sql: ${TABLE}.individual_id

  - dimension_group: last_event
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.last_event_date

  - dimension: total_occurrences
    type: number
    sql: ${TABLE}.total_occurrences

  - measure: count_events
    type: count
    drill_fields: []
    
  - measure: count_individuals
    type: count_distinct
    sql: ${individual_id}

