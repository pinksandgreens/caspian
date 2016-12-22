- view: articles_monthly_movers
  sql_table_name: |
      (SELECT
        V2_Period.Article,
        V2_Period.VIEWS,
        V1_Period.Article,
        V1_Period.VIEWS,
        V2_Period.Category
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
        ON V2_Period.Article = V1_Period.Article
      ORDER BY V2_Period.VIEWS DESC
      LIMIT 50)

  fields:
  - filter: V2_Period
    type: date
    
  - filter: V1_Period
    type: date

  - filter: Brand_filter 
    label: 'FILTER by BRAND'
    
  - dimension: Article_V2
    sql: ${TABLE}.V2_Period.Article
  
  - measure: VIEWS_V2
    type: sum
    sql: ${TABLE}.V2_Period.VIEWS
    
  - dimension: Article_V1
    sql: ${TABLE}.V1_Period.Article

  - measure: VIEWS_V1
    type: sum
    sql: ${TABLE}.V1_Period.VIEWS

  - dimension: Category_V2
    sql: ${TABLE}.V2_Period.Category
    