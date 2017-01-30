view: ced_converted {
  sql_table_name: responsys.ced_converted ;;

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

  dimension: offer_categry {
    type: string
    sql: ${TABLE}.offer_categry ;;
  }

  dimension: offer_name {
    type: string
    sql: ${TABLE}.offer_name ;;
  }

  dimension: offer_url {
    type: string
    sql: ${TABLE}.offer_url ;;
  }

  dimension: operating_system {
    type: string
    sql: ${TABLE}.operating_system ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_quantity {
    type: number
    sql: ${TABLE}.order_quantity ;;
  }

  dimension: order_total {
    type: number
    sql: ${TABLE}.order_total ;;
  }

  dimension: riid {
    type: number
    value_format_name: id
    sql: ${TABLE}.riid ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
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
