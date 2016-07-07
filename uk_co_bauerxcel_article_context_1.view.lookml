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
    hidden: TRUE
    type: string
    sql: ${TABLE}.ref_parent

  - dimension: ref_root
    hidden: TRUE
    type: string
    sql: ${TABLE}.ref_root

  - dimension: ref_tree
    hidden: TRUE
    type: string
    sql: ${TABLE}.ref_tree

  - dimension: root_id
    hidden: TRUE
    type: string
    sql: ${TABLE}.root_id

  - dimension_group: root_tstamp
    hidden: TRUE
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.root_tstamp

  - dimension: schema_format
    hidden: TRUE
    type: string
    sql: ${TABLE}.schema_format

  - dimension: schema_name
    hidden: TRUE
    type: string
    sql: ${TABLE}.schema_name

  - dimension: schema_vendor
    hidden: TRUE
    type: string
    sql: ${TABLE}.schema_vendor

  - dimension: schema_version
    hidden: TRUE
    type: string
    sql: ${TABLE}.schema_version

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - measure: count
    hidden: TRUE
    type: count
    drill_fields: [schema_name]
    
  - measure: articles_count
    type: count_distinct
    sql: ${TABLE}.title

