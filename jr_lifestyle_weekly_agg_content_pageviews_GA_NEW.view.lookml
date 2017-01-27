- view: jr_lifestyle_weekly_agg_content_pageviews_GA_NEW
  label: Lifestyle
  derived_table: 
    sql: |
        SELECT
          A.Key AS Key,
          A.Views AS Views,
          A.max_interval AS max_interval
        FROM
          (SELECT
            FIRST_VALUE(MASTER_LIST.Key) OVER(PARTITION BY MASTER_LIST.Key ORDER BY MASTER_LIST.interval_count DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Key,
            FIRST_VALUE(MASTER_LIST.Views) OVER(PARTITION BY MASTER_LIST.Key ORDER BY MASTER_LIST.interval_count DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Views,
            FIRST_VALUE(MASTER_LIST.interval_count) OVER(PARTITION BY MASTER_LIST.Key ORDER BY MASTER_LIST.interval_count DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_interval
          FROM
            (SELECT
              FIRST_VALUE(PARTITIONED_LIST.Key) OVER (PARTITION BY PARTITIONED_LIST.Key, PARTITIONED_LIST.partition_ID ORDER BY PARTITIONED_LIST.Key ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Key,
              COUNT(PARTITIONED_LIST.Key) OVER (PARTITION BY PARTITIONED_LIST.Key, PARTITIONED_LIST.partition_ID ORDER BY PARTITIONED_LIST.Key ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS interval_count,
              SUM(PARTITIONED_LIST.Views) OVER (PARTITION BY PARTITIONED_LIST.Key, PARTITIONED_LIST.partition_ID) AS Views
            FROM
              (SELECT
                INDEXED_LIST.Key AS Key,
                INDEXED_LIST.week_index AS week.index,
                INDEXED_LIST.Views AS Views,
                INDEXED_LIST.week_index - INDEXED_LIST.val AS partition_ID
              FROM
                (SELECT
                  ACTUAL_WEEKLY_ACTIVITY.Key AS Key,
                  ACTUAL_WEEKLY_ACTIVITY.week_index AS week_index,
                  ACTUAL_WEEKLY_ACTIVITY.Views AS Views,
                  ROW_NUMBER() OVER (PARTITION BY ACTUAL_WEEKLY_ACTIVITY.Key ORDER BY ACTUAL_WEEKLY_ACTIVITY.week_index) AS val
                FROM  
                  (SELECT
                    REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
                    INTEGER(CONCAT(LEFT(date,4),RIGHT(CONCAT('0',STRING(WEEK(date))),2))) AS week_index,
                    COUNT(REGEXP_EXTRACT(Key, r'^(\/[A-Za-z0-9\/-]+)')) AS Views
                  FROM
                    (SELECT
                      hits.page.pagePath AS Key,
                      hits.type,
                      date
                    FROM 
                      TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"')
                    WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} 
                    AND hits.type = 'PAGE' 
                    AND REGEXP_MATCH(hits.page.pagePath, r'^\/.+?\/(celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+')
                    AND geoNetwork.country = 'United Kingdom'
                    )
                    GROUP BY Key, week_index
                    ORDER BY Key, week_index ASC
                  ) AS ACTUAL_WEEKLY_ACTIVITY
                ) INDEXED_LIST
              ) PARTITIONED_LIST
            GROUP BY PARTITIONED_LIST.Key, PARTITIONED_LIST.partition_ID, PARTITIONED_LIST.Views
          ) AS MASTER_LIST
          GROUP BY MASTER_LIST.Key, MASTER_LIST.interval_count, MASTER_LIST.Views
          ) AS A
          GROUP BY Key, Views, max_interval
          ORDER BY Key, max_interval DESC
                    
            
        
  fields:

  - dimension: Key
    view_label: Content
    hidden: true
    sql: ${TABLE}.Key
    
  - dimension: Max_Consecutive_Weekly_Consumption_Interval
    type: number
    view_label: Content
    group_label: 'Article Measures'
    label: 'Max Interval'
    sql: ${TABLE}.max_interval
    description: 'Derive the maximum interval of consecutive weekly Article views'
    
  - dimension: Max_Interval_Total_Views
    type: number
    view_label: Content
    group_label: 'Article Measures'
    label: 'Max Interval: Total Views'
    sql: ${TABLE}.Views
    description: 'Derive total Article view count during the maximum interval of consecutive weekly views'
    
  - dimension: Article_Type2
    type: string
    view_label: Content
    group_label: 'Article Dimensions'
    label: 'Content Code'
    sql: |
        CASE 
          WHEN ${TABLE}.max_interval BETWEEN 1 AND 3 THEN 'Viral'
          WHEN ${TABLE}.max_interval BETWEEN 4 AND 12 THEN 'Seasonal'
        ELSE 
          'Evergreen'
        END
    description: 'Derive Article type in context to: (i) Viral (Short period [1-3 consecutive weeks] of Content Consumption and Overall Site Contribution). (ii) Seasonal (Medium period [4-12 consecutive weeks] of Content Consumption and Site Contribution). (iii) Evergreen (Long Term period [13+ consecutive weekls] of Content Consumption and Site Contribution).'
        
  - dimension: Interval_Views_VS_Total_Views
    type: number
    view_label: Content
    label: '% Lifetime Views (Max Interval)'
    group_label: 'Article Measures'
    sql: ${Max_Interval_Total_Views} / ${jr_lifestyle_date_expressions.Views}
    value_format: '0%'
    description: 'Derive maximum interval Article view count as a percentage of total lifetime Article views'
    