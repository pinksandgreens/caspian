- view: mother_baby_competing_products_view
  sql_table_name: |
      (SELECT
        REPLACE(REPLACE(FULLBIGQUERYTABLERESULTS.PRODUCT,'/',''),'-',' '),
        COUNT(FULLBIGQUERYTABLERESULTS.PRODUCT) AS VIEWS
      FROM
        (SELECT
          fullVisitorId AS VisitorId, 
        FROM
          FLATTEN(
            (SELECT
              *
            FROM
              (SELECT * FROM {% table_date_range date_filter 8896222.ga_sessions_ %},{% table_date_range date_filter 8896222.ga_sessions_intraday_ %})
            )
          , hits)
        WHERE {% condition product_filter %} hits.page.pagePath {% endcondition %} AND geoNetwork.country = 'United Kingdom'// AND hits.type = 'EVENT'
        GROUP BY VisitorId
        ) AS BIGQUERYVISITORRESULTS
        
        JOIN
        
        (SELECT
          fullVisitorId AS VisitorId,
          REGEXP_EXTRACT(hits.page.pagePath, r'^www\.motherandbaby\.co\.uk(?:\/[A-Za-z0-9\+\-]+)?(?:\/[A-Za-z0-9\+\-]+)?(?:\/[A-Za-z0-9\+\-]+)?(\/[A-Za-z0-9\+\-]+)?') AS PRODUCT
        FROM
          FLATTEN(
            (SELECT
              *
            FROM
              (SELECT * FROM {% table_date_range date_filter 8896222.ga_sessions_ %},{% table_date_range date_filter 8896222.ga_sessions_intraday_ %})
            )
          , hits)
        WHERE REGEXP_EXTRACT(hits.page.pagePath, r'^www\.motherandbaby\.co\.uk(?:\/[A-Za-z0-9\+\-]+)?(?:\/[A-Za-z0-9\+\-]+)?(?:\/[A-Za-z0-9\+\-]+)?(\/[A-Za-z0-9\+\-]+)?') != 'www.motherandbaby.co.uk/' AND REGEXP_EXTRACT(hits.page.pagePath, r'^www\.motherandbaby\.co\.uk(?:\/[A-Za-z0-9\+\-]+)?(?:\/[A-Za-z0-9\+\-]+)?(?:\/[A-Za-z0-9\+\-]+)?(\/[A-Za-z0-9\+\-]+)?') != ''
        ) AS FULLBIGQUERYTABLERESULTS
      ON BIGQUERYVISITORRESULTS.VisitorId = FULLBIGQUERYTABLERESULTS.VisitorId
      GROUP BY FULLBIGQUERYTABLERESULTS.PRODUCT
      ORDER BY VIEWS desc
      LIMIT 50)

  fields:
  - filter: date_filter
    type: date
  # TABLE_DATE_RANGE([uplifted-light-89310:114668488.ga_sessions_],DATE_ADD(CURRENT_TIMESTAMP(), -1, 'YEAR'),CURRENT_TIMESTAMP())
  - filter: product_filter 
    label: 'FILTER by Product'
    
  - measure: VIEWS
    type: sum
    sql: ${TABLE}.VIEWS
    
  - dimension: PRODUCT
    primary_key: true
    sql: ${TABLE}.FULLBIGQUERYTABLERESULTS.PRODUCT


