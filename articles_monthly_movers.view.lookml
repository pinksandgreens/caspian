- view: articles_monthly_movers
  sql_table_name: |
      (SELECT
        V2_Period.Article,
        V2_Period.VIEWS,
        V1_Period.Article,
        V1_Period.VIEWS,
        V2_Period.Category,
        V2_Period.First_Viewed
      FROM
        (SELECT
          hits.page.pageTitle AS Article,
          REGEXP_EXTRACT(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|feature|my)\/.+') AS Category,
          COUNT(hits.page.pagePath) AS VIEWS,
          MIN(date) AS First_Viewed
        FROM
          FLATTEN(
            (SELECT
              *
            FROM
              (SELECT * FROM {% table_date_range V2_Period 114668488.ga_sessions_ %},{% table_date_range V2_Period 114668488.ga_sessions_intraday_ %})
            )
          , hits)
        WHERE REGEXP_MATCH(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|feature|my)\/.+') AND hits.type = 'PAGE'
        GROUP BY Article, Category) AS V2_Period
        LEFT OUTER JOIN
        (SELECT
          hits.page.pageTitle AS Article,
          REGEXP_EXTRACT(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|feature|my)\/.+') AS Category,
          COUNT(hits.page.pagePath) AS VIEWS,
          MIN(date) AS First_Viewed
        FROM
          FLATTEN(
            (SELECT
              *
            FROM
              (SELECT * FROM {% table_date_range V1_Period 114668488.ga_sessions_ %},{% table_date_range V1_Period 114668488.ga_sessions_intraday_ %})
            )
          , hits)
        WHERE REGEXP_MATCH(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|feature|my)\/.+') AND hits.type = 'PAGE'
        GROUP BY Article, Category) AS V1_Period
        ON V2_Period.Article = V1_Period.Article
      ORDER BY V2_Period.VIEWS DESC)

  fields:
  - filter: V2_Period
    type: date
    
  - filter: V1_Period
    type: date

  - filter: Brand_filter 
    label: 'FILTER by BRAND'
    
  - filter: Article
    type: string
    
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
    
  - measure: Variance
    type: number
    sql: ((${VIEWS_V2} / ${VIEWS_V1})-1)
    value_format: '0%'
    
  - measure: View_Delta
    type: number
    sql: ${VIEWS_V2} - ${VIEWS_V1}
    
  - dimension: Article_Status
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.V1_Period.Article IS NULL THEN 'NEW'
        ELSE 'LIVE'
      END
  - dimension: First_Viewed
    type: date
    sql: ${TABLE}.V2_Period.First_Viewed
    
    