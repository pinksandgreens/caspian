view: kipper_historical {
  sql_table_name: publications.kipper_historical ;;

  dimension: brand_code {
    type: string
    sql: ${TABLE}.brand_code ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  measure: current_active_email_base {
    type: sum
    sql: ${TABLE}.current_active_email_base ;;
  }

  measure: current_active_email_base_difference {
    type: sum
    sql: ${TABLE}.current_active_email_base_difference ;;
  }

  measure: current_active_newsletter_base {
    type: sum
    sql: ${TABLE}.current_active_newsletter_base ;;
  }

  measure: current_active_newsletter_base_difference {
    type: sum
    sql: ${TABLE}.current_active_newsletter_base_difference ;;
  }

  measure: email_click_count_unique {
    type: sum
    sql: ${TABLE}.email_click_count_unique ;;
  }

  measure: email_click_count_unique_difference {
    type: sum
    sql: ${TABLE}.email_click_count_unique_difference ;;
  }

  measure: email_click_through_rate {
    type: sum
    sql: ${TABLE}.email_click_through_rate ;;
  }

  measure: email_click_through_rate_difference {
    type: sum
    sql: ${TABLE}.email_click_through_rate_difference ;;
  }

  measure: email_open_count_unique {
    type: sum
    sql: ${TABLE}.email_open_count_unique ;;
  }

  measure: email_open_count_unique_difference {
    type: sum
    sql: ${TABLE}.email_open_count_unique_difference ;;
  }

  measure: email_sent_count_unique {
    type: sum
    sql: ${TABLE}.email_sent_count_unique ;;
  }

  measure: email_sent_count_unique_difference {
    type: sum
    sql: ${TABLE}.email_sent_count_unique_difference ;;
  }

  measure: email_unsubscribe_count {
    type: sum
    sql: ${TABLE}.email_unsubscribe_count ;;
  }

  measure: email_unsubscribe_count_difference {
    type: sum
    sql: ${TABLE}.email_unsubscribe_count_difference ;;
  }

  measure: facebook_likes {
    type: sum
    sql: ${TABLE}.facebook_likes ;;
  }

  measure: facebook_likes_difference {
    type: sum
    sql: ${TABLE}.facebook_likes_difference ;;
  }

  measure: instagram_followers {
    type: sum
    sql: ${TABLE}.instagram_followers ;;
  }

  measure: instagram_followers_difference {
    type: sum
    sql: ${TABLE}.instagram_followers_difference ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  measure: overseas_listening_hours_last_month {
    type: sum
    sql: ${TABLE}.overseas_listening_hours_last_month ;;
  }

  measure: overseas_listening_hours_last_month_difference {
    type: sum
    sql: ${TABLE}.overseas_listening_hours_last_month_difference ;;
  }

  measure: overseas_pageviews_last_month {
    type: sum
    sql: ${TABLE}.overseas_pageviews_last_month ;;
  }

  measure: overseas_pageviews_last_month_difference {
    type: sum
    sql: ${TABLE}.overseas_pageviews_last_month_difference ;;
  }

  measure: overseas_web_sessions_last_month {
    type: sum
    sql: ${TABLE}.overseas_web_sessions_last_month ;;
  }

  measure: overseas_web_sessions_last_month_difference {
    type: sum
    sql: ${TABLE}.overseas_web_sessions_last_month_difference ;;
  }

  measure: pinterest_followers {
    type: sum
    sql: ${TABLE}.pinterest_followers ;;
  }

  measure: pinterest_followers_difference {
    type: sum
    sql: ${TABLE}.pinterest_followers_difference ;;
  }

  measure: recently_logged_in_users_30days {
    type: sum
    sql: ${TABLE}.recently_logged_in_users_30days ;;
  }

  measure: recently_logged_in_users_30days_difference {
    type: sum
    sql: ${TABLE}.recently_logged_in_users_30days_difference ;;
  }

  measure: total_active_magazine_subscribers {
    type: sum
    sql: ${TABLE}.total_active_magazine_subscribers ;;
  }

  measure: total_active_magazine_subscribers_difference {
    type: sum
    sql: ${TABLE}.total_active_magazine_subscribers_difference ;;
  }

  measure: total_active_radio_sessions_last_month {
    type: sum
    sql: ${TABLE}.total_active_radio_sessions_last_month ;;
  }

  measure: total_active_radio_sessions_last_month_difference {
    type: sum
    sql: ${TABLE}.total_active_radio_sessions_last_month_difference ;;
  }

  measure: total_brand_email_optins {
    type: sum
    sql: ${TABLE}.total_brand_email_optins ;;
  }

  measure: total_brand_email_optins_difference {
    type: sum
    sql: ${TABLE}.total_brand_email_optins_difference ;;
  }

  measure: total_listening_hours_last_month {
    type: sum
    sql: ${TABLE}.total_listening_hours_last_month ;;
  }

  measure: total_listening_hours_last_month_difference {
    type: sum
    sql: ${TABLE}.total_listening_hours_last_month_difference ;;
  }

  measure: total_newsletter_email_optins {
    type: sum
    sql: ${TABLE}.total_newsletter_email_optins ;;
  }

  measure: total_newsletter_email_optins_difference {
    type: sum
    sql: ${TABLE}.total_newsletter_email_optins_difference ;;
  }

  measure: total_sum_of_competition_entries {
    type: sum
    sql: ${TABLE}.total_sum_of_competition_entries ;;
  }

  measure: total_sum_of_competition_entries_difference {
    type: sum
    sql: ${TABLE}.total_sum_of_competition_entries_difference ;;
  }

  measure: total_sum_of_competition_optins {
    type: sum
    sql: ${TABLE}.total_sum_of_competition_optins ;;
  }

  measure: total_sum_of_competition_optins_difference {
    type: sum
    sql: ${TABLE}.total_sum_of_competition_optins_difference ;;
  }

  measure: total_sum_of_competitions {
    type: sum
    sql: ${TABLE}.total_sum_of_competitions ;;
  }

  measure: total_sum_of_competitions_difference {
    type: sum
    sql: ${TABLE}.total_sum_of_competitions_difference ;;
  }

  measure: total_pageviews_last_month {
    type: sum
    sql: ${TABLE}.total_pageviews_last_month ;;
  }

  measure: total_pageviews_last_month_difference {
    type: sum
    sql: ${TABLE}.total_pageviews_last_month_difference ;;
  }

  measure: total_phone_optins {
    type: sum
    sql: ${TABLE}.total_phone_optins ;;
  }

  measure: total_phone_optins_difference {
    type: sum
    sql: ${TABLE}.total_phone_optins_difference ;;
  }

  measure: total_registered_competition_users {
    type: sum
    sql: ${TABLE}.total_registered_competition_users ;;
  }

  measure: total_registered_competition_users_difference {
    type: sum
    sql: ${TABLE}.total_registered_competition_users_difference ;;
  }

  measure: total_registered_users {
    type: sum
    sql: ${TABLE}.total_registered_users ;;
  }

  measure: total_registered_users_difference {
    type: sum
    sql: ${TABLE}.total_registered_users_difference ;;
  }

  measure: total_registered_web_users {
    type: sum
    sql: ${TABLE}.total_registered_web_users ;;
  }

  measure: total_registered_web_users_difference {
    type: sum
    sql: ${TABLE}.total_registered_web_users_difference ;;
  }

  measure: total_social_followers {
    type: sum
    sql: ${TABLE}.total_social_followers ;;
  }

  measure: total_social_followers_difference {
    type: sum
    sql: ${TABLE}.total_social_followers_difference ;;
  }

  measure: total_web_sessions_last_month {
    type: sum
    sql: ${TABLE}.total_web_sessions_last_month ;;
  }

  measure: total_web_sessions_last_month_difference {
    type: sum
    sql: ${TABLE}.total_web_sessions_last_month_difference ;;
  }

  measure: twitter_followers {
    type: sum
    sql: ${TABLE}.twitter_followers ;;
  }

  measure: twitter_followers_difference {
    type: sum
    sql: ${TABLE}.twitter_followers_difference ;;
  }

  measure: uk__web_sessions_last_month {
    type: sum
    sql: ${TABLE}.uk__web_sessions_last_month ;;
  }

  measure: uk__web_sessions_last_month_difference {
    type: sum
    sql: ${TABLE}.uk__web_sessions_last_month_difference ;;
  }

  measure: uk_listening_hours_last_month {
    type: sum
    sql: ${TABLE}.uk_listening_hours_last_month ;;
  }

  measure: uk_listening_hours_last_month_difference {
    type: sum
    sql: ${TABLE}.uk_listening_hours_last_month_difference ;;
  }

  measure: uk_pageviews_last_month {
    type: sum
    sql: ${TABLE}.uk_pageviews_last_month ;;
  }

  measure: uk_pageviews_last_month_difference {
    type: sum
    sql: ${TABLE}.uk_pageviews_last_month_difference ;;
  }

  dimension_group: date {
    label: "Updated"
    type: time
    timeframes: [
      date,
      week,
      month,
      month_num,
      day_of_month,
      day_of_week
    ]
    convert_tz: no
    sql: TO_DATE(${TABLE}.updated_date,'YYYY-MM-DD') ;;
  }

  measure: youtube_subscribers {
    type: sum
    sql: ${TABLE}.youtube_subscribers ;;
  }

  measure: youtube_subscribers_difference {
    type: sum
    sql: ${TABLE}.youtube_subscribers_difference ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.brand_name || ' - ' || ${TABLE}.updated_date ;;
  }
}
