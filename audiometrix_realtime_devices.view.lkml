view: audiometrix_realtime_devices {
  sql_table_name: publications.audiometrix_view_devices_unique ;;

  measure: active_sessions {
    type: sum
    sql: ${TABLE}.active_sessions ;;
  }

  measure: total_sessions_today {
    type: sum
    sql: ${TABLE}.total_sessions_today ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension_group: date {
    label: "Recorded"
    type: time
    timeframes: [time, hour, date, week, month]
    convert_tz: yes
    # BST/GMT depending on date
    sql: CONVERT_TIMEZONE('UTC','BST',${TABLE}.date::timestamp) ;;
  }
}
