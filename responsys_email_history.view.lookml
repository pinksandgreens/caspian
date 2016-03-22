


# - explore: ced_launch_state_distincts
- view: responsys_email_history
  derived_table:
    sql: |
          select
          a.date,
          a.account_id,
          a.campaign_id,
          a.launch_id,
          a.events_count,
          a.event_type,
          b.campaign_name,
          b.launch_name,
          b.subject,
          b.marketing_strategy,
          b.marketing_program,
          b.launch_started_dt
          
          from
          
          ((select
          to_char(event_captured_dt,'YYYY-MM-DD') as date,
          account_id,
          campaign_id,
          launch_id,
          count(distinct riid) events_count,
          'sent' as event_type
          from responsys.ced_sent
          where event_captured_dt > current_date - 7
          group by 1,2,3,4,6)
          
          UNION
          (select
          to_char(event_captured_dt,'YYYY-MM-DD') as date,
          account_id,
          campaign_id,
          launch_id,
          count(distinct riid) events_count,
          'clicked' as event_type
          from responsys.ced_clicked
          where event_captured_dt > current_date - 7
          group by 1,2,3,4,6)
          
          UNION
          (select
          to_char(event_captured_dt,'YYYY-MM-DD') as date,
          account_id,
          campaign_id,
          launch_id,
          count(distinct riid) events_count,
          'opened' as event_type
          from responsys.ced_opened
          where event_captured_dt > current_date - 7
          group by 1,2,3,4,6)) a
          
          left join responsys.ced_launch_state b
          on a.account_id = b.account_id and a.launch_id = b.launch_id
          
          group by 1,2,3,4,5,6,7,8,9,10,11,12

      
    
    #sql_trigger_value: SELECT DATE(CURRENT_TIMESTAMP - interval '4 hour')
    #sortkeys: [email_event_timestamp]


#       row_number() over (order by c.event_captured_dt asc) as id


  fields:

  - dimension: campaign_id
    type: number
    sql: ${TABLE}.campaign_id

  - dimension: event_type
    type: string
    sql: ${TABLE}.event_type

  - dimension_group: event_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date

  - dimension_group: launch_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.launch_started_dt

  - dimension: campaign_name
    type: string
    sql: ${TABLE}.campaign_name

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: launch_name
    type: string
    sql: ${TABLE}.launch_name

  - dimension: marketing_program
    type: string
    sql: ${TABLE}.marketing_program

  - dimension: marketing_strategy
    type: string
    sql: ${TABLE}.marketing_strategy

  - dimension: subject
    type: string
    sql: ${TABLE}.subject

  - measure: count
    type: count
    drill_fields: []

  - measure: events_count
    type: sum
    sql: ${TABLE}.events_count
