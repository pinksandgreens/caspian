- view: jr_lifestyle_parent_key1
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
            (SELECT * FROM {% table_date_range jr_lifestyle_parent_key1.V2 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_key1.V2 114668488.ga_sessions_intraday_ %})
          )
        , hits)
      WHERE {% condition brand_filter %} RegEXP_EXTRACT(Key, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
      GROUP BY Key
  
  fields:
  
  - filter: V2 
    label: '1st Time Period'
    hidden: True
    type: date

  - filter: brand_filter 
    hidden: True
    label: 'Brand'
  
  - dimension: Key1
    label: 'V2 Page Results'
    primary_key: true
    sql: ${TABLE}.Key