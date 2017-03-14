view: nudge_interactions {
  sql_table_name: publications.nudge_interactions ;;

  dimension: detail_source {
    type: string
    sql: ${TABLE}.detail_source ;;
  }

  dimension: individual_id {
    type: number
    sql: ${TABLE}.individual_id ;;
  }

  dimension: unique_table_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.source_key || ${TABLE}.individual_id || ${TABLE}.magazine_code || ${TABLE}.response_date ;;
  }

  dimension: magazine_code {
    type: string
    sql: ${TABLE}.magazine_code ;;
  }

  dimension_group: response {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.response_date ;;
  }

#   dimension: response_value {
#     type: number
#     sql: ${TABLE}.response_value ;;
#   }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: source_key {
    type: string
    sql: ${TABLE}.source_key ;;
  }

# NOT COMPLETE IS THIS PER TRANS PER SOURCE...
  measure: Count_Records_Source2 {
    type: count_distinct
    label: "Records by Source Count Unique"
    sql: ${TABLE}.individual_id  ;;
    drill_fields: []
}

  measure: Count_Records_Source {
    type: count
    label: "Records by Source Count"
    drill_fields: []
  }
}
