view: jr_lifestyle_referral_source_medium {
  label: "Lifestyle"

  derived_table: {
    sql: SELECT
        REGEXP_EXTRACT(hits.page.pagePath, r'^(\/[A-Za-z0-9\/-]+)') AS Key,
        trafficSource.medium AS medium,
        COUNT(trafficSource.medium) AS Views_Medium
      FROM
        {% table_date_range jr_lifestyle_parent_TP1.TP1 114668488.ga_sessions_ %},{% table_date_range jr_lifestyle_parent_TP1.TP1 114668488.ga_sessions_intraday_ %}
      WHERE {% condition jr_lifestyle_parent_TP1.brand_filter %} RegEXP_EXTRACT(hits.page.pagePath, r'^\/(.+?)\/.+') {% endcondition %}
      AND {% condition jr_lifestyle_referral_source_medium.referral_source_Medium_filter %} trafficSource.medium {% endcondition %}
      AND hits.type = 'PAGE'
      AND geoNetwork.country = 'United Kingdom'
      GROUP BY Key, medium
       ;;
  }

  filter: referral_source_Medium_filter {
    view_label: "Acquisition"
    label: "by Medium"
  }

  dimension: Key {
    hidden: yes
    sql: ${TABLE}.Key ;;
  }

  dimension: referral_source_Medium {
    view_label: "Acquisition"
    label: "Medium"
    sql: ${TABLE}.medium ;;
  }

  dimension: Views_Medium {
    view_label: "Acquisition"
    type: number
    label: "Views by Source: Medium (TP1)"
    sql: ${TABLE}.Views_Medium ;;
    description: "Split Page Views into acquisition source by Medium"
  }

  dimension: Views_Medium_vs_TP1_Views {
    view_label: "Acquisition"
    type: number
    label: "% TP1 Views - Medium"
    sql: ${Views_Medium} / ${jr_lifestyle_pageviews_TP1.Views} ;;
    value_format: "0%"
    description: "Page Views by Acquisition - Medium"
  }
}
