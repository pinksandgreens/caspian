view: ced_bounced {
  sql_table_name: responsys.ced_bounced ;;

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: bounce_type {
    type: string
    sql: ${TABLE}.bounce_type ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: contact_info {
    type: string
    sql: ${TABLE}.contact_info ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
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

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: reason_code {
    type: string
    sql: ${TABLE}.reason_code ;;
  }

  dimension: riid {
    type: number
    value_format_name: id
    sql: ${TABLE}.riid ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
