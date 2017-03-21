view: jr_lifestyle_users {
 label: "Lifestyle"

  derived_table: {
    sql: SELECT
          hits.hour AS hour_of_visit,
          EXACT_COUNT_DISTINCT(fullvisitorID) as UU_Count,
          REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key
        FROM
          {% table_date_range jr_lifestyle_parent_TP1.TP1 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP1.TP1 114668488.ga_sessions_intraday_ %}
        WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %}
        AND hits.type = 'PAGE' AND geoNetwork.country = 'United Kingdom' AND hits.hitNumber = 1
        AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
        GROUP BY hour_of_visit, key
        ORDER BY hour_of_visit ASC
    ;;
  }

  dimension: hour_of_visit {
    view_label: "Content"
    group_label: "Article Dimensions"
    label: "Hour of Session Start"
    type: number
    sql: ${TABLE}.hour_of_visit ;;
    description: ""
  }

  dimension: UU_Count {
    view_label: "Content"
    group_label: "Article Dimensions"
    label: "Unique Users"
    type: number
    sql: ${TABLE}.UU_Count ;;
    description: ""
  }

  dimension: Key {
    hidden: yes
    sql: ${TABLE}.Key ;;
  }

  measure: test {
    type: sum
    label: "Unique Users - All Content"
    sql: CASE
          WHEN ${TABLE}.hour_of_visit = 0 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 1 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 2 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 3 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 4 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 5 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 6 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 7 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 8 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 9 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 10 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 11 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 12 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 13 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 14 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 15 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 16 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 17 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 18 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 19 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 20 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 21 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 22 THEN ${TABLE}.UU_Count
          WHEN ${TABLE}.hour_of_visit = 23 THEN ${TABLE}.UU_Count
        END


          ;;
  }

  }
