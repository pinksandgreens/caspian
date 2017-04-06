view: social_twitter_trending_adv {
  sql_table_name: publications.social_twitter_trending_adv ;;

  dimension: place {
    type: string
    sql: ${TABLE}.place ;;
  }

  dimension: query {
    hidden: yes
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: trend {
    type: string
    sql: ${TABLE}.trend ;;
  }

  measure: tweet_volume {
    type: sum
    sql: CASE
        WHEN ${TABLE}.tweet_volume = 'NA' THEN '10000'
        ELSE ${TABLE}.tweet_volume
      END
       ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
    html: <a href="{{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
      ;;
  }

}
