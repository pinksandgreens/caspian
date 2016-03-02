



- view: responsys_email_history
  derived_table:
    sql: |
      select
      c.event_captured_dt email_event_timestamp,
      c.event_type,
      c.campaign_id,
      e.campaign_name,
      e.launch_name,
      e.launch_status,
      e.launch_type,
      e.purpose,
      e.subject,
      e.description,
      e.marketing_strategy,
      e.marketing_program,
      c.riid,
      d.email_address,
      row_number() over (order by c.event_captured_dt asc) as id
      from
      
      ( ${responsys_email_history_detail.SQL_TABLE_NAME} ) c
      
      left join
      responsys.ced_sent d
      on c.riid = d.riid
      
      left join responsys.ced_launch_state e
      on concat(c.account_id,c.launch_id) = concat(e.account_id,e.launch_id)
      
      group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14
    
    sql_trigger_value: SELECT MAX(email_event_timestamp) FROM responsys.ced_sent
    sortkeys: [email_event_timestamp]

  fields:

  - dimension: campaign_id
    type: number
    sql: ${TABLE}.campaign_id

  - dimension: event_type
    type: string
    sql: ${TABLE}.event_type

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

  - dimension_group: event_captured_dt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.event_captured_dt

  - dimension: campaign_name
    type: string
    sql: ${TABLE}.campaign_name

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: launch_name
    type: string
    sql: ${TABLE}.launch_name

  - dimension: launch_status
    type: string
    sql: ${TABLE}.launch_status

  - dimension: launch_type
    type: string
    sql: ${TABLE}.launch_type

  - dimension: marketing_program
    type: string
    sql: ${TABLE}.marketing_program

  - dimension: marketing_strategy
    type: string
    sql: ${TABLE}.marketing_strategy

  - dimension: purpose
    type: string
    sql: ${TABLE}.purpose

  - dimension: subject
    type: string
    sql: ${TABLE}.subject

  - dimension: riid
    type: number
    value_format_name: id
    sql: ${TABLE}.riid
    
  - dimension: event_id
    type: number
    primary_key: true
    sql: ${TABLE}.id

  - measure: count
    type: count
    drill_fields: []
    
  - measure: events_count
    type: count_distinct
    sql: ${row_number() over (order by event_captured_dt asc)}
    
  - measure: individuals_count
    type: count_distinct
    sql: ${email_address}

