- view: jr_lifestyle_content_analysis
  sql_table_name: |
      (SELECT
        V2.Key AS Key,
        REGEXP_EXTRACT(V2.Key, r'^\/(.+?)\/.+') AS V2.Brand,
        REGEXP_EXTRACT(V2.Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+') AS V2.Section_Category,
        V2.Views,
        V1.Views,
        B.First_Viewed,
        B.Total_Views,
        B.Article_Age
      FROM
        (SELECT
          REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
          COUNT(REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)')) AS Views
        FROM
          FLATTEN(
            (SELECT
              hits.page.pagePath AS Key,
              hits.type
            FROM
              (SELECT * FROM {% table_date_range V2 114668488.ga_sessions_ %},{% table_date_range V2 114668488.ga_sessions_intraday_ %})
            )
          , hits)
        WHERE {% condition brand_filter %} RegEXP_EXTRACT(Key, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
        GROUP BY Key
        ) AS V2
        LEFT OUTER JOIN
        (SELECT
          REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
          COUNT(REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)')) AS Views
        FROM
          FLATTEN(
            (SELECT
              hits.page.pagePath AS Key,
              hits.type
            FROM
              (SELECT * FROM {% table_date_range V1 114668488.ga_sessions_ %},{% table_date_range V1 114668488.ga_sessions_intraday_ %})
            )
          , hits)
        WHERE {% condition brand_filter %} RegEXP_EXTRACT(Key, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
        GROUP BY Key
        ) AS V1
        ON V2.Key = V1.Key
        LEFT OUTER JOIN
        (SELECT
          REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
          COUNT(REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)')) AS Total_Views,
          MIN(date) AS First_Viewed,
          DATEDIFF(CURRENT_DATE(),MIN(date)) AS Article_Age
        FROM
          FLATTEN(
            (SELECT
              hits.page.pagePath AS Key,
              hits.type,
              date
            FROM
              (SELECT * FROM (TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"')))
            )
          , hits)
        WHERE {% condition brand_filter %} RegEXP_EXTRACT(Key, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
        GROUP BY Key) AS B
      ON V2.Key = B.Key
      ORDER BY V2.Views DESC)

  fields:
  - filter: V2
    label: 'Time Period (V2)'
    type: date
    
  - filter: V1
    label: 'Time Period (V1)'
    type: date

  - filter: brand_filter 
    label: 'Filter by Brand'
    
  - dimension: Brand
    label: 'Brand'
    sql: ${TABLE}.V2.Brand
  
  - dimension: Page
    label: 'Article'
    sql: ${TABLE}.Key
    
  - dimension: Age
    label: 'Article Age (in Days)'
    sql: ${TABLE}.B.Article_Age
  
  - measure: V2_Views
    label: 'V2 Views'  
    type: sum
    sql: ${TABLE}.V2.Views
    
  - measure: V1_Views
    label: 'V1 Views'
    type: sum
    sql: ${TABLE}.V1.Views

  - dimension: V2_Site_Category
    label: 'Site Section'
    sql: ${TABLE}.V2.Section_Category
    
  - measure: Variance
    label: '% MoM'
    type: number
    sql: ((${V2_Views} / ${V1_Views})-1)
    value_format: '0%'
    
  - measure: View_Delta
    label: 'MoM View Delta +/-'
    type: number
    sql: ${V2_Views} - ${V1_Views}
    
  - measure: V2_Views_vs_TotalViews
    label: '% Total'
    type: number
    sql: ${V2_Views} / ${Total_Views}
    value_format: '0%'
    
  - dimension: Article_Status
    label: 'Article Type'
    type: string
    sql: |
      CASE
        WHEN ${Age} <= 30 THEN 'New'
        WHEN ${Age} BETWEEN 31 AND 90 THEN 'Fresh'
        WHEN ${Age} BETWEEN 91 AND 182 THEN 'Mature'
        WHEN ${Age} > 182 THEN 'Vintage'
      END
  
  - dimension: First_Viewed
    label: 'Date First Viewed'
    type: date
    sql: ${TABLE}.B.First_Viewed
    
  - measure: Total_Views
    label: 'Lifetime Total'
    type: sum
    sql: ${TABLE}.B.Total_Views
    
  