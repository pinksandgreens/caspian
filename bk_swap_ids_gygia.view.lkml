view: bk_swap_ids_gygia {
  sql_table_name: publications.bk_swap_ids_gygia ;;

  dimension: bk_uuid {
    label: "BlueKai UserID"
    type: string
    sql: ${TABLE}.bk_uuid ;;
  }

  dimension: gygia_id {
    label: "Gygia User ID"
    type: string
    sql: ${TABLE}.gygia_id ;;
  }

  dimension_group: time_inserted {
    label: "Swapped"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.time_inserted ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
