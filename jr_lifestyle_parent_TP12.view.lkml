view: jr_lifestyle_parent_TP12 {
  label: "Lifestyle"

  derived_table: {
    sql: SELECT
        REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        REGEXP_EXTRACT(hits.page.pagePath, r'^.+?\/(beauty|celebrity|contact|diet-body|entertainment|family-money|fashion|feature|hair-beauty|heat-radio|hot-topics|magazine|my|news-real-life|news|sport|bikes-for-sale|bike-reviews|insurance|product-reviews|new-rider)\/.+') AS Section_Category
      FROM
        (SELECT
          Key,
          Views
        FROM
          (SELECT
            hits.page.pagePath AS Key,
            COUNT(hits.page.pagePath) AS Views
          FROM
            {% table_date_range jr_lifestyle_parent_TP1.TP12 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP1.TP12 114668488.ga_sessions_intraday_ %}
          WHERE hits.type = 'PAGE'
          AND date >= '20160202'
          AND geoNetwork.country = 'United Kingdom'
          GROUP BY Key
          ),


          (SELECT
            Key,
            Views
          FROM
            (SELECT
              CONCAT('/grazia',hits.page.pagePath,'/') AS Key,
              COUNT(hits.page.pagePath) AS Views
            FROM
              {% table_date_range jr_lifestyle_parent_TP1.TP12 24045694.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP1.TP12 24045694.ga_sessions_intraday_ %}
            WHERE hits.type = 'PAGE'
            AND date < '20160202'
            AND geoNetwork.country = 'United Kingdom'
            GROUP BY Key
            ),
            (SELECT
              CONCAT('/heat',hits.page.pagePath,'/') AS Key,
              COUNT(hits.page.pagePath) AS Views
            FROM
              {% table_date_range jr_lifestyle_parent_TP1.TP12 33837059.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP1.TP12 33837059.ga_sessions_intraday_ %}
            WHERE hits.type = 'PAGE'
            AND date < '20160202'
            AND geoNetwork.country = 'United Kingdom'
            GROUP BY Key
            ),
            (SELECT
              CONCAT('/closer',hits.page.pagePath,'/') AS Key,
              COUNT(hits.page.pagePath) AS Views
            FROM
              {% table_date_range jr_lifestyle_parent_TP1.TP12 24238224.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP1.TP12 24238224.ga_sessions_intraday_ %}
            WHERE hits.type = 'PAGE'
            AND date < '20160202'
            AND geoNetwork.country = 'United Kingdom'
            GROUP BY Key
            )
          WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %}
        LEFT OUTER JOIN





        GROUP BY Key, Views)













                )
              WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %}
              AND hits.type = 'PAGE'
              GROUP BY Key, Section_Category
       ;;
  }

  dimension: Key {
    view_label: "Content"
    group_label: "Article Dimensions"
    label: "TP_13 - Articles Viewed"
    sql: ${TABLE}.Key ;;
    description: "Article Results using the same user defined time period (TP): 1 for last year"
  }
}
