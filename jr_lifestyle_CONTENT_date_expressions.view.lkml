view: jr_lifestyle_date_expressions {
  label: "Lifestyle.Date Calculations"

  derived_table: {
    sql: SELECT
        REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        COUNT(REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)')) AS Total_Views,
        CONCAT(RIGHT(MIN(date),2),'-',SUBSTR(MIN(date),5,2),'-',LEFT(MIN(date),4)) AS First_Viewed,
        DATEDIFF(CURRENT_DATE(),MIN(date)) AS Article_Age
      FROM
        (SELECT
          hits.page.pagePath AS Key,
          hits.type,
          date
        FROM
          (TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
        WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %}
        AND hits.type = 'PAGE'
        AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
        AND geoNetwork.country = 'United Kingdom'
        )
      GROUP BY Key
       ;;
  }

  dimension: Key {
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.Key ;;
  }

  dimension: 1st_Viewed {
    view_label: "Content"
    group_label: "Article Measures"
    label: "First Viewed"
    type: string
    sql: ${TABLE}.First_Viewed ;;
    description: "The date when the Article was first viewed"
  }

  dimension: Views {
    view_label: "Content"
    group_label: "Article Measures"
    label: "Lifetime Views"
    type: number
    sql: ${TABLE}.Total_Views ;;
    description: "Total lifetime Article views"
  }

  dimension: Age {
    view_label: "Content"
    group_label: "Article Measures"
    label: "Age"
    sql: ${TABLE}.Article_Age ;;
    description: "Total Article age (in days)"
  }

  dimension: TP1_Views_over_TotalViews {
    view_label: "Content"
    group_label: "Article Measures"
    label: "% Lifetime Views - TP1"
    type: number
    sql: CASE WHEN ${Views} != 0 THEN ${jr_lifestyle_pageviews_TP1.Views} / ${Views} ELSE 0 END ;;
    value_format: "0%"
    description: "Article Views during user defined time period: 1 as a percentage of Article lifetime views"
  }

  dimension: TP2_Views_over_TotalViews {
    view_label: "Content"
    group_label: "Article Measures"
    label: "% Lifetime Views - TP2"
    type: number
    sql: CASE WHEN ${Views} != 0 THEN ${jr_lifestyle_pageviews_TP2.Views} / ${Views} ELSE 0 END ;;
    value_format: "0%"
    description: "Article Views during user defined time period: 2 as a percentage of Article lifetime views"
  }

  dimension: TP1_Views_delta_TP2_Views {
    view_label: "Content"
    group_label: "Article Measures"
    label: "*TP1 vs TP2: Views"
    type: number
    sql: (${jr_lifestyle_pageviews_TP1.Views} - ${jr_lifestyle_pageviews_TP2.Views}) ;;
    description: "Compare Article View Delta between user defined time period: 1 and 2"
  }

  dimension: Percentage_Growth {
    view_label: "Content"
    group_label: "Article Measures"
    label: "% TP1 vs TP2: Growth"
    type: number
    sql: CASE WHEN ${jr_lifestyle_pageviews_TP2.Views} = 0 THEN 1 ELSE ((${jr_lifestyle_pageviews_TP1.Views} / ${jr_lifestyle_pageviews_TP2.Views})-1) END ;;
    value_format: "0%"
    description: "Derive Article View Percentage Growth by comparing Views during user defined time period 1 to time period 2"
  }

  dimension: YoYPercentage_Growth {
    view_label: "Content"
    group_label: "Article Measures"
    label: "% YoY Growth"
    type: number
    sql: CASE WHEN ${jr_lifestyle_pageviews_TP12.Views} = 0 THEN 1 ELSE ((${jr_lifestyle_pageviews_TP1.Views} / ${jr_lifestyle_pageviews_TP12.Views})-1) END ;;
    value_format: "0%"
    description: "Derive Article View Percentage Growth by comparing Views during user defined time period 1 to the same time period last year"
  }

  dimension: Article_Status {
    view_label: "Content"
    group_label: "Article Dimensions"
    label: "Shelf Label"
    type: string
    sql: CASE
        WHEN ${Age} <= 30 THEN 'New'
        WHEN ${Age} BETWEEN 31 AND 90 THEN 'Fresh'
        WHEN ${Age} BETWEEN 91 AND 182 THEN 'Mature'
        WHEN ${Age} > 182 THEN 'Vintage'
      END
       ;;
    description: "Article Age (in Days) since Publication: <= 30: New|31-90: Fresh|91-182: Mature|183+: Vintage"
  }
}
