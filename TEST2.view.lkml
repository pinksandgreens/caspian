view: test2 {
  sql_table_name: (SELECT
      RegEXP_EXTRACT(pagePath, r'^\/(.+?)\/.+') AS Brand,
      REGEXP_EXTRACT(pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+') AS Section_Category,
      CASE
        WHEN pageTitle IS NULL THEN pagePath
      ELSE
        pageTitle
      END AS Article,
      pagePath,
      COUNT(REGEXP_EXTRACT(pagePath, r'^(\/[A-Za-z0-9\/-]+)')) AS VIEWS
    FROM
      FLATTEN(
        (SELECT
          hits.page.pagePath AS pagePath,
          hits.page.pageTitle AS pageTitle,
          hits.type
        FROM
          (TABLE_DATE_RANGE([114668488.ga_sessions_], TIMESTAMP('2016-12-01'),TIMESTAMP('2016-12-31')))
        )
      , hits)
    WHERE pageTitle = 'The Very Best Foundations For Dry Skin – And Some Makeup Tips!' AND {% condition Brand_filter %} RegEXP_EXTRACT(pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
    GROUP BY Article, Brand, Section_Category, pagePath)
     ;;

    filter: Brand_filter {
      label: "FILTER by BRAND"
    }

    dimension: Brand {
      sql: ${TABLE}.Brand ;;
    }

    dimension: Section_Category {
      sql: ${TABLE}.Section_Category ;;
    }

    dimension: Article {
      sql: ${TABLE}.Article ;;
    }

    measure: VIEWS {
      type: sum
      sql: ${TABLE}.VIEWS ;;
    }

    dimension: pagePath {
      sql: ${TABLE}.pagePath ;;
    }
  }
