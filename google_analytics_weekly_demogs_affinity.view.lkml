view: google_analytics_weekly_demogs_affinity {
  sql_table_name: publications.google_analytics_weekly_demogs_affinity ;;

#   dimension: interestinmarketcategory {
#     label: "Affinity Category"
#     type: string
#     sql: ${TABLE}.interestinmarketcategory ;;
#   }

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


  measure: unique_users {
    hidden: no
    label: "Users"
    type: sum
    sql: ${TABLE}.users ;;
  }


  dimension: affinity {
    label: "Affinity Category"
    type: string
    sql: ${TABLE}.interestaffinitycategory ;;
  }
}
