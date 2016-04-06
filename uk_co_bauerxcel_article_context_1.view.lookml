- view: article_context
  sql_table_name: snowplow.uk_co_bauerxcel_article_context_1
  fields:

  - dimension: author
    type: string
    sql: ${TABLE}.author

  - dimension_group: published
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.published_date

  - dimension: ref_parent
    type: string
    sql: ${TABLE}.ref_parent

  - dimension: ref_root
    type: string
    sql: ${TABLE}.ref_root

  - dimension: ref_tree
    type: string
    sql: ${TABLE}.ref_tree

  - dimension: root_id
    type: string
    sql: ${TABLE}.root_id

  - dimension_group: root_tstamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.root_tstamp

  - dimension: schema_format
    type: string
    sql: ${TABLE}.schema_format

  - dimension: schema_name
    type: string
    sql: ${TABLE}.schema_name

  - dimension: schema_vendor
    type: string
    sql: ${TABLE}.schema_vendor

  - dimension: schema_version
    type: string
    sql: ${TABLE}.schema_version

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - measure: count
    type: count
    drill_fields: [schema_name]

