- view: jr_lifestyle_weekly_agg_content_pageviews_GA_NEW
  label: Lifestyle
  derived_table: 
    sql: |
        (SELECT
        B.Key AS Key,
        FIRST(B.weekly_views) AS weekly_views
        FROM
          (SELECT
            A.Key AS Key,
            GROUP_CONCAT(CONCAT(A.week_index,':',STRING(A.Key_Views)), '|') OVER (PARTITION BY A.Key ORDER BY A.index ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS weekly_views
          FROM
            (SELECT
              Distinct_Key_Template.Key AS Key,
              Distinct_Key_Template.week_index AS week_index,
              IF(Actual_Key_Views_by_Month.Value IS NULL, 0, Actual_Key_Views_by_Month.Value) AS Key_Views,
              Distinct_Key_Template.index AS index
            FROM
              (SELECT
                Distinct_Keys.Key AS Key,
                Week_Calendar_Table.week_index AS week_index,
                Week_Calendar_Table.index AS index
              FROM  
                (SELECT
                  REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key
                FROM
                  (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
                WHERE RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') = 'grazia' AND hits.type = 'PAGE'
                GROUP BY Key
                ) AS Distinct_Keys
              CROSS JOIN
                (SELECT
                  week_index,
                  ROW_NUMBER() OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS index
                FROM
                (SELECT '2015-1' AS week_index),(SELECT '2015-2' AS week_index),(SELECT '2015-3' AS week_index),(SELECT '2015-4' AS week_index),(SELECT '2015-5' AS week_index),(SELECT '2015-6' AS week_index),(SELECT '2015-7' AS week_index),(SELECT '2015-8' AS week_index),(SELECT '2015-9' AS week_index),(SELECT '2015-10' AS week_index),(SELECT '2015-11' AS week_index),(SELECT '2015-12' AS week_index),(SELECT '2015-13' AS week_index),(SELECT '2015-14' AS week_index),(SELECT '2015-15' AS week_index),(SELECT '2015-16' AS week_index),(SELECT '2015-17' AS week_index),(SELECT '2015-18' AS week_index),(SELECT '2015-19' AS week_index),(SELECT '2015-20' AS week_index),(SELECT '2015-21' AS week_index),(SELECT '2015-22' AS week_index),(SELECT '2015-23' AS week_index),(SELECT '2015-24' AS week_index),(SELECT '2015-25' AS week_index),(SELECT '2015-26' AS week_index),(SELECT '2015-27' AS week_index),(SELECT '2015-28' AS week_index),(SELECT '2015-29' AS week_index),(SELECT '2015-30' AS week_index),(SELECT '2015-31' AS week_index),(SELECT '2015-32' AS week_index),(SELECT '2015-33' AS week_index),(SELECT '2015-34' AS week_index),(SELECT '2015-35' AS week_index),(SELECT '2015-36' AS week_index),(SELECT '2015-37' AS week_index),(SELECT '2015-38' AS week_index),(SELECT '2015-39' AS week_index),(SELECT '2015-40' AS week_index),(SELECT '2015-41' AS week_index),(SELECT '2015-42' AS week_index),(SELECT '2015-43' AS week_index),(SELECT '2015-44' AS week_index),(SELECT '2015-45' AS week_index),(SELECT '2015-46' AS week_index),(SELECT '2015-47' AS week_index),(SELECT '2015-48' AS week_index),(SELECT '2015-49' AS week_index),(SELECT '2015-50' AS week_index),(SELECT '2015-51' AS week_index),(SELECT '2015-52' AS week_index),(SELECT '2015-53' AS week_index),
                (SELECT '2016-1' AS week_index),(SELECT '2016-2' AS week_index),(SELECT '2016-3' AS week_index),(SELECT '2016-4' AS week_index),(SELECT '2016-5' AS week_index),(SELECT '2016-6' AS week_index),(SELECT '2016-7' AS week_index),(SELECT '2016-8' AS week_index),(SELECT '2016-9' AS week_index),(SELECT '2016-10' AS week_index),(SELECT '2016-11' AS week_index),(SELECT '2016-12' AS week_index),(SELECT '2016-13' AS week_index),(SELECT '2016-14' AS week_index),(SELECT '2016-15' AS week_index),(SELECT '2016-16' AS week_index),(SELECT '2016-17' AS week_index),(SELECT '2016-18' AS week_index),(SELECT '2016-19' AS week_index),(SELECT '2016-20' AS week_index),(SELECT '2016-21' AS week_index),(SELECT '2016-22' AS week_index),(SELECT '2016-23' AS week_index),(SELECT '2016-24' AS week_index),(SELECT '2016-25' AS week_index),(SELECT '2016-26' AS week_index),(SELECT '2016-27' AS week_index),(SELECT '2016-28' AS week_index),(SELECT '2016-29' AS week_index),(SELECT '2016-30' AS week_index),(SELECT '2016-31' AS week_index),(SELECT '2016-32' AS week_index),(SELECT '2016-33' AS week_index),(SELECT '2016-34' AS week_index),(SELECT '2016-35' AS week_index),(SELECT '2016-36' AS week_index),(SELECT '2016-37' AS week_index),(SELECT '2016-38' AS week_index),(SELECT '2016-39' AS week_index),(SELECT '2016-40' AS week_index),(SELECT '2016-41' AS week_index),(SELECT '2016-42' AS week_index),(SELECT '2016-43' AS week_index),(SELECT '2016-44' AS week_index),(SELECT '2016-45' AS week_index),(SELECT '2016-46' AS week_index),(SELECT '2016-47' AS week_index),(SELECT '2016-48' AS week_index),(SELECT '2016-49' AS week_index),(SELECT '2016-50' AS week_index),(SELECT '2016-51' AS week_index),(SELECT '2016-52' AS week_index),(SELECT '2016-53' AS week_index),
                (SELECT '2017-1' AS week_index),(SELECT '2017-2' AS week_index),(SELECT '2017-3' AS week_index),(SELECT '2017-4' AS week_index),(SELECT '2017-5' AS week_index),(SELECT '2017-6' AS week_index),(SELECT '2017-7' AS week_index),(SELECT '2017-8' AS week_index),(SELECT '2017-9' AS week_index),(SELECT '2017-10' AS week_index),(SELECT '2017-11' AS week_index),(SELECT '2017-12' AS week_index),(SELECT '2017-13' AS week_index),(SELECT '2017-14' AS week_index),(SELECT '2017-15' AS week_index),(SELECT '2017-16' AS week_index),(SELECT '2017-17' AS week_index),(SELECT '2017-18' AS week_index),(SELECT '2017-19' AS week_index),(SELECT '2017-20' AS week_index),(SELECT '2017-21' AS week_index),(SELECT '2017-22' AS week_index),(SELECT '2017-23' AS week_index),(SELECT '2017-24' AS week_index),(SELECT '2017-25' AS week_index),(SELECT '2017-26' AS week_index),(SELECT '2017-27' AS week_index),(SELECT '2017-28' AS week_index),(SELECT '2017-29' AS week_index),(SELECT '2017-30' AS week_index),(SELECT '2017-31' AS week_index),(SELECT '2017-32' AS week_index),(SELECT '2017-33' AS week_index),(SELECT '2017-34' AS week_index),(SELECT '2017-35' AS week_index),(SELECT '2017-36' AS week_index),(SELECT '2017-37' AS week_index),(SELECT '2017-38' AS week_index),(SELECT '2017-39' AS week_index),(SELECT '2017-40' AS week_index),(SELECT '2017-41' AS week_index),(SELECT '2017-42' AS week_index),(SELECT '2017-43' AS week_index),(SELECT '2017-44' AS week_index),(SELECT '2017-45' AS week_index),(SELECT '2017-46' AS week_index),(SELECT '2017-47' AS week_index),(SELECT '2017-48' AS week_index),(SELECT '2017-49' AS week_index),(SELECT '2017-50' AS week_index),(SELECT '2017-51' AS week_index),(SELECT '2017-52' AS week_index),(SELECT '2017-53' AS week_index),
                (SELECT '2018-1' AS week_index),(SELECT '2018-2' AS week_index),(SELECT '2018-3' AS week_index),(SELECT '2018-4' AS week_index),(SELECT '2018-5' AS week_index),(SELECT '2018-6' AS week_index),(SELECT '2018-7' AS week_index),(SELECT '2018-8' AS week_index),(SELECT '2018-9' AS week_index),(SELECT '2018-10' AS week_index),(SELECT '2018-11' AS week_index),(SELECT '2018-12' AS week_index),(SELECT '2018-13' AS week_index),(SELECT '2018-14' AS week_index),(SELECT '2018-15' AS week_index),(SELECT '2018-16' AS week_index),(SELECT '2018-17' AS week_index),(SELECT '2018-18' AS week_index),(SELECT '2018-19' AS week_index),(SELECT '2018-20' AS week_index),(SELECT '2018-21' AS week_index),(SELECT '2018-22' AS week_index),(SELECT '2018-23' AS week_index),(SELECT '2018-24' AS week_index),(SELECT '2018-25' AS week_index),(SELECT '2018-26' AS week_index),(SELECT '2018-27' AS week_index),(SELECT '2018-28' AS week_index),(SELECT '2018-29' AS week_index),(SELECT '2018-30' AS week_index),(SELECT '2018-31' AS week_index),(SELECT '2018-32' AS week_index),(SELECT '2018-33' AS week_index),(SELECT '2018-34' AS week_index),(SELECT '2018-35' AS week_index),(SELECT '2018-36' AS week_index),(SELECT '2018-37' AS week_index),(SELECT '2018-38' AS week_index),(SELECT '2018-39' AS week_index),(SELECT '2018-40' AS week_index),(SELECT '2018-41' AS week_index),(SELECT '2018-42' AS week_index),(SELECT '2018-43' AS week_index),(SELECT '2018-44' AS week_index),(SELECT '2018-45' AS week_index),(SELECT '2018-46' AS week_index),(SELECT '2018-47' AS week_index),(SELECT '2018-48' AS week_index),(SELECT '2018-49' AS week_index),(SELECT '2018-50' AS week_index),(SELECT '2018-51' AS week_index),(SELECT '2018-52' AS week_index),(SELECT '2018-53' AS week_index),
                (SELECT '2019-1' AS week_index),(SELECT '2019-2' AS week_index),(SELECT '2019-3' AS week_index),(SELECT '2019-4' AS week_index),(SELECT '2019-5' AS week_index),(SELECT '2019-6' AS week_index),(SELECT '2019-7' AS week_index),(SELECT '2019-8' AS week_index),(SELECT '2019-9' AS week_index),(SELECT '2019-10' AS week_index),(SELECT '2019-11' AS week_index),(SELECT '2019-12' AS week_index),(SELECT '2019-13' AS week_index),(SELECT '2019-14' AS week_index),(SELECT '2019-15' AS week_index),(SELECT '2019-16' AS week_index),(SELECT '2019-17' AS week_index),(SELECT '2019-18' AS week_index),(SELECT '2019-19' AS week_index),(SELECT '2019-20' AS week_index),(SELECT '2019-21' AS week_index),(SELECT '2019-22' AS week_index),(SELECT '2019-23' AS week_index),(SELECT '2019-24' AS week_index),(SELECT '2019-25' AS week_index),(SELECT '2019-26' AS week_index),(SELECT '2019-27' AS week_index),(SELECT '2019-28' AS week_index),(SELECT '2019-29' AS week_index),(SELECT '2019-30' AS week_index),(SELECT '2019-31' AS week_index),(SELECT '2019-32' AS week_index),(SELECT '2019-33' AS week_index),(SELECT '2019-34' AS week_index),(SELECT '2019-35' AS week_index),(SELECT '2019-36' AS week_index),(SELECT '2019-37' AS week_index),(SELECT '2019-38' AS week_index),(SELECT '2019-39' AS week_index),(SELECT '2019-40' AS week_index),(SELECT '2019-41' AS week_index),(SELECT '2019-42' AS week_index),(SELECT '2019-43' AS week_index),(SELECT '2019-44' AS week_index),(SELECT '2019-45' AS week_index),(SELECT '2019-46' AS week_index),(SELECT '2019-47' AS week_index),(SELECT '2019-48' AS week_index),(SELECT '2019-49' AS week_index),(SELECT '2019-50' AS week_index),(SELECT '2019-51' AS week_index),(SELECT '2019-52' AS week_index),(SELECT '2019-53' AS week_index)
                ) AS Week_Calendar_Table
             ) AS Distinct_Key_Template
           LEFT OUTER JOIN
             (SELECT
                REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
                CONCAT(LEFT(date,4),'-',STRING(WEEK(date))) AS week_index,
                COUNT(CONCAT(LEFT(date,4),'-',STRING(WEEK(date)))) AS value
              FROM
                (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
              WHERE RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') = 'grazia' AND hits.type = 'PAGE'
              GROUP BY Key, week_index
              ) AS Actual_Key_Views_by_Month
            ON Distinct_Key_Template.Key = Actual_Key_Views_by_Month.Key AND Distinct_Key_Template.week_index = Actual_Key_Views_by_Month.week_index
            ) AS A
          ) AS B
        GROUP BY Key)
        
    
  fields:

  - filter: brand_filter
    hidden: true
    label: 'Brand'
  
  - dimension: Page
    hidden: true
    primary_key: true
    sql: ${TABLE}.Key
    
  - dimension: weekly_Views
    group_label: 'Events by Period'
    view_label: Lifestyle
    label: 'Weekly'
    sql: ${TABLE}.weekly_views