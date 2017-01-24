- view: jr_lifestyle_pagetitle
  label: Lifestyle
  derived_table: 
    sql: |
      SELECT
        Key,
        pageTitle
      FROM
        (SELECT
          Key,
          FIRST_VALUE(pageTitle) OVER(PARTITION BY Key ORDER BY index DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS pageTitle 
        FROM
          (SELECT
            REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
            hits.page.pageTitle AS pageTitle,
            MAX(date) AS index
          FROM
            (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
          WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(Key, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE' AND REGEXP_MATCH(Key, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
          GROUP BY Key, pageTitle
          )
        )
      GROUP BY Key, pageTitle
      
  fields:

  - dimension: Key
    hidden: TRUE
    sql: ${TABLE}.Key
    
  - dimension: pageTitle
    view_label: Lifestyle
    group_label: 'Article Dimensions'
    label: 'Title'
    type: string
    sql: ${TABLE}.pageTitle
    description: 'The title of the Article'