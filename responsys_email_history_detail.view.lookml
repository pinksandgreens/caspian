- view: responsys_email_history_detail
  derived_table:
    sql: |
       select
            event_type_id,
            account_id,
            list_id,
            riid,
            customer_id,
            event_captured_dt,
            event_stored_dt,
            campaign_id,
            launch_id,
            email_format,
            'sent' as event_type
            from responsys.ced_sent
      
          UNION ALL
            select
            event_type_id,
            account_id,
            list_id,
            riid,
            customer_id,
            event_captured_dt,
            event_stored_dt,
            campaign_id,
            launch_id,
            email_format,
            'clicked' as event_type
            from responsys.ced_clicked
            
                  
          UNION ALL
            select
            event_type_id,
            account_id,
            list_id,
            riid,
            customer_id,
            event_captured_dt,
            event_stored_dt,
            campaign_id,
            launch_id,
            email_format,
            'opened' as event_type
            from responsys.ced_opened
            
    sql_trigger_value: SELECT DATE(CURRENT_TIMESTAMP - interval '4 hour')
    sortkeys: [event_captured_dt]

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: event_type_id
    type: number
    sql: ${TABLE}.event_type_id

  - dimension: account_id
    type: number
    sql: ${TABLE}.account_id

  - dimension: list_id
    type: number
    sql: ${TABLE}.list_id

  - dimension: riid
    type: number
    sql: ${TABLE}.riid

  - dimension: customer_id
    type: string
    sql: ${TABLE}.customer_id

  - dimension_group: event_captured_dt
    type: time
    sql: ${TABLE}.event_captured_dt

  - dimension_group: event_stored_dt
    type: time
    sql: ${TABLE}.event_stored_dt

  - dimension: campaign_id
    type: number
    sql: ${TABLE}.campaign_id

  - dimension: launch_id
    type: number
    sql: ${TABLE}.launch_id

  - dimension: email_format
    type: string
    sql: ${TABLE}.email_format

  - dimension: event_type
    type: string
    sql: ${TABLE}.event_type

  sets:
    detail:
      - event_type_id
      - account_id
      - list_id
      - riid
      - customer_id
      - event_captured_dt_time
      - event_stored_dt_time
      - campaign_id
      - launch_id
      - email_format
      - event_type

