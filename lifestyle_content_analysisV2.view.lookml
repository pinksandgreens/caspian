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
          REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS hits.page.pagePath,
          COUNT(REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)')) AS VIEWS
        FROM
          FLATTEN(
            (SELECT
              hits.page.pagePath,
              hits.type
            FROM
              (SELECT * FROM {% table_date_range V2_Period 114668488.ga_sessions_ %},{% table_date_range V2_Period 114668488.ga_sessions_intraday_ %})
            )
          , hits)
        WHERE {% condition Brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
        GROUP BY hits.page.pagePath) AS V2_Period
        LEFT OUTER JOIN
        (SELECT
          REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS hits.page.pagePath,
          COUNT(REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)')) AS VIEWS
        FROM
          FLATTEN(
            (SELECT
              hits.page.pagePath,
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
          REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS hits.page.pagePath,
          COUNT(REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)')) AS Total_Views,
          MIN(date) AS First_Viewed,
          DATEDIFF(CURRENT_DATE(),MIN(date)) AS Article_Age
        FROM
          FLATTEN(
            (SELECT
              hits.page.pagePath,
              hits.type,
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
  
  - measure: VIEWS_V2
    type: sum
    sql: ${TABLE}.V2_Period.VIEWS
    
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
    sql: ${TABLE}.V2_Period.hits.page.pagePath
    
    
#   SELECT
# B.Article AS Article,
# B.QueryString AS QueryString,
# FIRST(B.Monthly_Views_History) AS Monthly_Views_History
# FROM
#   (SELECT
#     A.Article AS Article,
#     A.QueryString AS QueryString,
#     GROUP_CONCAT(CONCAT(STRING(A.month_index),':',STRING(A.Article_Views)), '|') OVER
#     (PARTITION BY A.Article
#     ORDER BY A.month_index ASC
#     ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Monthly_Views_History
#     FROM
#       (SELECT
#         Distinct_Article_Template.Article AS Article,
#         Distinct_Article_Template.QueryString AS QueryString,
#         Distinct_Article_Template.month_index AS Month_Index,
#         IF(Actual_Article_Views_by_Month.Value IS NULL, 0, Actual_Article_Views_by_Month.Value) AS Article_Views
#       FROM
#         (SELECT
#           Distinct_Articles.Article AS Article,
#           Distinct_Articles.QueryString AS QueryString,
#           Month_Calendar_Table.month_index AS month_index
#           -- Month_Calendar_Table.VIEWS AS Views
#           FROM  
#             (SELECT
#               REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Article,
#               REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\?(.+)') AS QueryString
#             FROM
#               (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
#             WHERE REGEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') = 'grazia' AND hits.type = 'PAGE'
#             GROUP BY Article, QueryString
#             ORDER BY Article
#             ) AS Distinct_Articles
#           CROSS JOIN
#             (SELECT
#               month_index,
#               FROM
#               (SELECT 201501 AS month_index),(SELECT 201502 AS month_index),(SELECT 201503 AS month_index),(SELECT 201504 AS month_index),(SELECT 201505 AS month_index),(SELECT 201506 AS month_index),(SELECT 201507 AS month_index),(SELECT 201508 AS month_index),(SELECT 201509 AS month_index),(SELECT 201510 AS month_index),(SELECT 201511 AS month_index),(SELECT 201512 AS month_index),
#               (SELECT 201601 AS month_index),(SELECT 201602 AS month_index),(SELECT 201603 AS month_index),(SELECT 201604 AS month_index),(SELECT 201605 AS month_index),(SELECT 201606 AS month_index),(SELECT 201607 AS month_index),(SELECT 201608 AS month_index),(SELECT 201609 AS month_index),(SELECT 201610 AS month_index),(SELECT 201611 AS month_index),(SELECT 201612 AS month_index),
#               (SELECT 201701 AS month_index),(SELECT 201702 AS month_index),(SELECT 201703 AS month_index),(SELECT 201704 AS month_index),(SELECT 201705 AS month_index),(SELECT 201706 AS month_index),(SELECT 201707 AS month_index),(SELECT 201708 AS month_index),(SELECT 201709 AS month_index),(SELECT 201710 AS month_index),(SELECT 201711 AS month_index),(SELECT 201712 AS month_index),
#               (SELECT 201801 AS month_index),(SELECT 201802 AS month_index),(SELECT 201803 AS month_index),(SELECT 201804 AS month_index),(SELECT 201805 AS month_index),(SELECT 201806 AS month_index),(SELECT 201807 AS month_index),(SELECT 201808 AS month_index),(SELECT 201809 AS month_index),(SELECT 201810 AS month_index),(SELECT 201811 AS month_index),(SELECT 201812 AS month_index),
#               (SELECT 201901 AS month_index),(SELECT 201902 AS month_index),(SELECT 201903 AS month_index),(SELECT 201904 AS month_index),(SELECT 201905 AS month_index),(SELECT 201906 AS month_index),(SELECT 201907 AS month_index),(SELECT 201908 AS month_index),(SELECT 201909 AS month_index),(SELECT 201910 AS month_index),(SELECT 201911 AS month_index),(SELECT 201912 AS month_index)
#               ORDER BY month_index
#             ) AS Month_Calendar_Table
#           ) AS Distinct_Article_Template
#         LEFT OUTER JOIN
#           (SELECT
#           REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Article,
#           INTEGER(LEFT(date,6)) AS month_index,
#           COUNT(LEFT(date,6)) AS value,
#           FROM
#           (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
#           WHERE REGEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') = 'grazia' AND hits.type = 'PAGE'
#           GROUP BY Article, month_index
#           ORDER BY Article, month_index
#           ) AS Actual_Article_Views_by_Month
#       ON Distinct_Article_Template.Article = Actual_Article_Views_by_Month.Article AND Distinct_Article_Template.month_index = Actual_Article_Views_by_Month.month_index
#       ) AS A
#     ) AS B
#   GROUP BY Article, QueryString
#   ORDER BY Article