- view: lifestyle_content_analysisV2
  sql_table_name: |
      (SELECT
        V2_Period.hits.page.pagePath,
        REGEXP_EXTRACT(V2_Period.hits.page.pagePath, r'^\/(.+?)\/.+') V2_Period.Brand,
        REGEXP_EXTRACT(V2_Period.hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+') AS V2_Period.Section_Category,
        V2_Period.VIEWS,
        V1_Period.VIEWS,
        B.First_Viewed,
        B.Total_Views,
        B.Article_Age
        FROM
        (SELECT
          hits.page.pagePath,
          COUNT(hits.page.pagePath) AS VIEWS
        FROM
          FLATTEN(
            (SELECT
              REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS hits.page.pagePath,
              hits.type
            FROM
              (SELECT * FROM {% table_date_range V2_Period 114668488.ga_sessions_ %},{% table_date_range V2_Period 114668488.ga_sessions_intraday_ %})
            )
          , hits)
        WHERE {% condition Brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
        GROUP BY hits.page.pagePath) AS V2_Period
        LEFT OUTER JOIN
        (SELECT
          hits.page.pagePath,
          COUNT(hits.page.pagePath) AS VIEWS
        FROM
          FLATTEN(
            (SELECT
              REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS hits.page.pagePath
              hits.type
            FROM
              (SELECT * FROM {% table_date_range V1_Period 114668488.ga_sessions_ %},{% table_date_range V1_Period 114668488.ga_sessions_intraday_ %})
            )
          , hits)
        WHERE {% condition Brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
        GROUP BY hits.page.pagePath) AS V1_Period
        ON V2_Period.hits.page.pagePath = V1_Period.hits.page.pagePath
        LEFT OUTER JOIN
        (SELECT
          hits.page.pagePath,
          COUNT(hits.page.pagePath) AS Total_Views,
          MIN(date) AS First_Viewed,
          DATEDIFF(CURRENT_DATE(),MIN(date)) AS Article_Age
        FROM
          FLATTEN(
            (SELECT
              REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS hits.page.pagePath,
              hits.type
              date
            FROM
              (SELECT * FROM (TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"')))
            )
          , hits)
        WHERE {% condition Brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
        GROUP BY hits.page.pagePath) AS B
      ON V2_Period.hits.page.pagePath = B.hits.page.pagePath
      ORDER BY V2_Period.VIEWS DESC)

  fields:
  - filter: V2_Period
    type: date
    
  - filter: V1_Period
    type: date

  - filter: Brand_filter 
    label: 'FILTER by BRAND'
    
  - dimension: Brand
    sql: ${TABLE}.V2_Period.Brand
    
  - dimension: Age
    sql: ${TABLE}.B.Article_Age
  
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
    
  # Required for Article PageView Anomaly Investigation.
  - measure: V2_Views_vs_TotalViews
    type: number
    sql: ${VIEWS_V2} / ${Total_Views}
    value_format: '0%'
    
  - dimension: Article_Status
    type: string
    sql: |
      CASE
        WHEN ${Age} <= 30 THEN 'New'
        WHEN ${Age} BETWEEN 31 AND 90 THEN 'Fresh'
        WHEN ${Age} BETWEEN 91 AND 182 THEN 'Mature'
        WHEN ${Age} > 182 THEN 'Vintage'
      END
  
  - dimension: First_Viewed
    type: date
    sql: ${TABLE}.B.First_Viewed
    
  - measure: Total_Views
    type: sum
    sql: ${TABLE}.B.Total_Views
    
  - dimension: pagePath
    sql: ${TABLE}.V2_Period.Norm_pagePath
    