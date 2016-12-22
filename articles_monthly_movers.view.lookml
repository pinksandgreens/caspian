- view: articles_monthly_movers
  sql_table_name: |
      (SELECT
        COMPLETE_ARTICLE_RESULTS.1,
        COMPLETE_ARTICLE_RESULTS.3,
        COMPLETE_ARTICLE_RESULTS.4,
        COMPLETE_ARTICLE_RESULTS.6,
        COMPLETE_ARTICLE_RESULTS.2
      FROM
      
      (SELECT
        hits.page.pageTitle AS Article,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|search|feature|my)\/.+') AS Category,
        COUNT(hits.page.pagePath) AS VIEWS
      FROM
      
        FLATTEN(
          (SELECT
            *
          FROM
            (SELECT * FROM {% table_date_range V2_Period 114668488.ga_sessions_ %},{% table_date_range V2_Period 114668488.ga_sessions_intraday_ %})
          )
        , hits)
      WHERE REGEXP_MATCH(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|search|feature|my)\/.+') AND hits.type = 'PAGE'
      GROUP BY Article, Category) AS V2_Period
      
      LEFT OUTER JOIN
      
      (SELECT
        hits.page.pageTitle AS Article,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|search|feature|my)\/.+') AS Category,
        COUNT(hits.page.pagePath) AS VIEWS
      FROM
        FLATTEN(
          (SELECT
            *
          FROM
            (SELECT * FROM {% table_date_range V1_Period 114668488.ga_sessions_ %},{% table_date_range V1_Period 114668488.ga_sessions_intraday_ %})
          )
        , hits)
      WHERE REGEXP_MATCH(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|search|feature|my)\/.+') AND hits.type = 'PAGE'
      GROUP BY Article, Category) AS V1_Period
      
      ON Article.V2_Period = Article.V1_Period) AS COMPLETE_ARTICLE_RESULTS
      ORDER BY COMPLETE_ARTICLE_RESULTS.V2_Period.VIEWS DESC
      LIMIT 50)

  fields:
  - filter: V2_Period
    type: date
    
  - filter: V1_Period
    type: date

  - filter: Brand_filter 
    label: 'FILTER by BRAND'
    
  - measure: VIEWS_V2
    type: sum
    sql: ${TABLE}.COMPLETE_ARTICLE_RESULTS.3
    
  - measure: VIEWS_V1
    type: sum
    sql: ${TABLE}.COMPLETE_ARTICLE_RESULTS.6

  - dimension: Article_V2
    sql: ${TABLE}.COMPLETE_ARTICLE_RESULTS.1
    
  - dimension: Article_V1
    sql: ${TABLE}.COMPLETE_ARTICLE_RESULTS.4

  - dimension: Category
    sql: ${TABLE}.COMPLETE_ARTICLE_RESULTS.2
    