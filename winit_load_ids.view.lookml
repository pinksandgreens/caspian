- view: winit_load_ids
  sql_table_name: publications.winit_load_ids
  fields:

  - dimension: par_individual_id
    type: number
    sql: ${TABLE}.par_individual_id

  - measure: WINIT_count
    type: count_distinct
    sql: ${TABLE}.par_individual_id


