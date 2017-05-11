view: youtube_videos {

  sql_table_name: (SELECT video_id FROM [uplifted-light-89310:Youtube.p_content_owner_basic_a3_Youtube] GROUP BY video_id);;


  dimension: video_id {
    primary_key: yes
    label: "Video_ID"
    sql: ${TABLE}.video_id;;
  }

measure: count {
  type: count
}

  }
