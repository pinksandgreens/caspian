- view: jr_lifestyle_pagetitle
  label: Lifestyle
  derived_table: 
    sql: |
      SELECT
        Key,
        pageTitle
      FROM
        (SELECT
          Key,
          FIRST_VALUE(pageTitle) OVER(PARTITION BY Key ORDER BY index DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS pageTitle 
        FROM
          (SELECT
            REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
            hits.page.pageTitle AS pageTitle,
            MAX(date) AS index
          FROM
            (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
          WHERE RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') = 'grazia' AND hits.type = 'PAGE'
          GROUP BY Key, pageTitle
          )
        )
      GROUP BY Key, pageTitle
      
  fields:

  - filter: brand_filter
    hidden: true
    label: 'Brand'
  
  - dimension: Key
    primary_key: true
    hidden: TRUE
    sql: ${TABLE}.Key
    
  - dimension: pageTitle
    label: 'Article Title'
    sql: ${TABLE}.pageTitle