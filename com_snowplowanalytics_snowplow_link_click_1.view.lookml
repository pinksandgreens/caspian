- view: snowplow_clicks
  sql_table_name: snowplow.com_snowplowanalytics_snowplow_link_click_1
  fields:

  - dimension: element_classes
    type: string
    sql: ${TABLE}.element_classes

  - dimension: element_id
    hidden: TRUE
    type: string
    sql: ${TABLE}.element_id

  - dimension: element_target
    hidden: TRUE
    type: string
    sql: ${TABLE}.element_target

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
    primary_key: true
    sql: ${TABLE}.root_id

  - dimension_group: root_tstamp
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

  - dimension: target_url
    type: string
    sql: ${TABLE}.target_url

  - measure: count
    label: 'Clicks Count'
    type: count
    drill_fields: [schema_name]

