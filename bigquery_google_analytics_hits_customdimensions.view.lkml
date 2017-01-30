view: bigquery_google_analytics_hits_customdimensions {
  label: "User Custom Dimensions"
  sql_table_name: publications.bigquery_google_analytics_hits_customdimensions ;;

  dimension: unique_id {
    hidden: yes
    type: string
    primary_key: yes
    sql: ${TABLE}.fullvisitorid || ${TABLE}.visitid || ${TABLE}.index ;;
  }

  dimension: fullvisitorid {
    hidden: yes
    type: string
    sql: ${TABLE}.fullvisitorid ;;
  }

  dimension_group: import {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.import_date ;;
  }

  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: visitid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.visitid ;;
  }

  dimension: visitnumber {
    hidden: yes
    type: number
    sql: ${TABLE}.visitnumber ;;
  }
}
