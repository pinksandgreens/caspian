- view: test2
  sql_table_name: |
      (SELECT
        RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') AS Brand,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+') AS Section_Category,
        hits.page.pageTitle AS Article,
        COUNT(hits.page.pagePath) AS VIEWS
      FROM
        FLATTEN(
          (SELECT
            *
          FROM
            (TABLE_DATE_RANGE([114668488.ga_sessions_], TIMESTAMP('2016-12-01'),TIMESTAMP('2016-12-31')))
          )
        , hits)
      WHERE {% condition Brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND hits.page.pageTitle IS NOT NULL AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
      GROUP BY Article, Brand, Section_Category)

  fields:
  - filter: Brand_filter 
    label: 'FILTER by BRAND'