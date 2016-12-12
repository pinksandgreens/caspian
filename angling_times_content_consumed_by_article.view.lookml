- view: angling_times_content_consumed_by_article
  sql_table_name: |
        (SELECT
          ARTICLEOUTPUT.ARTICLE,
          COUNT(ARTICLEOUTPUT.ARTICLE) AS VIEWS
        FROM
          (SELECT 
            REGEXP_EXTRACT(FULLBIGQUERYTABLERESULTS.pagePath, r'^.+\/(?:articles\/)([A-Za-z0-9\+\-]+)') AS ARTICLE
          FROM
            (SELECT
              fullVisitorId AS VisitorId, 
            FROM
              FLATTEN(
                (SELECT
                  *
                FROM
                  (SELECT * FROM {% table_date_range date_filter 120878053.ga_sessions_ %},{% table_date_range date_filter 120878053.ga_sessions_intraday_ %})
                )
              , hits)
            WHERE {% condition article_filter %} hits.page.pagePath {% endcondition %} AND geoNetwork.country = 'United Kingdom' AND hits.type = 'PAGE'
            GROUP BY VisitorId
            ) AS BIGQUERYVISITORRESULTS
          JOIN
            (SELECT
              fullVisitorId AS VisitorId, 
              hits.page.pagePath AS pagePath 
            FROM
              FLATTEN(
                (SELECT
                  *
                FROM
                  (SELECT * FROM {% table_date_range date_filter 120878053.ga_sessions_ %},{% table_date_range date_filter 120878053.ga_sessions_intraday_ %})
                )
              , hits)
            WHERE (hits.page.pagePath LIKE '%/articles/%' AND geoNetwork.country = 'United Kingdom' AND hits.type = 'PAGE'
            ) AS FULLBIGQUERYTABLERESULTS
          ON BIGQUERYVISITORRESULTS.VisitorId = FULLBIGQUERYTABLERESULTS.VisitorId
        ) AS ARTICLEOUTPUT
        GROUP BY ARTICLEOUTPUT.ARTICLE
        ORDER BY VIEWS DESC
        LIMIT 50)

  fields:
  - filter: date_filter
    type: date
  
  - filter: article_filter 
    label: 'FILTER by ARTICLE'
    
  - measure: VIEWS
    type: sum
    sql: ${TABLE}.VIEWS
    
  - dimension: ARTICLE
    # primary_key: true
    sql: ${TABLE}.ARTICLEOUTPUT.ARTICLE


