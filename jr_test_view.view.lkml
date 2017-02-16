view: jr_test_view {
  derived_table: {
    sql: SELECT
        hits.page.pagePath AS Key,

      FROM

        IF({% condition jr_lifestyle_parent_TP1.brand_filter %} 'grazia' {% endcondition %},
        (SELECT
          hits.page.pagePath
        FROM
          {% table_date_range jr_lifestyle_parent_TP1.TP1 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP1.TP1 114668488.ga_sessions_intraday_ %}
        WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %}
        AND hits.type = 'PAGE'
        AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
        AND geoNetwork.country = 'United Kingdom'
        GROUP BY Key, Section_Category
        ),
        hits.page.pagePath = 'FAIL'
        )
        LIMIT 1
       ;;
  }
}
