view: kipper {
  sql_table_name: publications.kipper ;;

  dimension: brand_code {
    type: string
    sql: ${TABLE}.brand_code ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: current_active_email_base {
    type: number
    sql: ${TABLE}.current_active_email_base ;;
  }

  dimension: current_active_newsletter_base {
    type: number
    sql: ${TABLE}.current_active_newsletter_base ;;
  }

  dimension: email_click_count_unique {
    type: number
    sql: ${TABLE}.email_click_count_unique ;;
  }

  dimension: email_click_through_rate {
    type: number
    sql: ${TABLE}.email_click_through_rate ;;
  }

  dimension: email_open_count_unique {
    type: number
    sql: ${TABLE}.email_open_count_unique ;;
  }

  dimension: email_sent_count_unique {
    type: number
    sql: ${TABLE}.email_sent_count_unique ;;
  }

  dimension: email_unsubscribe_count {
    type: number
    sql: ${TABLE}.email_unsubscribe_count ;;
  }

  dimension: facebook_likes {
    type: number
    sql: ${TABLE}.facebook_likes ;;
  }

  dimension: instagram_followers {
    type: number
    sql: ${TABLE}.instagram_followers ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: overseas_active_radio_sessions_last_month {
    type: number
    sql: ${TABLE}.overseas_active_radio_sessions_last_month ;;
  }

  dimension: overseas_listening_hours_last_month {
    type: number
    sql: ${TABLE}.overseas_listening_hours_last_month ;;
  }

  dimension: overseas_pageviews_last_month {
    type: number
    sql: ${TABLE}.overseas_pageviews_last_month ;;
  }

  dimension: overseas_web_sessions_last_month {
    type: number
    sql: ${TABLE}.overseas_web_sessions_last_month ;;
  }

  dimension: pinterest_followers {
    type: number
    sql: ${TABLE}.pinterest_followers ;;
  }

  dimension: recently_logged_in_users_30days {
    type: number
    sql: ${TABLE}.recently_logged_in_users_30days ;;
  }

  dimension: total_active_magazine_subscribers {
    type: number
    sql: ${TABLE}.total_active_magazine_subscribers ;;
  }

  dimension: total_active_radio_sessions_last_month {
    type: number
    sql: ${TABLE}.total_active_radio_sessions_last_month ;;
  }

  dimension: total_brand_email_optins {
    type: number
    sql: ${TABLE}.total_brand_email_optins ;;
  }

  dimension: total_listening_hours_last_month {
    type: number
    sql: ${TABLE}.total_listening_hours_last_month ;;
  }

  dimension: total_newsletter_email_optins {
    type: number
    sql: ${TABLE}.total_newsletter_email_optins ;;
  }

  dimension: total_number_of_competition_entries {
    type: number
    sql: ${TABLE}.total_number_of_competition_entries ;;
  }

  dimension: total_number_of_competition_optins {
    type: number
    sql: ${TABLE}.total_number_of_competition_optins ;;
  }

  dimension: total_number_of_competitions {
    type: number
    sql: ${TABLE}.total_number_of_competitions ;;
  }

  dimension: total_pageviews_last_month {
    type: number
    sql: ${TABLE}.total_pageviews_last_month ;;
  }

  dimension: total_phone_optins {
    type: number
    sql: ${TABLE}.total_phone_optins ;;
  }

  dimension: total_registered_competition_users {
    type: number
    sql: ${TABLE}.total_registered_competition_users ;;
  }

  dimension: total_registered_users {
    type: number
    sql: ${TABLE}.total_registered_users ;;
  }

  dimension: total_registered_web_users {
    type: number
    sql: ${TABLE}.total_registered_web_users ;;
  }

  dimension: total_social_followers {
    type: number
    sql: ${TABLE}.total_social_followers ;;
  }

  dimension: total_web_sessions_last_month {
    type: number
    sql: ${TABLE}.total_web_sessions_last_month ;;
  }

  dimension: twitter_followers {
    type: number
    sql: ${TABLE}.twitter_followers ;;
  }

  dimension: uk__web_sessions_last_month {
    type: number
    sql: ${TABLE}.uk__web_sessions_last_month ;;
  }

  dimension: uk_active_radio_sessions_last_month {
    type: number
    sql: ${TABLE}.uk_active_radio_sessions_last_month ;;
  }

  dimension: uk_listening_hours_last_month {
    type: number
    sql: ${TABLE}.uk_listening_hours_last_month ;;
  }

  dimension: uk_pageviews_last_month {
    type: number
    sql: ${TABLE}.uk_pageviews_last_month ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date ;;
  }

  dimension: youtube_subscribers {
    type: number
    sql: ${TABLE}.youtube_subscribers ;;
  }

  measure: count {
    type: count
    drill_fields: [brand_name]
  }
}
