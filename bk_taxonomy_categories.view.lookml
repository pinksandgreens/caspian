#- explore: bk_taxonomy_categories
- view: bk_taxonomy_categories
  sql_table_name: publications.bk_taxonomy_categories
  fields:

  - dimension: bk_size
    type: number
    sql: ${TABLE}.bk_size

  - dimension_group: ddw_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_updated_date

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: fullpath
    type: string
    sql: ${TABLE}.fullpath

  - dimension: leaf_node
    type: yesno
    sql: ${TABLE}.leaf_node

  - dimension: node_id
    type: number
    sql: ${TABLE}.node_id

  - dimension: node_name
    type: string
    sql: ${TABLE}.node_name

  - dimension: parent_node_id
    type: number
    sql: ${TABLE}.parent_node_id

  - dimension: vertical
    type: string
    sql: ${TABLE}.vertical

  - measure: count
    type: count
    drill_fields: [node_name]
    
  - measure: bk_size_number
    type: number
    sql: ${bk_size}
  
  - measure: bk_size_count
    type: number
    sql: AVG(${bk_size})

   

