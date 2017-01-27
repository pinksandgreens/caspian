- view: jr_lifestyle_parent_TP1
  label: Lifestyle
  derived_table: 
    sql: |
      SELECT
        REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        REGEXP_EXTRACT(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+') AS Section_Category
      FROM
        {% table_date_range jr_lifestyle_parent_TP1.TP1 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP1.TP1 114668488.ga_sessions_intraday_ %}
      WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} 
      AND hits.type = 'PAGE' 
      AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
      AND geoNetwork.country = 'United Kingdom'
      GROUP BY Key, Section_Category
  
  fields:
  
  - filter: TP1
    label: '1. Last Month'
    hidden: True
    type: date
    
  - filter: TP12
    label: '3. 13 Month ago'
    hidden: True
    type: date

  - filter: brand_filter 
    hidden: True
    label: 'Brand'
  
  - dimension: Key
    view_label: Content
    group_label: 'Article Dimensions'
    label: 'TP1 - Articles Viewed'
    primary_key: true
    sql: ${TABLE}.Key
    description: 'Article Results from user defined time period: 1'
    
  - dimension: Category
    view_label: Content
    group_label: 'Article Dimensions'
    label: 'Site Category'
    sql: ${TABLE}.Section_Category
    description: 'The site category - where on the site you will find the Article'