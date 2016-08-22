- view: social_twitter_posts
  sql_table_name: publications.social_twitter_posts
  fields:

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: date_created
    type: string
    sql: ${TABLE}.date_created

  - dimension: favourites
    type: string
    sql: ${TABLE}.favourites

  - dimension: retweets
    type: string
    sql: ${TABLE}.retweets

  - dimension: tweet_content
    type: string
    sql: ${TABLE}.tweet_content

  - measure: count
    type: count
    drill_fields: []

