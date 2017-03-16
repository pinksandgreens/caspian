view: google_analytics_weekly_demogs {
  sql_table_name: publications.google_analytics_weekly_demogs ;;

  dimension: interestinmarketcategory {
    label: "In-Market - All levels"
    type: string
    sql: ${TABLE}.interestinmarketcategory ;;
  }

  dimension: useragebracket {
    label: "Age Banding"
    type: string
    sql: ${TABLE}.useragebracket ;;
  }

  dimension: usergender {
    label: "Gender"
    type: string
    sql: INITCAP(${TABLE}.usergender) ;;
  }

  dimension: operatingsystem {
    type: string
    sql: ${TABLE}.operatingsystem ;;
  }

  dimension_group: date {
    label: "Recorded"
    type: time
    timeframes: [week, month]
    convert_tz: no
    sql: TO_DATE(${TABLE}.yearweek,'YYYYWW') ;;
  }

  measure: bounce_rate {
    type: average
    value_format: "#,##0.00\"%\""
    sql: ${TABLE}.bouncerate::float ;;
  }

  dimension: brand {
    label: "Data Source"
    type: string
    sql: SPLIT_PART(${TABLE}.brand, '|', 1) ;;
  }

  dimension: brand_name {
    type: string
    sql: SPLIT_PART(${TABLE}.brand, '|', 2) ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  #KEPT THIS NAME TO NOT BREAK ANYTHING, THIS IS ACTUALLY IS_WEB (YES/NO)
  dimension: is_app {
    label: "Is Web Data"
    type: yesno
    sql: ${TABLE}.platform = 'Web' ;;
  }

  measure: page_views {
    type: sum
    sql: ${TABLE}.pageviews ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: device {
    label: "Device Category"
    type: string
    sql: INITCAP(${TABLE}.deviceCategory) ;;
  }

  dimension: channelGrouping {
    label: "Channel"
    type: string
    sql: ${TABLE}.channelGrouping ;;
  }

  measure: session_duration {
    type: sum
    hidden: yes
    sql: ${TABLE}.sessionduration ;;
  }

  measure: sessions {
    type: sum
    sql: ${TABLE}.sessions ;;
  }

  measure: unique_pageviews {
    type: sum
    sql: ${TABLE}.uniquepageviews ;;
  }

  measure: unique_users {
    hidden: no
    label: "Users"
    type: sum
    sql: ${TABLE}.users ;;
  }

  measure: average_session_duration {
    type: number
    sql: (${session_duration}/${sessions})/60 ;;
  }

  dimension: level_1 {
    label: "In-Market - Level 1"
    type: string
    sql: split_part(${TABLE}.interestinmarketcategory,'/',1) ;;
  }

  dimension: level_2 {
    label: "In-Market - Level 2"
    type: string
    sql: split_part(${TABLE}.interestinmarketcategory,'/',2) ;;
  }

  dimension: level_3 {
    label: "In-Market - Level 3"
    type: string
    sql: split_part(${TABLE}.interestinmarketcategory,'/',3) ;;
  }

  dimension: level_4 {
    label: "In-Market - Level 4"
    type: string
    sql: split_part(${TABLE}.interestinmarketcategory,'/',4) ;;
  }

  dimension: level_5 {
    label: "In-Market - Level 5"
    type: string
    sql: split_part(${TABLE}.interestinmarketcategory,'/',5) ;;
  }
}
