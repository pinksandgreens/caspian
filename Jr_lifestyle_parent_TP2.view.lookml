- view: jr_lifestyle_parent_TP2
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
            (SELECT * FROM {% table_date_range jr_lifestyle_parent_TP2.TP2 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP2.TP2 114668488.ga_sessions_intraday_ %})
          )
        , hits)
      WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(Key, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
      GROUP BY Key
  
  fields:
  
  - filter: TP2 
    label: '2. 2 Months Ago'
    hidden: True
    type: date

  - dimension: Key
    view_label: Lifestyle
    group_label: 'Article Dimensions'
    label: 'TP2 - Articles Viewed'
    sql: ${TABLE}.Key
    description: 'Article Results from user defined time period: 2'