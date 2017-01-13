- view: jr_lifestyle_date_expressions
  label: Lifestyle.Date Calculations
  derived_table: 
    sql: |
      SELECT
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
      WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(Key, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
      GROUP BY Key
      
  fields:
  - dimension: Key
    primary_key: true
    sql: ${TABLE}.Key
    hidden: TRUE
    
  - dimension: 1st_Viewed
    sql: ${TABLE}.First_Viewed
  
  - measure: Views
    type: sum
    label: 'Total Views'  
    sql: ${TABLE}.Total_Views
    
  - dimension: Age
    label: 'Age'  
    sql: ${TABLE}.Article_Age
    
  - measure: TP1_Views_over_TotalViews
    label: '[TP1] % Total Views'
    type: number
    sql:  CASE
            WHEN ${Views} != 0 THEN ${jr_lifestyle_pageviews_TP1.Views} / ${Views}
          ELSE 0
          END
    value_format: '0%'
    
  - measure: TP2_Views_over_TotalViews
    label: '[TP2] % Total Views'
    type: number
    sql:  CASE
            WHEN ${Views} != 0 THEN ${jr_lifestyle_pageviews_TP2.Views} / ${Views}
          ELSE 0
          END
    value_format: '0%'
    
  - measure: TP1_Views_delta_TP2_Views
    label: 'View Delta '
    type: number
    sql:  (${jr_lifestyle_pageviews_TP1.Views} - ${jr_lifestyle_pageviews_TP2.Views})
    
  - measure: Percentage_Growth
    label: '% Growth'
    type: number
    sql:  CASE
            WHEN ${jr_lifestyle_pageviews_TP2.Views} = 0 THEN 1
          ELSE
            ((${jr_lifestyle_pageviews_TP1.Views} / ${jr_lifestyle_pageviews_TP2.Views})-1)
          END
    value_format: '0%'
    
  - measure: YoYPercentage_Growth
    label: 'YoY % Growth'
    type: number
    sql:  CASE
            WHEN ${jr_lifestyle_pageviews_TP12.Views} = 0 THEN 1
          ELSE
            ((${jr_lifestyle_pageviews_TP1.Views} / ${jr_lifestyle_pageviews_TP12.Views})-1)
          END
    value_format: '0%'
    
  - dimension: Article_Status
    view_label: 'Lifestyle'
    label: 'Article Type'
    type: string
    sql: |
      CASE
        WHEN ${Age} <= 30 THEN 'New'
        WHEN ${Age} BETWEEN 31 AND 90 THEN 'Fresh'
        WHEN ${Age} BETWEEN 91 AND 182 THEN 'Mature'
        WHEN ${Age} > 182 THEN 'Vintage'
      END