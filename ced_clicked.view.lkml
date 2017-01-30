view: ced_clicked {
  sql_table_name: responsys.ced_clicked ;;

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: browser_type {
    type: string
    sql: ${TABLE}.browser_type ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: email_format {
    type: string
    sql: ${TABLE}.email_format ;;
  }

  dimension_group: event_captured_dt {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.event_captured_dt ;;
  }

  dimension_group: event_stored_dt {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.event_stored_dt ;;
  }

  dimension: event_type_id {
    type: number
    sql: ${TABLE}.event_type_id ;;
  }

  dimension: launch_id {
    type: number
    sql: ${TABLE}.launch_id ;;
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}.list_id ;;
  }

  dimension: offer_category {
    type: string
    sql: ${TABLE}.offer_category ;;
  }

  dimension: offer_name {
    type: string
    sql: ${TABLE}.offer_name ;;
  }

  dimension: offer_number {
    type: number
    sql: ${TABLE}.offer_number ;;
  }

  dimension: offer_url {
    type: string
    sql: ${TABLE}.offer_url ;;
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
  }

  dimension: riid {
    type: number
    value_format_name: id
    sql: ${TABLE}.riid ;;
  }

  dimension: user_agent_string {
    type: string
    sql: ${TABLE}.user_agent_string ;;
  }

  measure: count {
    type: count
    drill_fields: [offer_name]
  }
}
