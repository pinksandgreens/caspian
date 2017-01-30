view: jr_lifestyle_queryString {
  label: "URL"

  derived_table: {
    sql: SELECT
        REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\?(.+)') AS queryString,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\#(.+)') AS urlFragment
      FROM
        TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"')
      WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %}
      AND hits.type = 'PAGE'
      AND geoNetwork.country = 'United Kingdom'
      GROUP BY Key, queryString, urlFragment
       ;;
  }

  dimension: Key {
    hidden: yes
    sql: ${TABLE}.Key ;;
  }

  dimension: queryString {
    view_label: "Content"
    group_label: "Misc"
    label: "Query String (?)"
    sql: ${TABLE}.queryString ;;
    description: "Query String parameters"
  }

  dimension: url_Fragment {
    view_label: "Content"
    group_label: "Misc"
    label: "Fragment (#)"
    sql: ${TABLE}.urlFragment ;;
    description: "URL fragment"
  }
}
