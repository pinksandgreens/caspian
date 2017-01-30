view: social_twitter_posts {
  sql_table_name: publications.social_twitter_posts ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension_group: date_created {
    label: "Created"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created ;;
  }

  measure: favourites {
    type: sum
    sql: ${TABLE}.favourites ;;
  }

  measure: retweets {
    type: sum
    sql: ${TABLE}.retweets ;;
  }

  dimension: tweet_content {
    type: string
    sql: ${TABLE}.tweet_content ;;
  }
}
