view: identities_keys {
  sql_table_name: publications.identities_keys ;;

  dimension: idd_key_id {
    hidden: no
    type: number
    sql: ${TABLE}.idd_key_id ;;
  }

  dimension_group: last_updated {
    hidden: no
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: type {
    hidden: no
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: value {
    hidden: no
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: Unique_IDKEYS_Count {
    hidden: no
    type: count
  }
}
