view: nudge_ems_deep_data {
  sql_table_name: publications.nudge_ems_deep_data ;;

  dimension: ear_subscriber_key {
    type: number
    sql: ${TABLE}.ear_subscriber_key ;;
  }

  dimension_group: entry_timestamp {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.entry_timestamp ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: pagetype {
    type: string
    sql: ${TABLE}.pagetype ;;
  }

  dimension: range {
    type: string
    sql: ${TABLE}.range ;;
  }

  dimension: registrations_id {
    type: string
    sql: ${TABLE}.registrations_id ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
