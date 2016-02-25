- view: nudge_email_history
  derived_table:
    sql: |
      select
      individual_id,
      email_address,
      brand,
      first_event_date,
      last_event_date,
      event_type,
      event_sub_type,
      commercial_list,
      total_occurrences,
      row_number() over (order by first_event_date asc) as id
      from "publications"."nudge_email_events_history"

    sql_trigger_value: SELECT MAX(last_event_date) FROM publications.nudge_email_events_history
    sortkeys: [id]

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

  - measure: count
    type: count
    drill_fields: []
    
  - measure: events_count
    type: count_distinct
    sql: ${row_number() over (order by first_event_date asc)}
    
  - measure: individuals_count
    type: count_distinct
    sql: ${email_address}

