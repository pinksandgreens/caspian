view: revenue_table {
  sql_table_name: ad_platform.revenue_table ;;

  measure: clicks {
    type: sum
    sql:
      CASE
        WHEN ${TABLE}.clicks = 'NA' THEN NULL
        ELSE ${TABLE}.clicks
      END;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  measure: revenue {
    type: sum
    value_format: "\£0.00"
    sql: ${TABLE}.revenue::float ;;
  }

}
