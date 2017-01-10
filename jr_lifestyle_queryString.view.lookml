- view: jr_lifestyle_queryString
  label: Lifestyle
  derived_table: 
    sql: |
      (SELECT
        REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\?(.+)') AS queryString,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\#(.+)') AS urlFragment
      FROM
        (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
      WHERE {% condition brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE'
      GROUP BY Key, queryString, urlFragment
      ORDER BY Key)
      
  fields:

  - filter: brand_filter
    hidden: true
    label: 'Filter by Brand (Grazia, Heat, Closer, Empire)'
  
  - dimension: Page
    primary_key: true
    hidden: TRUE
    sql: ${TABLE}.Key
    
  - dimension: queryString
    label: 'URL Query String'
    sql: ${TABLE}.queryString
    
  - dimension: url_Fragment
    label: 'URL Fragment'
    sql: ${TABLE}.urlFragment