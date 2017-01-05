- view: social_twitter_trending_adv
  sql_table_name: publications.social_twitter_trending_adv
  fields:

  - dimension: place
    type: string
    sql: ${TABLE}.place

  - dimension: query
    hidden: TRUE
    type: string
    sql: ${TABLE}.query

  - dimension: trend
    type: string
    sql: ${TABLE}.trend

  - dimension: tweet_volume
    type: sum
    sql: ${TABLE}.tweet_volume

  - dimension: url
    type: string
    sql: ${TABLE}.url
    html: |
      <a href="{{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>


