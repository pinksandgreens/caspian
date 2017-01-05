- view: test2
  sql_table_name: |
      (SELECT
        RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') AS Brand,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+') AS Section_Category,
        CASE
          WHEN hits.page.pageTitle IS NULL THEN hits.page.pagePath
        ELSE
          hits.page.pageTitle
        END AS Article,
        hits.page.pagePath AS pagePath,
        COUNT(hits.page.pagePath) AS VIEWS
      FROM
        FLATTEN(
          (SELECT
            *
          FROM
            (TABLE_DATE_RANGE([114668488.ga_sessions_], TIMESTAMP('2016-12-01'),TIMESTAMP('2016-12-31')))
          )
        , hits)
      WHERE {% condition Brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
      GROUP BY Article, Brand, Section_Category, pagePath)

  fields:
  - filter: Brand_filter 
    label: 'FILTER by BRAND'
    
  - dimension: Brand
    sql: ${TABLE}.Brand
    
  - dimension: Section_Category
    sql: ${TABLE}.Section_Category
    
  - filter: Article
    type: string
    
  - measure: VIEWS
    type: sum
    sql: ${TABLE}.VIEWS
    
  - dimension: pagePath
    sql: ${TABLE}.pagePath
    