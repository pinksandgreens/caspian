- view: ced_launch_state
  sql_table_name: responsys.ced_launch_state
  fields:

  - dimension: account_id
    type: number
    sql: ${TABLE}.account_id

  - dimension: campaign_id
    type: number
    sql: ${TABLE}.campaign_id

  - dimension: campaign_name
    type: string
    sql: ${TABLE}.campaign_name

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension_group: event_captured_dt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.event_captured_dt

  - dimension_group: event_stored_dt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.event_stored_dt

  - dimension: external_campaign_id
    type: string
    sql: ${TABLE}.external_campaign_id

  - dimension: launch_charset
    type: string
    sql: ${TABLE}.launch_charset

  - dimension_group: launch_completed_dt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.launch_completed_dt

  - dimension: launch_error_code
    type: string
    sql: ${TABLE}.launch_error_code

  - dimension: launch_id
    type: number
    sql: ${TABLE}.launch_id

  - dimension: launch_name
    type: string
    sql: ${TABLE}.launch_name

  - dimension_group: launch_started_dt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.launch_started_dt

  - dimension: launch_status
    type: string
    sql: ${TABLE}.launch_status

  - dimension: launch_type
    type: string
    sql: ${TABLE}.launch_type

  - dimension: list_id
    type: number
    sql: ${TABLE}.list_id

  - dimension: marketing_program
    type: string
    sql: ${TABLE}.marketing_program

  - dimension: marketing_strategy
    type: string
    sql: ${TABLE}.marketing_strategy

  - dimension: product_category
    type: string
    sql: ${TABLE}.product_category

  - dimension: product_type
    type: string
    sql: ${TABLE}.product_type

  - dimension: purpose
    type: string
    sql: ${TABLE}.purpose

  - dimension: sf_campaign_id
    type: string
    sql: ${TABLE}.sf_campaign_id

  - dimension: subject
    type: string
    sql: ${TABLE}.subject

  - measure: count
    type: count
    drill_fields: [campaign_name, launch_name]

