view: nudge_subscriptions {
  sql_table_name: publications.nudge_subscriptions ;;

  dimension: circulation_status {
    type: string
    sql: ${TABLE}.circulation_status ;;
  }

  dimension: copies {
    type: number
    sql: ${TABLE}.copies ;;
  }

  dimension: current_channel_code_by_primary_channel {
    type: string
    sql: ${TABLE}.current_channel_code_by_primary_channel ;;
  }

  dimension: current_offer_code {
    type: string
    sql: ${TABLE}.current_offer_code ;;
  }

  dimension: current_payment_method {
    type: string
    sql: ${TABLE}.current_payment_method ;;
  }

  dimension: current_payment_method_cat {
    type: string
    sql: ${TABLE}.current_payment_method_cat ;;
  }

  dimension: current_source_code {
    type: string
    sql: ${TABLE}.current_source_code ;;
  }

  dimension: current_source_code_description {
    type: string
    sql: ${TABLE}.current_source_code_description ;;
  }

  dimension: current_source_group {
    type: string
    sql: ${TABLE}.current_source_group ;;
  }

  dimension_group: date_deleted {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.date_deleted ;;
  }

  dimension_group: date_joined {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.date_joined ;;
  }

  dimension: dd_grace_issues {
    type: number
    sql: ${TABLE}.dd_grace_issues ;;
  }

  dimension: dd_grace_value {
    type: number
    sql: ${TABLE}.dd_grace_value ;;
  }

  dimension: dd_issues {
    type: number
    sql: ${TABLE}.dd_issues ;;
  }

  dimension: dd_term_period {
    type: number
    sql: ${TABLE}.dd_term_period ;;
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

  dimension: grace_issues_received {
    type: number
    sql: ${TABLE}.grace_issues_received ;;
  }

  dimension: grace_issues_received_value {
    type: number
    sql: ${TABLE}.grace_issues_received_value ;;
  }

  dimension: individual_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.individual_id ;;
  }

  dimension: interactions_id {
    type: string
    sql: ${TABLE}.interactions_id ;;
  }

  dimension: last_effort_sent {
    type: number
    sql: ${TABLE}.last_effort_sent ;;
  }

  dimension: last_issue_on_sale_date {
    type: string
    sql: ${TABLE}.last_issue_on_sale_date ;;
  }

  dimension: last_issue_received {
    type: string
    sql: ${TABLE}.last_issue_received ;;
  }

  dimension_group: last_issue_received {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.last_issue_received_date ;;
  }

  dimension: last_paid_day {
    type: number
    sql: ${TABLE}.last_paid_day ;;
  }

  dimension: magazine_code {
    type: string
    sql: ${TABLE}.magazine_code ;;
  }

  dimension: new_or_renewed_category {
    type: string
    sql: ${TABLE}.new_or_renewed_category ;;
  }

  dimension: non_dd_sensitivity {
    type: string
    sql: ${TABLE}.non_dd_sensitivity ;;
  }

  dimension: number_of_dd_claims {
    type: number
    sql: ${TABLE}.number_of_dd_claims ;;
  }

  dimension: number_of_times_renewed {
    type: number
    sql: ${TABLE}.number_of_times_renewed ;;
  }

  dimension: original_channel_code_by_primary_channel {
    type: string
    sql: ${TABLE}.original_channel_code_by_primary_channel ;;
  }

  dimension: original_offer_code {
    type: string
    sql: ${TABLE}.original_offer_code ;;
  }

  dimension: original_payment_method {
    type: string
    sql: ${TABLE}.original_payment_method ;;
  }

  dimension: original_payment_method_cat {
    type: string
    sql: ${TABLE}.original_payment_method_cat ;;
  }

  dimension: original_source_code {
    type: string
    sql: ${TABLE}.original_source_code ;;
  }

  dimension: original_source_code_description {
    type: string
    sql: ${TABLE}.original_source_code_description ;;
  }

  dimension: original_source_group {
    type: string
    sql: ${TABLE}.original_source_group ;;
  }

  dimension: original_source_group_description {
    type: string
    sql: ${TABLE}.original_source_group_description ;;
  }

  dimension: orignial_offer_code_description {
    type: string
    sql: ${TABLE}.orignial_offer_code_description ;;
  }

  dimension: recipient_service_email_address {
    type: string
    sql: ${TABLE}.recipient_service_email_address ;;
  }

  dimension: renewal_status {
    type: string
    sql: ${TABLE}.renewal_status ;;
  }

  dimension_group: start_issue {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.start_issue_date ;;
  }

  dimension: start_issue_no {
    type: string
    sql: ${TABLE}.start_issue_no ;;
  }

  dimension_group: start_issue_on_sale {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.start_issue_on_sale_date ;;
  }

  dimension: stop_renewals_flag {
    type: string
    sql: ${TABLE}.stop_renewals_flag ;;
  }

  dimension: stop_renewals_reason {
    type: string
    sql: ${TABLE}.stop_renewals_reason ;;
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

  dimension: subscription_ref {
    type: string
    sql: ${TABLE}.subscription_ref ;;
  }

  dimension: subscription_status {
    type: string
    sql: ${TABLE}.subscription_status ;;
  }

  dimension: subscription_status_detail {
    type: string
    sql: ${TABLE}.subscription_status_detail ;;
  }

  dimension: total_issues_despatched {
    type: number
    sql: ${TABLE}.total_issues_despatched ;;
  }

  dimension: total_issues_left {
    type: number
    sql: ${TABLE}.total_issues_left ;;
  }

  dimension: total_issues_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.total_issues_paid ;;
  }

  dimension: total_order_value {
    type: number
    sql: ${TABLE}.total_order_value ;;
  }

  dimension: total_outstanding_liability {
    type: number
    sql: ${TABLE}.total_outstanding_liability ;;
  }

  dimension: total_unpaid_issues {
    type: number
    sql: ${TABLE}.total_unpaid_issues ;;
  }

  dimension: total_unpaid_value {
    type: number
    sql: ${TABLE}.total_unpaid_value ;;
  }

  measure: number_of_individuals {
    type: count_distinct
    sql: ${TABLE}.individual_id ;;
  }

  measure: Active_Subs_Count {
    type: count

    filters: {
      field: subscription_status
      value: "C, I"
    }

    filters: {
      field: circulation_status
      value: "Q, R"
    }

    filters: {
      field: subscription_indicator
      value: "D, R, S"
    }
  }
}
