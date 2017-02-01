view: ga_radio_twitter_data {
  sql_table_name: publications.ga_radio_twitter_data ;;
  label: "Twitter Data"

  dimension: id {
    label: "Brand Twitter ID"
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    label: "Brand"
    type: string
    sql: CASE ${TABLE}.brand
        WHEN 'Key103' THEN 'Key 103'
        WHEN 'Northsound 1' THEN 'Northsound 1'
        WHEN 'Kiss FM (UK)' THEN 'Kiss'
        WHEN '96.3 Radio Aire' THEN 'Radio Aire'
        WHEN 'Radio Borders' THEN 'Radio Borders'
        WHEN 'Radio City 96.7' THEN 'Radio City'
        WHEN '97.4 Rock FM' THEN 'Rock FM'
        WHEN 'Clyde 1' THEN 'Clyde 1'
        WHEN 'Cool FM' THEN 'Cool FM'
        WHEN 'Forth 1' THEN 'Forth 1'
        WHEN 'Hallam FM' THEN 'Hallam FM'
        WHEN 'Magic Radio' THEN 'Magic'
        WHEN 'Metro Radio' THEN 'Metro Radio'
        WHEN 'MFR' THEN 'MFR'
        WHEN 'Tay FM' THEN 'Tay FM'
        WHEN 'TFM' THEN 'TFM Radio'
        WHEN 'Absolute Radio' THEN 'Absolute Radio'
        WHEN 'CFM Radio' THEN 'CFM Radio'
      END
       ;;
  }

  measure: favourites_count {
    label: "Twitter Favourites"
    type: number
    sql: sum(${TABLE}.favourites_count) ;;
    drill_fields: [brand, favourites_count, followers_count, statuses_count]
  }

  measure: followers_count {
    label: "Twitter Followers"
    type: number
    sql: avg(${TABLE}.followers_count) ;;
    drill_fields: [brand, favourites_count, followers_count, statuses_count]
  }

  #  - dimension: name
  #    type: string
  #    sql: ${TABLE}.name

  measure: statuses_count {
    label: "Number of Tweets"
    type: number
    sql: sum(${TABLE}.statuses_count) ;;
    drill_fields: [brand, favourites_count, followers_count, statuses_count]
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
