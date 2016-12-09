- view: mother_baby_competing_products_view
  sql_table_name: |
      ( SELECT
        PRODUCT_OUTPUT.PRODUCT,
        COUNT(PRODUCT_OUTPUT.PRODUCT) AS VIEWS
      FROM
        (SELECT
          fullVisitorId AS VisitorId, 
        FROM
          FLATTEN(
            (SELECT
              *
            FROM
              (SELECT * FROM (TABLE_DATE_RANGE([8896222.ga_sessions_],TIMESTAMP(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -89, 'DAY')),TIMESTAMP(DATE_ADD(DATE_ADD(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -89, 'DAY'), 90, 'DAY'),-1, 'SECOND')))),
                (TABLE_DATE_RANGE([8896222.ga_sessions_intraday_],TIMESTAMP(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -89, 'DAY')),TIMESTAMP(DATE_ADD(DATE_ADD(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -89, 'DAY'), 90, 'DAY'),-1, 'SECOND')))))
            )
          , hits)
        WHERE {% condition product_filter %} hits.page.pagePath {% endcondition %} AND geoNetwork.country = 'United Kingdom' AND hits.type = 'PAGE'
        GROUP BY VisitorId
        ) AS BIGQUERYVISITORRESULTS
        
        JOIN
        
        (SELECT
          REGEXP_EXTRACT(hits.page.pagePath, r'^www\.motherandbaby\.co\.uk(?:\/[A-Za-z0-9\+\-]+)?(?:\/[A-Za-z0-9\+\-]+)?(?:\/[A-Za-z0-9\+\-]+)?(\/[A-Za-z0-9\+\-]+)?') AS PRODUCT,
          fullVisitorId AS VisitorId
          FROM
            FLATTEN(
              (SELECT
                *
              FROM
                (SELECT * FROM (TABLE_DATE_RANGE([8896222.ga_sessions_],TIMESTAMP(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -89, 'DAY')),TIMESTAMP(DATE_ADD(DATE_ADD(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -89, 'DAY'), 90, 'DAY'),-1, 'SECOND')))),
                (TABLE_DATE_RANGE([8896222.ga_sessions_intraday_],TIMESTAMP(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -89, 'DAY')),TIMESTAMP(DATE_ADD(DATE_ADD(DATE_ADD(TIMESTAMP(CONCAT(CURRENT_DATE(), ' 00:00:00')), -89, 'DAY'), 90, 'DAY'),-1, 'SECOND')))))
              )
            , hits)
          WHERE hits.eventInfo.eventCategory LIKE '%link%' AND hits.page.pagePath != 'www.motherandbaby.co.uk/' AND REGEXP_EXTRACT(hits.page.pagePath, r'^www\.motherandbaby\.co\.uk(?:\/[A-Za-z0-9\+\-]+)?(?:\/[A-Za-z0-9\+\-]+)?(?:\/[A-Za-z0-9\+\-]+)?(\/[A-Za-z0-9\+\-]+)?') != ''
        ) AS FULLBIGQUERYTABLERESULTS
        ON BIGQUERYVISITORRESULTS.VisitorId = FULLBIGQUERYTABLERESULTS.VisitorId
      ) AS PRODUCT_OUTPUT
      GROUP BY FULLBIGQUERYTABLERESULTS.PRODUCT
      ORDER BY VIEWS
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
    sql: ${TABLE}.PRODUCT_OUTPUT.PRODUCT


