view: nudge_digital_subscriptions {
  sql_table_name: publications.nudge_digital_subscriptions ;;

  dimension: already_seen {
    type: string
    sql: ${TABLE}.already_seen ;;
  }

  dimension: apple_identifier {
    type: string
    sql: ${TABLE}.apple_identifier ;;
  }

  dimension: brand_code {
    type: string
    sql: ${TABLE}.brand_code ;;
  }

  dimension: circulation_status {
    type: string
    sql: ${TABLE}.circulation_status ;;
  }

  dimension_group: comp_first {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.comp_first_date ;;
  }

  dimension_group: ems_first {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ems_first_date ;;
  }

  dimension_group: est_lapse {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.est_lapse_date ;;
  }

  dimension: individual_id {
    type: number
    sql: ${TABLE}.individual_id ;;
  }

  dimension_group: med_first {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.med_first_date ;;
  }

  dimension_group: par_first {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.par_first_date ;;
  }

  dimension_group: prev_est_lapse {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.prev_est_lapse_date ;;
  }

  dimension_group: report_end {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.report_end_date ;;
  }

  dimension_group: report_start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.report_start_date ;;
  }

  dimension_group: subs_first {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.subs_first_date ;;
  }

  dimension_group: subs_last {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.subs_last_date ;;
  }

  dimension: subs_tenure_years {
    type: number
    sql: ${TABLE}.subs_tenure_years ;;
  }

  dimension: subscription_key {
    type: string
    sql: ${TABLE}.subscription_key ;;
  }

  dimension: tenure_months {
    type: number
    sql: ${TABLE}.tenure_months ;;
  }

  dimension: tenure_years {
    type: number
    sql: ${TABLE}.tenure_years ;;
  }

  dimension: term {
    type: string
    sql: ${TABLE}.term ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: transaction_first {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.transaction_first_date ;;
  }

  dimension: uk_postcode {
    type: string
    sql: ${TABLE}.uk_postcode ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
