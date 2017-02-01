view: nudge_subscription_history {
  sql_table_name: publications.nudge_subscription_history ;;

  dimension: batch_number {
    type: string
    sql: ${TABLE}.batch_number ;;
  }

  dimension: channel_code_primary_channel {
    type: string
    sql: ${TABLE}.channel_code_primary_channel ;;
  }

  dimension: circulation_status {
    type: string
    sql: ${TABLE}.circulation_status ;;
  }

  dimension: dd_claims {
    type: number
    sql: ${TABLE}.dd_claims ;;
  }

  dimension: effort_sent {
    type: number
    sql: ${TABLE}.effort_sent ;;
  }

  dimension: expire_outcome {
    type: string
    sql: ${TABLE}.expire_outcome ;;
  }

  dimension: expire_outcome_group {
    type: string
    sql: ${TABLE}.expire_outcome_group ;;
  }

  dimension: expiry_issue {
    type: string
    sql: ${TABLE}.expiry_issue ;;
  }

  dimension_group: expiry_issue {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.expiry_issue_date ;;
  }

  dimension_group: expiry_on_sale {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.expiry_on_sale_date ;;
  }

  dimension: individual_id {
    type: number
    sql: ${TABLE}.individual_id ;;
  }

  dimension: issues_remaining {
    type: number
    sql: ${TABLE}.issues_remaining ;;
  }

  dimension: last_issue {
    type: string
    sql: ${TABLE}.last_issue ;;
  }

  dimension_group: last_issue {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.last_issue_date ;;
  }

  dimension_group: last_issue_on_sale {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.last_issue_on_sale_date ;;
  }

  dimension: magazine_code {
    type: string
    sql: ${TABLE}.magazine_code ;;
  }

  dimension: new_or_renewal {
    type: string
    sql: ${TABLE}.new_or_renewal ;;
  }

  dimension: non_dd_sensitivity {
    type: string
    sql: ${TABLE}.non_dd_sensitivity ;;
  }

  dimension: number_of_copies {
    type: number
    sql: ${TABLE}.number_of_copies ;;
  }

  dimension: number_of_issues {
    type: number
    sql: ${TABLE}.number_of_issues ;;
  }

  dimension: offer_code {
    type: string
    sql: ${TABLE}.offer_code ;;
  }

  dimension: offer_code_description {
    type: string
    sql: ${TABLE}.offer_code_description ;;
  }

  dimension_group: order {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.order_date ;;
  }

  dimension: outstanding_liability {
    type: number
    sql: ${TABLE}.outstanding_liability ;;
  }

  dimension: payment_flag {
    type: string
    sql: ${TABLE}.payment_flag ;;
  }

  dimension: payment_method_cat {
    type: string
    sql: ${TABLE}.payment_method_cat ;;
  }

  dimension: payment_method_code {
    type: string
    sql: ${TABLE}.payment_method_code ;;
  }

  dimension: private_or_donor {
    type: string
    sql: ${TABLE}.private_or_donor ;;
  }

  dimension: renewal_status {
    type: string
    sql: ${TABLE}.renewal_status ;;
  }

  dimension: renewal_type {
    type: string
    sql: ${TABLE}.renewal_type ;;
  }

  dimension: source_code {
    type: string
    sql: ${TABLE}.source_code ;;
  }

  dimension: source_code_description {
    type: string
    sql: ${TABLE}.source_code_description ;;
  }

  dimension: source_group {
    type: string
    sql: ${TABLE}.source_group ;;
  }

  dimension: start_issue {
    type: string
    sql: ${TABLE}.start_issue ;;
  }

  dimension_group: start_issue {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.start_issue_date ;;
  }

  dimension_group: start_issue_on_sale {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.start_issue_on_sale_date ;;
  }

  dimension: subscriber_payer_ref {
    type: string
    sql: ${TABLE}.subscriber_payer_ref ;;
  }

  dimension: subscriber_recipient_ref {
    type: string
    sql: ${TABLE}.subscriber_recipient_ref ;;
  }

  dimension: subscription_indicator {
    type: string
    sql: ${TABLE}.subscription_indicator ;;
  }

  dimension: subscription_rate {
    type: number
    sql: ${TABLE}.subscription_rate ;;
  }

  dimension: subscription_ref {
    type: string
    sql: ${TABLE}.subscription_ref ;;
  }

  dimension: subscription_status {
    type: string
    sql: ${TABLE}.subscription_status ;;
  }

  dimension: subscription_term {
    type: number
    sql: ${TABLE}.subscription_term ;;
  }

  dimension: subscriptions_id {
    type: string
    sql: ${TABLE}.subscriptions_id ;;
  }

  dimension: times_renewed {
    type: number
    sql: ${TABLE}.times_renewed ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
