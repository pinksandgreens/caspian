view: social_facebook_advanced_posts {
  sql_table_name: publications.social_facebook_advanced_posts ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  # - measure: angry_count
  #   type: sum
  #   sql: |
  #     CASE
  #       WHEN ${TABLE}.angry_count = 'NA' THEN '0'
  #       ELSE ${TABLE}.angry_count
  #     END
  #   drill_fields: [post_details*]

  measure: comments_count {
    type: sum
    sql: ${TABLE}.comments ;;
    drill_fields: [post_details*]
  }

  dimension_group: created_time {
    label: "Created"
    type: time
    sql: ${TABLE}.created_time::timestamp ;;
  }

  dimension: from_name {
    label: "Brand Name"
    type: string
    sql: CASE ${TABLE}.from_name
        WHEN 'Absolute Radio' THEN 'Absolute Radio'
        WHEN 'CAR Magazine' THEN 'Car Magazine'
        WHEN 'CFM Radio' THEN 'CFM Radio'
        WHEN 'Closer Magazine' THEN 'Closer'
        WHEN 'Clyde 1' THEN 'Clyde 1'
        WHEN 'Cool FM' THEN 'Cool FM'
        WHEN 'Empire Magazine' THEN 'Empire'
        WHEN 'Forth 1' THEN 'Forth 1'
        WHEN 'Free Radio' THEN 'Free'
        WHEN 'Gem 106' THEN 'Gem 106'
        WHEN 'Grazia UK' THEN 'Grazia'
        WHEN 'Hallam FM' THEN 'Hallam FM'
        WHEN 'heat' THEN 'Heat'
        WHEN 'Kerrang!' THEN 'Kerrang'
        WHEN 'Kerrang! Radio' THEN 'Kerrang! 105.2'
        WHEN 'Key103' THEN 'Key 103'
        WHEN 'Kiss FM (UK)' THEN 'Kiss'
        WHEN 'KISS FM (UK)' THEN 'Kiss'
        WHEN 'Magic Radio' THEN 'Magic'
        WHEN 'Metro Radio' THEN 'Metro Radio'
        WHEN 'MFR' THEN 'MFR'
        WHEN 'Mother&Baby' THEN 'Mother & Baby'
        WHEN 'Motorcycle News' THEN 'Motorcycle News'
        WHEN 'Northsound 1' THEN 'Northsound 1'
        WHEN 'Planet Rock' THEN 'Planet Rock'
        WHEN '96.3 Radio Aire' THEN 'Radio Aire'
        WHEN 'Radio Borders' THEN 'Radio Borders'
        WHEN 'Radio City 96.7' THEN 'Radio City'
        WHEN '97.4 Rock FM' THEN 'Rock FM'
        WHEN 'Tay FM' THEN 'Tay FM'
        WHEN 'TFM' THEN 'TFM Radio'
        WHEN 'The Debrief' THEN 'The Debrief'
        WHEN '96.9 Viking FM' THEN 'Viking FM'
        ELSE ${TABLE}.from_name
      END
       ;;
  }

  # - measure: haha_count
  #   type: sum
  #   sql: |
  #     CASE
  #       WHEN ${TABLE}.haha_count = 'NA' THEN '0'
  #       ELSE ${TABLE}.haha_count
  #     END
  #   drill_fields: [post_details*]

  # - measure: likes_count
  #   type: sum
  #   sql: |
  #     CASE
  #       WHEN ${TABLE}.likes_count = 'NA' THEN '0'
  #       ELSE ${TABLE}.likes_count
  #     END
  #   drill_fields: [post_details*]

  dimension: link {
    label: "Link"
    hidden: no
    type: string
    sql: ${TABLE}.permalink_url ;;
    html: <a href="{{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
      ;;
  }

  # - measure: love_count
  #   type: sum
  #   sql: |
  #     CASE
  #       WHEN ${TABLE}.love_count = 'NA' THEN '0'
  #       ELSE ${TABLE}.love_count
  #     END
  #   drill_fields: [post_details*]

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  measure: post_clicks {
    type: sum
    sql: ${TABLE}.post_clicks ;;
    drill_fields: [post_details*]
  }

  measure: post_org_reach {
    type: sum
    sql: ${TABLE}.post_org_reach ;;
    drill_fields: [post_details*]
  }

  measure: post_paid_reach {
    type: sum
    sql: ${TABLE}.post_paid_reach ;;
    drill_fields: [post_details*]
  }

  measure: post_reach {
    type: sum
    sql: ${TABLE}.post_reach ;;
    drill_fields: [post_details*]
  }

  measure: post_reach_unique {
    type: sum
    sql: ${TABLE}.post_reach_unique ;;
    drill_fields: [post_details*]
  }

  measure: post_video_avg_time_watched {
    label: "Post Avg Video View Time (sec)"
    type: average
    sql: ${TABLE}.post_video_avg_time_watched/1000 ;;
  }

  measure: post_video_view_time {
    label: "Post Video View Time (sec)"
    type: sum
    sql: ${TABLE}.post_video_view_time/1000 ;;
  }

  measure: post_video_views_10s {
    type: sum
    sql: ${TABLE}.post_video_views_10s ;;
  }

  measure: post_video_views_unique {
    type: sum
    sql: ${TABLE}.post_video_views_unique ;;
  }

  measure: post_viral_reach {
    type: sum
    sql: ${TABLE}.post_viral_reach ;;
    drill_fields: [post_details*]
  }

  # - measure: sad_count
  #   type: sum
  #   sql: |
  #     CASE
  #       WHEN ${TABLE}.sad_count = 'NA' THEN '0'
  #       ELSE ${TABLE}.sad_count
  #     END
  #   drill_fields: [post_details*]

  measure: shares_count {
    type: sum
    sql: CASE
        WHEN ${TABLE}.shares = 'NA' THEN '0'
        ELSE ${TABLE}.shares
      END
       ;;
    drill_fields: [post_details*]
  }

  # - dimension: story
  #   type: string
  #   sql: ${TABLE}.story

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  # - measure: wow_count
  #   type: sum
  #   sql: |
  #     CASE
  #       WHEN ${TABLE}.wow_count = 'NA' THEN '0'
  #       ELSE ${TABLE}.wow_count
  #     END
  #   drill_fields: [post_details*]

  measure: reactions_count {
    label: "Reactions Total"
    type: sum
    sql: ${TABLE}.reactions_total ;;
    drill_fields: [post_details*]
  }

  measure: number_of_posts {
    type: count_distinct
    sql: ${TABLE}.id ;;
    drill_fields: [post_details*]
  }

  measure: post_clicks_video {
    type: sum
    sql: ${TABLE}.post_clicks_video ;;
    drill_fields: [post_details*]
  }

  # - measure: post_clicks_other
  #   type: sum
  #   sql: ${TABLE}.post_clicks_other
  #   drill_fields: [post_details*]

  measure: post_clicks_photo {
    type: sum
    sql: ${TABLE}.post_clicks_photo ;;
    drill_fields: [post_details*]
  }

  measure: post_clicks_link {
    type: sum
    sql: ${TABLE}.post_clicks_link ;;
    drill_fields: [post_details*]
  }

  dimension: image_filewow {
    hidden: yes
    sql: ${TABLE}.picture ;;
  }

  dimension: image_filelike2 {
    label: "Image"
    hidden: no
    sql: ${image_filewow} ;;
    html: <img src="{{ value }}" width="40" 0height="40"/>;;
  }

  set: post_details {
    fields: [
      created_time_time,
      type,
      from_name,
      message,
      image_filelike2,
      link,
      post_clicks,
      post_clicks_link,
      reactions_count,
      comments_count,
      shares_count,
      post_reach,
      post_reach_unique
    ]
  }
}
