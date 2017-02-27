view: plista {
  sql_table_name: ad_platform.plista ;;

  measure: data_advertisements_adblockrate {
    type: average
    label: "Adblock Rate"
    value_format: "0.00\%"
    sql: ${TABLE}."data.advertisements.adblockrate"::float ;;
  }

  measure: data_advertisements_adimpressions {
    type: sum
    label: "Impressions"
    sql: ${TABLE}."data.advertisements.adimpressions" ;;
  }

  measure: data_advertisements_clicks {
    type: sum
    label: "Clicks"
    sql: ${TABLE}."data.advertisements.clicks" ;;
  }

  measure: data_advertisements_ctr {
    type: average
    label: "CTR"
    value_format: "0.00\%"
    sql: ${TABLE}."data.advertisements.ctr"::float*100 ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}."data.advertisements.date",'YYYY-MM-DD') ;;
  }

  measure: data_advertisements_ecpm {
    type: average
    label: "eCPM"
    value_format: "0.00"
    sql: ${TABLE}."data.advertisements.ecpm"::float ;;
  }

  measure: data_advertisements_revenue {
    type: sum
    label: "Revenue"
    value_format: "0.00"
    sql: ${TABLE}."data.advertisements.revenue"::float ;;
  }

  measure: data_advertisements_vecpm {
    type: average
    label: "veCPM"
    value_format: "0.00"
    sql: ${TABLE}."data.advertisements.vecpm"::float ;;
  }

  measure: data_advertisements_visibility {
    type: sum
    label: "Visibility"
    sql: ${TABLE}."data.advertisements.visibility" ;;
  }

  measure: data_advertisements_widgetimpressions {
    type: sum
    label: "Widget Impressions"
    sql: ${TABLE}."data.advertisements.widgetimpressions" ;;
  }

  dimension: data_currency {
    type: string
    label: "Currency"
    sql: ${TABLE}."data.currency" ;;
  }

  dimension: data_groupby {
    type: string
    label: "Groupby Dimension"
    sql: ${TABLE}."data.groupby" ;;
  }

  dimension: domain_name {
    type: string
    label: "Domain Name"
    sql: ${TABLE}.domain_name ;;
  }

  dimension: result {
    type: string
    label: "Result"
    sql: ${TABLE}.result ;;
  }

  dimension: rownum {
    type: string
    hidden: yes
    sql: ${TABLE}.rownum ;;
  }

  measure: count {
    type: count
    drill_fields: [domain_name]
  }
}
