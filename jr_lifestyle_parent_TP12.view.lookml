- view: jr_lifestyle_parent_TP12
  label: Lifestyle
  derived_table: 
    sql: |
      SELECT
        REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+') AS Section_Category
      FROM 
        {% table_date_range jr_lifestyle_parent_TP1.TP12 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP1.TP12 114668488.ga_sessions_intraday_ %}
      WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
      GROUP BY Key, Section_Category
  
  fields:
    
  - dimension: Key
    view_label: Content
    group_label: 'Article Dimensions'
    label: 'TP_13 - Articles Viewed'
    primary_key: true
    sql: ${TABLE}.Key
    description: 'Article Results using the same user defined time period (TP): 1 for last year'