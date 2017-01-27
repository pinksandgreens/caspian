- view: jr_lifestyle_pageviews_TP12
  label: Lifestyle
  derived_table: 
    sql: |
        SELECT
          REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
          COUNT(REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)')) AS Views
        FROM 
        {% table_date_range jr_lifestyle_parent_TP1.TP12 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP1.TP12 114668488.ga_sessions_intraday_ %}
        WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %}
        AND hits.type = 'PAGE' 
        AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
        AND geoNetwork.country = 'United Kingdom'
        GROUP BY Key
  
  fields:
  - dimension: Key
    sql: ${TABLE}.Key
    hidden: TRUE
  
  - dimension: Views
    view_label: Content
    group_label: 'Article Measures'
    label: '*TP_13 - Views'  
    type: number
    sql: ${TABLE}.Views
    description: 'Article Results for same period (TP1) last year'