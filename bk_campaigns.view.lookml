- view: bk_campaigns
  sql_table_name: publications.bk_campaigns
  fields:

  - dimension: audience_id
    type: number
    sql: ${TABLE}.audience_id

  - dimension: audience_name
    type: string
    sql: ${TABLE}.audience_name

  - dimension: campaign_id
    type: number
    sql: ${TABLE}.campaign_id

  - dimension: campaign_name
    type: string
    sql: ${TABLE}.campaign_name

  - dimension: campaign_type
    type: string
    sql: ${TABLE}.campaign_type

  - dimension: campaing_state
    type: string
    sql: ${TABLE}.campaing_state

  - dimension_group: ddw_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_updated_date

  - dimension: device_type
    type: string
    sql: ${TABLE}.device_type

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_date

  - dimension: pacing_type
    type: string
    sql: ${TABLE}.pacing_type

  - dimension: recency
    type: number
    sql: ${TABLE}.recency

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_date

  - dimension: transfer_method
    type: string
    sql: ${TABLE}.transfer_method

  - measure: count
    type: count
    drill_fields: [campaign_name, audience_name]

