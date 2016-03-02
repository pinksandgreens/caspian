
- view: ced_launch_state_distinct
  derived_table:
    sql: |
      SELECT DISTINCT
      account_id, 
      launch_id, 
      list_id,
      campaign_id,
      campaign_name,
      launch_name,
      launch_status,
      launch_type,
      purpose,
      subject,
      description,
      marketing_strategy,
      marketing_program
      FROM responsys.ced_launch_state 

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: account_id
    type: number
    sql: ${TABLE}.account_id

  - dimension: launch_id
    type: number
    sql: ${TABLE}.launch_id

  - dimension: list_id
    type: number
    sql: ${TABLE}.list_id

  - dimension: campaign_name
    type: string
    sql: ${TABLE}.campaign_name

  - dimension: launch_name
    type: string
    sql: ${TABLE}.launch_name

  - dimension: launch_status
    type: string
    sql: ${TABLE}.launch_status

  - dimension: launch_type
    type: string
    sql: ${TABLE}.launch_type

  - dimension: purpose
    type: string
    sql: ${TABLE}.purpose

  - dimension: subject
    type: string
    sql: ${TABLE}.subject

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: marketing_strategy
    type: string
    sql: ${TABLE}.marketing_strategy

  - dimension: marketing_program
    type: string
    sql: ${TABLE}.marketing_program

  sets:
    detail:
      - account_id
      - launch_id
      - list_id
      - campaign_name
      - launch_name
      - launch_status
      - launch_type
      - purpose
      - subject
      - description
      - marketing_strategy
      - marketing_program

