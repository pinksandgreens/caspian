- view: jr_lifestyle_pageviews
  label: Lifestyle
  derived_table: 
    sql: |
      SELECT
        V2.Key AS Key1,
        V2.Views AS Views1,
        V1.Key AS Key2,
        V1.Views AS Views2
      FROM
      (SELECT
        REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        COUNT(REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') AS Views
      FROM
        FLATTEN(
          (SELECT
            hits.page.pagePath AS Key,
            hits.type
          FROM
            (SELECT * FROM {% table_date_range V2 114668488.ga_sessions_ %},{% table_date_range V2 114668488.ga_sessions_intraday_ %})
          )
        , hits)
      WHERE {% condition brand_filter %} RegEXP_EXTRACT(Key, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
      GROUP BY Key) AS V2
      LEFT OUTER JOIN
      (SELECT
        REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        COUNT(REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') AS Views
      FROM
        FLATTEN(
          (SELECT
            hits.page.pagePath AS Key,
            hits.type
          FROM
            (SELECT * FROM {% table_date_range V1 114668488.ga_sessions_ %},{% table_date_range V1 114668488.ga_sessions_intraday_ %})
          )
        , hits)
      WHERE {% condition brand_filter %} RegEXP_EXTRACT(Key, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
      GROUP BY Key) AS V1
      ON V2.Key = V1.Key
  
        
  fields:

  - filter: V2 
    label: '1st Time Period'
    hidden: True
    type: date
  
  
  - filter: V1 
    label: '2nd Time Period'
    hidden: True
    type: date
  
  
  - filter: brand_filter 
    hidden: True
    label: 'Brand'
  
    
  - dimension: Key1
    label: V2 Page Results
    primary_key: true
    sql: ${TABLE}.Key1
    hidden: TRUE
  
  - dimension: Key2
    label: V1 Page Results
    sql: ${TABLE}.Key2
    hidden: TRUE
    
  - measure: V2_Views
    label: 'V2 Views1'  
    type: sum
    sql: ${TABLE}.Views1
    
  - measure: V1_Views
    label: 'V1 Views1'  
    type: sum
    sql: ${TABLE}.Views2