- view: es_campaign_report
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
    label: 'Date Published'
    type: string
    sql: ${TABLE}.publish_date

  - dimension: short_url
    hidden: TRUE
    type: string
    sql: ${TABLE}.short_url

  - dimension: total_conversions
    type: string
    sql: ${TABLE}.total_conversions

  - dimension: total_shares
    type: number
    sql: ${TABLE}.total_shares

  - dimension: total_views
    type: number
    sql: ${TABLE}.total_views

  - measure: count
    type: count
    drill_fields: [name]

