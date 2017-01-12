- view: jr_lifestyle_referral_source_medium
  label: Lifestyle
  derived_table:
  sql: |
      SELECT
        REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        trafficSource.medium AS medium
      FROM
        (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
      WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND {% condition referral_Medium %} trafficSource.medium {% endcondition %} AND hits.type = 'PAGE'
      GROUP BY Key, trafficSource.medium
      ORDER BY Key, trafficSource.medium
      
  fields:

  - filter: brand_filter
    hidden: true
    label: 'Brand'
    
  - filter: referral_source_Medium_filter
    label: 'by Medium'
    view_label: Referral
  
  - dimension: Page
    hidden: true
    primary_key: true
    sql: ${TABLE}.Key
    
  - dimension: referral_source_Medium
    view_label: Referral
    label: 'Source by Medium'
    sql: ${TABLE}.medium
    
    