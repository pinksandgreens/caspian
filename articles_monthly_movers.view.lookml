- view: articles_monthly_movers
  sql_table_name: |
      (SELECT
        COMPLETE_ARTICLE_RESULTS.Article_V2,
        COMPLETE_ARTICLE_RESULTS.VIEWS_V2,
        COMPLETE_ARTICLE_RESULTS.Article_V1,
        COMPLETE_ARTICLE_RESULTS.VIEW_V1,
        COMPLETE_ARTICLE_RESULTS.Category_V2
      FROM
      
      (SELECT
        hits.page.pageTitle AS Article_V2,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|search|feature|my)\/.+') AS Category_V2,
        COUNT(hits.page.pagePath) AS VIEWS_V2
      FROM
      
        FLATTEN(
          (SELECT
            *
          FROM
            (SELECT * FROM {% table_date_range V2_Period 114668488.ga_sessions_ %},{% table_date_range V2_Period 114668488.ga_sessions_intraday_ %})
          )
        , hits)
      WHERE REGEXP_MATCH(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|search|feature|my)\/.+') AND hits.type = 'PAGE'
      GROUP BY Article_V2, Category_V2) AS V2_Period
      
      LEFT OUTER JOIN
      
      (SELECT
        hits.page.pageTitle AS Article_V1,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|search|feature|my)\/.+') AS Category_V1,
        COUNT(hits.page.pagePath) AS VIEWS_V1
      FROM
        FLATTEN(
          (SELECT
            *
          FROM
            (SELECT * FROM {% table_date_range V1_Period 114668488.ga_sessions_ %},{% table_date_range V1_Period 114668488.ga_sessions_intraday_ %})
          )
        , hits)
      WHERE REGEXP_MATCH(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|search|feature|my)\/.+') AND hits.type = 'PAGE'
      GROUP BY Article_V1, Category_V1) AS V1_Period
      
      ON V2_Period.Article_V2 = V1_Period.Article_V1) AS COMPLETE_ARTICLE_RESULTS
      
      
      ORDER BY COMPLETE_ARTICLE_RESULTS.VIEWS_V2 DESC
      LIMIT 50)

  fields:
  - filter: V2_Period
    type: date
    
  - filter: V1_Period
    type: date

  - filter: Brand_filter 
    label: 'FILTER by BRAND'
    
  - dimension: Article_V2
    sql: ${TABLE}.COMPLETE_ARTICLE_RESULTS.Article_V2
  
  - measure: VIEWS_V2
    type: sum
    sql: ${TABLE}.COMPLETE_ARTICLE_RESULTS.VIEWS_V2
    
  - dimension: Article_V1
    sql: ${TABLE}.COMPLETE_ARTICLE_RESULTS.Article_V1

  - measure: VIEWS_V1
    type: sum
    sql: ${TABLE}.COMPLETE_ARTICLE_RESULTS.VIEWS_V1

  - dimension: Category_V2
    sql: ${TABLE}.COMPLETE_ARTICLE_RESULTS.Category_V2
    