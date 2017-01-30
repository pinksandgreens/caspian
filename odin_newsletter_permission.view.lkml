view: odin_newsletter_permission {
  sql_table_name: responsys.odin_newsletter_permission ;;

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: nwlid {
    type: string
    sql: ${TABLE}.nwlid ;;
  }

  dimension: nwloptin {
    type: number
    sql: ${TABLE}.nwloptin ;;
  }

  dimension_group: nwloptinsubscribets {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.nwloptinsubscribets ;;
  }

  dimension_group: nwloptinunsubscribets {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.nwloptinunsubscribets ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
