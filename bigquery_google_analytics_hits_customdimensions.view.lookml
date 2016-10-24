- view: bigquery_google_analytics_hits_customdimensions
  sql_table_name: publications.bigquery_google_analytics_hits_customdimensions
  fields:

  - dimension: fullvisitorid
    hidden: TRUE
    type: string
    primary_key: TRUE
    sql: ${TABLE}.fullvisitorid

  - dimension_group: import
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.import_date

  - dimension: index
    type: number
    sql: ${TABLE}.index

  - dimension: value
    type: string
    sql: ${TABLE}.value

  - dimension: visitid
    hidden: TRUE
    type: number
    value_format_name: id
    sql: ${TABLE}.visitid

  - dimension: visitnumber
    hidden: TRUE
    type: number
    sql: ${TABLE}.visitnumber

