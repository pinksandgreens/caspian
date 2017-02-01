view: social_reddit {
  sql_table_name: publications.social_reddit ;;

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: link1 {
    label: "Link"
    hidden: no
    type: string
    sql: ${TABLE}.reddit_url ;;
    html: <a href="{{ value }}" target="_new"><img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>;;
  }

  dimension: thread {
    type: string
    sql: ${TABLE}.thread ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  #     dimension: subreddit
  #         link:
  #         label: "{{value}}"
  #         url:"https://www.reddit.com/r/{{ value }}"
  #         sql: ${TABLE}.subr

  #       links:
  #         - label: Google
  #           url: http://www.google.com/search?q={{ value }}
  #           icon_url: http://google.com/favicon.ico
  #     sql: ${TABLE}.reddit_url
  #     html: |
  #       <a href="{{ value }}" target="_new">
  #       <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>


  measure: score {
    type: sum
    sql: ${TABLE}.source_score ;;
  }

  measure: comments_count {
    type: sum
    sql: ${TABLE}.source_comments ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }
}
