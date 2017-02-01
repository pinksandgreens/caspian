view: jr_lifestyle_pagetitle {
  label: "Lifestyle"

  derived_table: {
    sql: SELECT
        REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        hits.page.pageTitle AS pageTitle
      FROM
        TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"')
      WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %}
      AND hits.type = 'PAGE'
      AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
      AND hits.page.pageTitle IS NOT NULL
      AND geoNetwork.country = 'United Kingdom'
      GROUP BY Key, pageTitle
       ;;
  }

  dimension: Key {
    hidden: yes
    sql: ${TABLE}.Key ;;
  }

  dimension: pageTitle {
    view_label: "Content"
    group_label: "Article Dimensions"
    label: "Title"
    type: string
    sql: ${TABLE}.pageTitle ;;
    description: "The title of the Article"
  }
}
