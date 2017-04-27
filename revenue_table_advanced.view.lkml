view: revenue_table_advanced {
  sql_table_name: ad_platform.revenue_table_advanced ;;

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
    sql:
      CASE
        WHEN ${TABLE}.impressions = 'NA' THEN NULL
        ELSE ${TABLE}.impressions
      END;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform;;
  }

  dimension: marketplace {
    type: string
    sql: ${TABLE}.marketplace;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: brand_market {
    type: string
    sql: ${TABLE}.brand_market;;
  }

  measure: revenue {
    type: sum
    value_format: "\£0.00"
    sql:
      CASE
        WHEN ${TABLE}.revenue = 'NA' THEN NULL
        ELSE ${TABLE}.revenue::float
      END;;
  }

}
