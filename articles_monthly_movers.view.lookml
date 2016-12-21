- view: articles_monthly_movers
  sql_table_name: |
    (SELECT
        hits.page.pageTitle AS Article,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|search|feature|my)\/.+') AS Category,
        COUNT(hits.page.pagePath) AS VIEWS
      FROM
        FLATTEN(
          (SELECT
            *
          FROM
            (SELECT * FROM {% table_date_range date_filter 114668488.ga_sessions_ %},{% table_date_range date_filter 114668488.ga_sessions_intraday_ %})
          )
        , hits)
      WHERE REGEXP_MATCH(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|search|feature|my)\/.+') AND hits.type = 'PAGE'
      GROUP BY Article, Category
      ORDER BY VIEWS DESC
      LIMIT 50)
      
  fields:
  - filter: date_filter
    type: date
  - filter: Brand_filter 
    label: 'FILTER by BRAND'
    
  - measure: VIEWS
    type: sum
    sql: ${TABLE}.VIEWS
    
  - dimension: Article
    primary_key: true
    sql: ${TABLE}.Article
    
  - dimension: Category
    primary_key: true
    sql: ${TABLE}.Category
    