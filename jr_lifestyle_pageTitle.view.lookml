- view: jr_lifestyle_pagetitle
  sql_table_name: |
      (SELECT
        REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        hits.page.pageTitle AS pageTitle
      FROM
        (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
      WHERE {% condition brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE'
      GROUP BY Key, pageTitle
      ORDER BY Key)
      
  fields:
  - filter: brand_filter 
    label: 'Filter by Brand (Grazia, Heat, Closer, Empire)'
  
  - dimension: Page
    sql: ${TABLE}.Key
    
  - dimension: pageTitle
    sql: ${TABLE}.pageTitle