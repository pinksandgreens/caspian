- view: ga_sessions_lifestyle_crossover
  label: 'x: Brand Overlap'
  derived_table:
    sql: |
      SELECT
        fullVisitorId AS ga_sessions_full_visitor_id,
        group_concat(UNIQUE(hits.page.pagePathLevel1)) AS hits__page__page_path_level1
      FROM
        ( SELECT * FROM {% table_date_range ga_sessions.date_filter 114668488.ga_sessions_ %})
      GROUP BY 1
      ORDER BY 1 
      
    sql_trigger_value: SELECT FLOOR(EXTRACT(epoch from GETDATE()) / (6*60*60))
      
  fields:
  - filter: date_filter
    type: date
  # TABLE_DATE_RANGE([uplifted-light-89310:114668488.ga_sessions_],DATE_ADD(CURRENT_TIMESTAMP(), -1, 'YEAR'),CURRENT_TIMESTAMP())
  
  - dimension: ConcatID_PPath
    type: string
    sql: CONCAT(${TABLE}.ga_sessions_full_visitor_id,${TABLE}.hits__page__page_path_level1)

  - dimension: full_Visitor_Id
    type: string
    primary_key: true
    sql: ${TABLE}.ga_sessions_full_visitor_id
    
  - dimension: Brands_Visited
    type: string
    sql: ${TABLE}.hits__page__page_path_level1
 
  - dimension: Multibrand_Users
    type: string
    sql: |
      CASE 
        WHEN ((${TABLE}.hits__page__page_path_level1 LIKE '%closer%') AND (${TABLE}.hits__page__page_path_level1 LIKE'%grazia%') AND (${TABLE}.hits__page__page_path_level1 LIKE'%heat%')) THEN 'Closer/Grazia/Heat'
        WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%grazia%' AND ${TABLE}.hits__page__page_path_level1 LIKE'%closer%' THEN 'Closer/Grazia'
        WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%grazia%' AND ${TABLE}.hits__page__page_path_level1 LIKE'%heat%' THEN 'Heat/Grazia'
        WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%heat%' AND ${TABLE}.hits__page__page_path_level1 LIKE'%closer%' THEN 'Heat/Closer'
        WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%heat%' THEN 'Heat'
        WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%closer%' THEN 'Closer'
        WHEN ${TABLE}.hits__page__page_path_level1 LIKE '%grazia%' THEN 'Grazia'
        ELSE 'Non-Branded'
      END

    
  - measure: Unique_Users
    label: 'Unique Users'
    type: count_distinct
    sql: ${TABLE}.ga_sessions_full_visitor_id
    
  