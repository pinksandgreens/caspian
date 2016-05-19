- view: ced_sent
  sql_table_name: responsys.ced_sent
  fields:

  - dimension: account_id
    type: number
    sql: ${TABLE}.account_id

  - dimension: campaign_id
    type: number
    sql: ${TABLE}.campaign_id

  - dimension: contact_info
    type: string
    sql: ${TABLE}.contact_info

  - dimension: customer_id
    type: string
    sql: ${TABLE}.customer_id

  - dimension: dynamic_content_signature_id
    type: number
    sql: ${TABLE}.dynamic_content_signature_id

  - dimension: email_address
    type: string
    sql: ${TABLE}.email_address

  - dimension: email_format
    type: string
    sql: ${TABLE}.email_format

  - dimension: email_isp
    type: string
    sql: ${TABLE}.email_isp

  - dimension_group: event_captured_dt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.event_captured_dt

  - dimension_group: event_stored_dt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.event_stored_dt

  - dimension: event_type_id
    type: number
    sql: ${TABLE}.event_type_id

  - dimension: launch_id
    type: number
    sql: ${TABLE}.launch_id

  - dimension: list_id
    type: number
    sql: ${TABLE}.list_id

  - dimension: message_size
    type: number
    sql: ${TABLE}.message_size

  - dimension: offer_signature_number_id
    type: number
    sql: ${TABLE}.offer_signature_number_id

  - dimension: riid
    type: number
    value_format_name: id
    sql: ${TABLE}.riid

  - dimension: segment_info
    type: string
    sql: ${TABLE}.segment_info

  - measure: count
    type: count
    drill_fields: []

