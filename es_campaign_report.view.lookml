- view: es_campaign_report
  sql_table_name: looker_scratch.es_campaign_report
  fields:

  - dimension: created_by
    type: string
    sql: ${TABLE}.created_by

  - dimension: external_ref
    type: string
    sql: ${TABLE}.external_ref

  - dimension: master
    type: string
    sql: ${TABLE}.master

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: name1
    type: string
    sql: ${TABLE}.name1

  - dimension: publish_date
    type: string
    sql: ${TABLE}.publish_date

  - dimension: short_url
    type: string
    sql: ${TABLE}.short_url

  - dimension: total_conversions
    type: string
    sql: ${TABLE}.total_conversions

  - dimension: total_shares
    type: string
    sql: ${TABLE}.total_shares

  - dimension: total_views
    type: string
    sql: ${TABLE}.total_views

  - measure: count
    type: count
    drill_fields: [name]

