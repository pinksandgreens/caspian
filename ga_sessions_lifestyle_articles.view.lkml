view: ga_sessions_lifestyle_articles {
  derived_table: {
    sql: SELECT
         fullVisitorId AS fullVisitorId,
         visitId AS visitId,
         hits.customDimensions.value AS hits_customDimensions_value,
         LEAD(hits.customDimensions.value, 1) OVER (PARTITION BY visitId) AS f0_,
         hits.customDimensions.index AS hits_customDimensions_index,
         LEAD(hits.customDimensions.index, 1) OVER (PARTITION BY visitId) AS f1_,
         hits.page.pageTitle AS hits_page_pageTitle,
      FROM
        ( SELECT * FROM {% table_date_range ga_sessions.date_filter 114668488.ga_sessions_ %})
       ;;
    sql_trigger_value: SELECT FLOOR(EXTRACT(epoch from GETDATE()) / (6*60*60)) ;;
  }

  filter: date_filter {
    type: date
  }

  # TABLE_DATE_RANGE([uplifted-light-89310:114668488.ga_sessions_],DATE_ADD(CURRENT_TIMESTAMP(), -1, 'YEAR'),CURRENT_TIMESTAMP())

  dimension: Unique_ID {
    type: string
    sql: ${TABLE}.fullVisitorId ;;
  }

  dimension: Visit_ID {
    type: string
    sql: ${TABLE}.visitId ;;
  }

  dimension: Author {
    type: string
    sql: CASE
        WHEN ((${TABLE}.hits_customDimensions_index = 1) AND (${TABLE}.f1_ = 2)) THEN ${TABLE}.hits_customDimensions_value
      END
       ;;
  }

  dimension: Published_Date {
    type: string
    sql: CASE
        WHEN ((${TABLE}.hits_customDimensions_index = 1) AND (${TABLE}.f1_ = 2)) THEN ${TABLE}.f0_
      END
       ;;
  }

  dimension: Page_Title {
    type: string
    sql: CASE
        WHEN ((${TABLE}.hits_customDimensions_index = 1) AND (${TABLE}.f1_ = 2)) THEN ${TABLE}.hits_page_pageTitle
      END
       ;;
  }

  dimension_group: date {
    label: "Published"
    type: time
    timeframes: [date, week, month, month_num]
    sql: TIMESTAMP(${Published_Date}) ;;
  }

  dimension: Author_Published_Date2 {
    hidden: no
    type: string
    sql: CONCAT(string(${Author}),"-",string(${Published_Date}),"-",string(${Page_Title})) ;;
  }

  measure: Article_Count {
    type: count_distinct
    sql: ${Author_Published_Date2} ;;
  }
}
