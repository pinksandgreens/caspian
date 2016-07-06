- view: bk_identity_categories
  sql_table_name: publications.bk_identity_categories
  fields:

  - dimension: category_count
    label: 'Category Count'
    type: number
    sql: ${TABLE}.category_count

  - dimension: category_id
    label: 'Category ID'
    type: number
    sql: ${TABLE}.category_id

  - dimension_group: category_last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.category_last_modified

  - dimension_group: insert_date
    label: 'Insert'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.insert_date_time

  - dimension: user_id
    type: string
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: []

