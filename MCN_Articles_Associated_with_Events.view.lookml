- view: mcn_most_popular_articles_by_content_consumption
  sql_table_name: |
      ( SELECT
        FULLBIGQUERYTABLERESULTS.pageTitle,
        COUNT(FULLBIGQUERYTABLERESULTS.pageTitle) AS VIEWS
      FROM
        (SELECT
          fullVisitorId AS VisitorId,
        FROM
          FLATTEN(
            (SELECT
              *
            FROM
              (SELECT * FROM {% table_date_range date_filter 22661559.ga_sessions_ %},{% table_date_range date_filter 22661559.ga_sessions_intraday_ %})
            )
          , hits)
        WHERE hits.eventInfo.eventLabel LIKE '%sportsbikeshop%'
        GROUP BY VisitorId)
        AS BIGQUERYVISITORRESULTS
      JOIN
        (SELECT
          fullVisitorId AS VisitorId, 
          hits.page.pageTitle AS pageTitle
        FROM
          FLATTEN(
            (SELECT
              *
            FROM
              (SELECT * FROM {% table_date_range date_filter 22661559.ga_sessions_ %},{% table_date_range date_filter 22661559.ga_sessions_intraday_ %})
            )
          , hits)
        WHERE REGEXP_MATCH(hits.page.pagePath, r'^.+\/((?:news|sport|product-reviews|bike-reviews|new-rider|insurance)\/.+(?:[A-Za-z0-9\+\-]+))[\/]+default.aspx') AND geoNetwork.country = 'United Kingdom' AND hits.type = 'PAGE'
        ) AS FULLBIGQUERYTABLERESULTS
        ON BIGQUERYVISITORRESULTS.VisitorId = FULLBIGQUERYTABLERESULTS.VisitorId
      GROUP BY FULLBIGQUERYTABLERESULTS.pageTitle
      ORDER BY VIEWS DESC
      LIMIT 500)
    
  fields:
  - filter: date_filter
    type: date
  
  - measure: VIEWS
    type: sum
    sql: ${TABLE}.VIEWS
    
  - dimension: ARTICLES
    # primary_key: true
    sql: ${TABLE}.FULLBIGQUERYTABLERESULTS.pageTitle