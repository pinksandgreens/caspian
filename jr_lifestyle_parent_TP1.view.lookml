- view: jr_lifestyle_parent_TP1
  label: Lifestyle
  derived_table: 
    sql: |
      SELECT
        REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        REGEXP_EXTRACT(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+') AS Section_Category
      FROM
        FLATTEN(
          (SELECT
            hits.page.pagePath AS Key,
            hits.type
          FROM
            (SELECT * FROM {% table_date_range jr_lifestyle_parent_TP1.TP1 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP1.TP1 114668488.ga_sessions_intraday_ %})
          )
        , hits)
      WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(Key, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
      GROUP BY Key, Section_Category
  
  fields:
  
  - filter: TP1
    label: '1st Time Period'
    hidden: True
    type: date
    
  - filter: TP12
    label: 'YoY Period'
    hidden: True
    type: date

  - filter: brand_filter 
    hidden: True
    label: 'Brand'
  
  - dimension: Key
    label: 'TP1: Articles'
    primary_key: true
    sql: ${TABLE}.Key
    
  - dimension: Category
    label: 'Site Category'
    sql: ${TABLE}.Section_Category