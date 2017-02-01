view: ga_sessions_lifestyle_brandsearch {
  label: "x: Pages Viewed"

  derived_table: {
    sql: SELECT
        fullVisitorId AS ga_sessions_full_visitor_id,
        hits.page.pagePath AS CAR
      FROM
        ( SELECT * FROM {% table_date_range ga_sessions.date_filter 114668488.ga_sessions_ %})
      GROUP BY 1,2
      ORDER BY 1
       ;;
  }

  filter: date_filter {
    type: date
  }

  # TABLE_DATE_RANGE([uplifted-light-89310:114668488.ga_sessions_],DATE_ADD(CURRENT_TIMESTAMP(), -1, 'YEAR'),CURRENT_TIMESTAMP())

  #   - dimension: ConcatID_PPath
  #     label: 'ID-Page'
  #     type: string
  #     sql: CONCAT(${TABLE}.ga_sessions_full_visitor_id,${TABLE}.CAR)

  dimension: full_Visitor_Id {
    hidden: yes
    label: "FullVisitorID"
    type: string
    primary_key: yes
    sql: ${TABLE}.ga_sessions_full_visitor_id ;;
  }

  dimension: Make_Model {
    label: "Pages Viewed"
    type: string
    sql: ${TABLE}.CAR ;;
  }

  dimension: Pages_Count1 {
    label: "Pageview Count"
    hidden: yes
    type: string
    sql: CASE
        WHEN ${TABLE}.CAR IS NOT NULL THEN 1
      END
       ;;
  }

  measure: Pages_Count {
    label: "Pageview Count"
    type: sum
    sql: ${Pages_Count1} ;;
  }
}
