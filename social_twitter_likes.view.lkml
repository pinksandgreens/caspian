view: social_twitter_likes {
  sql_table_name: publications.social_twitter_likes ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    label: "Brand"
    type: string
    sql: CASE ${TABLE}.name
        WHEN 'Key 103 News' THEN 'Key 103'
        WHEN 'Northsound 1' THEN 'Northsound 1'
        WHEN 'Kiss FM (UK)' THEN 'Kiss'
        WHEN 'Kiss FM (UK) ??????' THEN 'Kiss'
        WHEN '96.3 Radio Aire' THEN 'Radio Aire'
        WHEN 'Radio Borders' THEN 'Radio Borders'
        WHEN 'Radio City 96.7' THEN 'Radio City'
        WHEN 'Rock FM' THEN 'Rock FM'
        WHEN 'Clyde 1' THEN 'Clyde 1'
        WHEN 'Cool FM' THEN 'Cool FM'
        WHEN 'Forth 1' THEN 'Forth 1'
        WHEN 'Hallam FM' THEN 'Hallam FM'
        WHEN 'Magic' THEN 'Magic'
        WHEN 'Magic ??????' THEN 'Magic'
        WHEN 'Metro Radio' THEN 'Metro Radio'
        WHEN 'MFR' THEN 'MFR'
        WHEN 'Tay FM' THEN 'Tay FM'
        WHEN 'TFM' THEN 'TFM Radio'
        WHEN 'Absolute Radio' THEN 'Absolute Radio'
        WHEN 'CFM Radio' THEN 'CFM Radio'
        WHEN 'Empire Magazine' THEN 'Empire'
        WHEN 'Parkers' THEN 'Parkers'
        WHEN 'heat & heatworld.com' THEN 'Heat'
        WHEN 'CAR magazine' THEN 'Car Magazine'
        WHEN 'Motorcycle News' THEN 'Motorcycle News'
        WHEN 'Closer Mag & Online' THEN 'Closer'
        WHEN 'Grazia UK' THEN 'Grazia'
        WHEN 'The Debrief' THEN 'The Debrief'
        WHEN 'Viking FM' THEN '96.9 Viking FM'
        WHEN 'Top Sant? magazine' THEN 'Top Sante'
        WHEN 'Kerrang! Magazine' THEN 'Kerrang'
        WHEN 'Q Magazine' THEN 'Q'
        WHEN 'MATCH Magazine' THEN 'Match'
        WHEN 'Mother&Baby' THEN 'Mother & Baby'
        ELSE ${TABLE}.name
      END
       ;;
  }

  dimension: url {
    type: number
    sql: ${TABLE}.url ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  measure: statusesCount {
    label: "Statuses Count"
    type: sum
    sql: ${TABLE}.statusesCount ;;
  }

  measure: followersCount {
    label: "Followers Count"
    type: sum
    sql: ${TABLE}.followersCount ;;
  }

  measure: favouritesCount {
    label: "Tweet Favourite Count"
    type: sum
    sql: ${TABLE}.favoritesCount ;;
  }

  measure: friendsCount {
    label: "Twitter Friends Count"
    type: sum
    sql: ${TABLE}.friendsCount ;;
  }

  measure: Twitter_Engagement {
    value_format: "#.00%"
    type: number
    sql: ${social_twitter_likes.favouritesCount}/${social_twitter_likes.statusesCount} ;;
  }
}
