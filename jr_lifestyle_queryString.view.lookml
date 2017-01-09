- view: jr_lifestyle_queryString
  sql_table_name: |
      SELECT
        REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS pagePath,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\?(.+)') AS queryString
          FROM
            (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
      WHERE REGEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') = 'grazia' AND hits.type = 'PAGE'
      GROUP BY Article, queryString
      ORDER BY Article
      
  fields:
  
  - dimension: normalised_pagePath
    sql: ${TABLE}.pagePath
    
  - dimension: queryString
    sql: ${TABLE}.queryString