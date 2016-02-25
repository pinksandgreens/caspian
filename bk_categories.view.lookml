- view: bk_categories
  derived_table:
    sql: |
      select
      a.user_id,
      a.category_id,
      a.category_count,
      a.category_last_modified,
      a.insert_date_time,
      b.gygia_id,
      b.bk_uuid,
      c.node_name,
      c.bk_size,
      c.vertical,
      c.fullpath,
      c.description
      from "publications"."bk_identity_categories" a
      left join "publications"."bk_swap_ids_gygia" b
      on b.bk_uuid = a.user_id
      left join "publications"."bk_taxonomy_categories" c
      on a.category_id = c.node_id
      group by 1,2,3,4,5,6,7,8,9,10,11,12
    sql_trigger_value: SELECT MAX(insert_date_time) FROM "publications"."bk_identity_categories"
    sortkeys: [insert_date_time]
    
  fields:

  - dimension: category_count
    type: number
    sql: ${TABLE}.category_count

  - dimension: category_id
    type: number
    sql: ${TABLE}.category_id

  - dimension_group: category_last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.category_last_modified

  - dimension_group: insert_date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.insert_date_time

  - dimension: user_id
    type: string
    sql: ${TABLE}.user_id
    
  - dimension: gygia_id
    type: string
    sql: ${TABLE}.gygia_id
    
  - dimension: bluekai_id
    type: string
    sql: ${TABLE}.bk_uuid
    
  - dimension: node_name
    type: string
    sql: ${TABLE}.node_name
    
  - dimension: bk_size
    type: number
    sql: ${TABLE}.bk_size
    
  - dimension: vertical
    type: string
    sql: ${TABLE}.vertical
    
  - dimension: full_path
    type: string
    sql: ${TABLE}.full_path
    
  - dimension: description
    type: string
    sql: ${TABLE}.description
    
  - dimension: bk_event
    type: string
    primary_key: true
    sql: concat(${TABLE}.user_id,${TABLE}.category_id)

  - measure: count
    type: count
    drill_fields: []

  - measure: total_categories_triggered
    type: count_distinct
    sql: concat(${TABLE}.user_id,${TABLE}.category_id)
    
  - measure: individuals_count
    type: count_distinct
    sql: ${TABLE}.bk_uuid
    
  - measure: total_category_occurances
    type: sum
    sql: ${TABLE}.category_count
    
  - measure: total_bk_size
    type: sum
    sql: ${TABLE}.bk_size
  
