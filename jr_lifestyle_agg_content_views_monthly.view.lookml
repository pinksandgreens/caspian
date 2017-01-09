- view: jr_lifestyle_agg_content_views_monthly
  sql_table_name: |
    (SELECT
    B.Key AS Key,
    FIRST(B.Monthly_Views) AS Monthly_Views
    FROM
      (SELECT
        A.Key AS Key,
        GROUP_CONCAT(CONCAT(STRING(A.month_index),':',STRING(A.Key_Views)), '|') OVER
        (PARTITION BY A.Key
        ORDER BY A.month_index ASC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Monthly_Views
        FROM
          (SELECT
            Distinct_Key_Template.Key AS Key,
            Distinct_Key_Template.month_index AS Month_Index,
            IF(Actual_Key_Views_by_Month.Value IS NULL, 0, Actual_Key_Views_by_Month.Value) AS Key_Views
          FROM
            (SELECT
              Distinct_Keys.Key AS Key,
              Month_Calendar_Table.month_index AS month_index
            FROM  
             (SELECT
               REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key
              FROM
               (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
             WHERE {% condition brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %} AND hits.type = 'PAGE'
             GROUP BY Key
             ORDER BY Key
             ) AS Distinct_Keys
           CROSS JOIN
             (SELECT
               month_index,
              FROM
               (SELECT 201501 AS month_index),(SELECT 201502 AS month_index),(SELECT 201503 AS month_index),(SELECT 201504 AS month_index),(SELECT 201505 AS month_index),(SELECT 201506 AS month_index),(SELECT 201507 AS month_index),(SELECT 201508 AS month_index),(SELECT 201509 AS month_index),(SELECT 201510 AS month_index),(SELECT 201511 AS month_index),(SELECT 201512 AS month_index),
               (SELECT 201601 AS month_index),(SELECT 201602 AS month_index),(SELECT 201603 AS month_index),(SELECT 201604 AS month_index),(SELECT 201605 AS month_index),(SELECT 201606 AS month_index),(SELECT 201607 AS month_index),(SELECT 201608 AS month_index),(SELECT 201609 AS month_index),(SELECT 201610 AS month_index),(SELECT 201611 AS month_index),(SELECT 201612 AS month_index),
               (SELECT 201701 AS month_index),(SELECT 201702 AS month_index),(SELECT 201703 AS month_index),(SELECT 201704 AS month_index),(SELECT 201705 AS month_index),(SELECT 201706 AS month_index),(SELECT 201707 AS month_index),(SELECT 201708 AS month_index),(SELECT 201709 AS month_index),(SELECT 201710 AS month_index),(SELECT 201711 AS month_index),(SELECT 201712 AS month_index),
               (SELECT 201801 AS month_index),(SELECT 201802 AS month_index),(SELECT 201803 AS month_index),(SELECT 201804 AS month_index),(SELECT 201805 AS month_index),(SELECT 201806 AS month_index),(SELECT 201807 AS month_index),(SELECT 201808 AS month_index),(SELECT 201809 AS month_index),(SELECT 201810 AS month_index),(SELECT 201811 AS month_index),(SELECT 201812 AS month_index),
               (SELECT 201901 AS month_index),(SELECT 201902 AS month_index),(SELECT 201903 AS month_index),(SELECT 201904 AS month_index),(SELECT 201905 AS month_index),(SELECT 201906 AS month_index),(SELECT 201907 AS month_index),(SELECT 201908 AS month_index),(SELECT 201909 AS month_index),(SELECT 201910 AS month_index),(SELECT 201911 AS month_index),(SELECT 201912 AS month_index)
              ORDER BY month_index
             ) AS Month_Calendar_Table
           ) AS Distinct_Key_Template
         LEFT OUTER JOIN
           (SELECT
           REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
           INTEGER(LEFT(date,6)) AS month_index,
           COUNT(LEFT(date,6)) AS value,
           FROM
           (SELECT * FROM TABLE_QUERY([uplifted-light-89310:114668488],'table_id CONTAINS "ga_sessions"'))
           WHERE REGEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') = 'grazia' AND hits.type = 'PAGE'
           GROUP BY Key, month_index
           ORDER BY Key, month_index
           ) AS Actual_Key_Views_by_Month
       ON Distinct_Key_Template.Key = Actual_Key_Views_by_Month.Key AND Distinct_Key_Template.month_index = Actual_Key_Views_by_Month.month_index
       ) AS A
     ) AS B
    GROUP BY Key
    ORDER BY Key)
    
  fields:
  - filter: brand_filter 
    label: 'Filter by Brand (Grazia, Heat, Closer, Empire)'
  
  - dimension: Page
    sql: ${TABLE}.Key
    
  - dimension: Monthly_Views
    label: 'Monthly'
    sql: ${TABLE}.Monthly_Views