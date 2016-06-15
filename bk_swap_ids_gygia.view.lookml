- view: bk_swap_ids_gygia
  sql_table_name: publications.bk_swap_ids_gygia
  fields:

  - dimension: bk_uuid
    type: string
    sql: ${TABLE}.bk_uuid

  - dimension: gygia_id
    type: string
    sql: ${TABLE}.gygia_id

  - dimension_group: time_inserted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.time_inserted

  - measure: count
    type: count
    drill_fields: []

