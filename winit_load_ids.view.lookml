- view: winit_load_ids
  sql_table_name: publications.winit_load_ids
  fields:

  - dimension: par_individual_id
    type: number
    sql: ${TABLE}.par_individual_id

  - measure: count
    type: count
    drill_fields: []

