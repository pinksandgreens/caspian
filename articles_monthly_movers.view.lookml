- view: articles_monthly_movers
  sql_table_name: |
      (SELECT
        V2_Period.Brand,
        V2_Period.Article_Age,
        V2_Period.Article,
        V2_Period.VIEWS,
        V1_Period.Article,
        V1_Period.VIEWS,
        V2_Period.Section_Category,
        V2_Period.First_Viewed,
        B.Total_Views
      FROM
        (SELECT
          RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') AS Brand,
          REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life)\/.+') AS Section_Category,
          hits.page.pageTitle AS Article,
          COUNT(hits.page.pagePath) AS VIEWS,
          MIN(date) AS First_Viewed,
          DATEDIFF(NOW(),MIN(date) AS Article_Age
        FROM
          FLATTEN(
            (SELECT
              *
            FROM
              (SELECT * FROM {% table_date_range V2_Period 114668488.ga_sessions_ %},{% table_date_range V2_Period 114668488.ga_sessions_intraday_ %})
            )
          , hits)
        # WHERE REGEXP_MATCH(hits.page.pagePath, r'^\/grazia\/(fashion|hair-beauty|diet-body|news-real-life|celebrity|magazine|contact|feature|my)\/.+') OR REGEXP_MATCH(hits.page.pagePath, r'^\/heat\/(celebrity|entertainment|fashion|hair-beauty|heat-radio)\/.+') OR REGEXP_MATCH(hits.page.pagePath, r'^\/heat\/(celebrity|entertainment|fashion|hair-beauty|heat-radio)\/.+') AND hits.type = 'PAGE'
          WHERE {% condition Brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE'
        GROUP BY Article, Brand, Section_Category) AS V2_Period
        LEFT OUTER JOIN
        (SELECT
          RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') AS Brand,
          REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life)\/.+') AS Section_Category,
          hits.page.pageTitle AS Article,
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
        WHERE {% condition Brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE'
        GROUP BY Article, Brand, Section_Category) AS V1_Period
        ON V2_Period.Article = V1_Period.Article
        LEFT OUTER JOIN
        (SELECT
          hits.page.pageTitle AS Article,
          COUNT(hits.page.pagePath) AS Total_Views
        FROM 
          (TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
        WHERE {% condition Brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE'
        GROUP BY Article
      ) AS B
      ON V2_Period.Article = B.Article
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
    
  - dimension: Brand
    sql: ${TABLE}.V2_Period.Brand
    
  - dimension: Age
    type: number
    sql: ${TABLE}.V2_Period.Article_Age
  
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

  - dimension: Section_Category_V2
    sql: ${TABLE}.V2_Period.Section_Category
    
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
        WHEN ${TABLE}.V1_Period.Article IS NULL THEN 'New'
        WHEN ${TABLE}.V2_Period.Article_Age < 91 THEN 'Fresh'
        WHEN ${TABLE}.V2_Period.Article_Age BETWEEN 91 AND 182 THEN 'Mature'
        WHEN ${TABLE}.V2_Period.Article_Age > 182 THEN 'Vintage'
      END
  
  - dimension: First_Viewed
    type: date
    sql: ${TABLE}.V2_Period.First_Viewed
    
  - dimension: Total_Views
    type: number
    sql: ${TABLE}.B.Total_Views