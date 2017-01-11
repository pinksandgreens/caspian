- view: jr_lifestyle_parent_key2
  label: Lifestyle
  derived_table: 
    sql: |
      SELECT
        REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') AS Key
      FROM
        FLATTEN(
          (SELECT
            hits.page.pagePath AS Key,
            hits.type
          FROM
            (SELECT * FROM {% table_date_range jr_lifestyle_parent_key2.V1 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_key2.V1 114668488.ga_sessions_intraday_ %})
          )
        , hits)
      WHERE {% condition brand_filter %} RegEXP_EXTRACT(Key, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+') AND REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') IS NOT NULL AND REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') != ''
      GROUP BY Key
  
  fields:
  
  - filter: V1 
    label: '2nd Time Period'
    hidden: True
    type: date
  
  - filter: brand_filter 
    hidden: True
    label: 'Brand'
  
  - dimension: Key2
    label: 'V1 Page Results'
    sql: ${TABLE}.Key
