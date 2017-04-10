view: social_youtube_trending {
  sql_table_name: publications.social_youtube_trending ;;

  dimension: channel_id {
    type: string
    sql: SPLIT_PART(${TABLE}.channel_id, '|', 1) ;;
  }

  dimension: video_id {
    type: string
    sql: SPLIT_PART(${TABLE}.channel_id, '|', 2) ;;
  }

  dimension: channel_title {
    type: string
    sql: ${TABLE}.channel_title ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: published {
    type: string
    sql: ${TABLE}.published ;;
  }

  dimension: image_filewow {
    hidden: yes
    sql: ${TABLE}.thumbnail ;;
  }

  dimension: image_filelike2 {
    label: "Image"
    hidden: no
    sql: ${image_filewow} ;;
    html: <img src="{{ value }}" width="40" 0height="40"/>;;
  }

  dimension: link {
    label: "Link"
    hidden: no
    type: string
    sql: SPLIT_PART(${TABLE}.channel_id, '|', 2) ;;
    html: <a href="https://www.youtube.com/watch?v={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
      ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: trending_rating {
    type: sum
    sql: ${TABLE}.trending_rating ;;
  }

}
