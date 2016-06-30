- view: es_campaign_report
  label: 'Campaign Report(s)'
  sql_table_name: looker_scratch.es_campaign_report
  fields:

  - dimension: created_by
    hidden: TRUE
    type: string
    sql: ${TABLE}.created_by

  - dimension: external_ref
    label: 'External Reference'
    hidden: TRUE
    type: string
    sql: ${TABLE}.external_ref

  - dimension: master
    hidden: TRUE
    type: string
    sql: ${TABLE}.master

  - dimension: name
    label: 'Competition Name'
    type: string
    sql: ${TABLE}.name

  - dimension: name1
    label: 'Competition Reference'
    type: string
    sql: ${TABLE}.name1

  - dimension: publish_date
    label: 'Competition Published'
    type: time
    timeframes: [date, week, month]
    sql: |
     TO_DATE (${TABLE}.publish_date, 'DD-MM-YYYY')
      
      
  - dimension: short_url
    hidden: TRUE
    type: string
    sql: ${TABLE}.short_url

  - dimension: total_conversions      ############ HIDDEN ###############
    hidden: TRUE
    type: string
    sql: ${TABLE}.total_conversions

  - dimension: total_shares         ############ HIDDEN ###############
    hidden: TRUE
    type: number
    sql: ${TABLE}.total_shares

  - dimension: total_views
    type: number
    sql: ${TABLE}.total_views
    
    # Can't set these 3 as integers, might be because they're strings in the DB?

  - measure: count
    hidden: TRUE
    type: count
    drill_fields: [name]

