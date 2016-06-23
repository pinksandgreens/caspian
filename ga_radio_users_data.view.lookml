- view: ga_radio_users_data
  sql_table_name: publications.ga_radio_users_data
  fields:

  - dimension: brand
    label: 'Brand'
    type: string
    sql: |
      CASE ${TABLE}.brand
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
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/25?Brand={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)

  - measure: likes
    label: 'Facebook Likes'
    type: number
    sql: avg(${TABLE}.likes)
    drill_fields: soc_drill_set_1*

  - measure: mobile_social_monthly_uvs
    label: 'Mobile Social Unique Visitors (Monthly)'
    type: number
    sql: sum(${TABLE}."mobile.social.monthly.uvs")
    drill_fields: soc_drill_set_1*

  - measure: monthly_uvs
    label: 'Social Unique Visitors (Monthly)'
    type: number
    sql: sum(${TABLE}."monthly.uvs")
    drill_fields: soc_drill_set_1*

  - measure: radio_play_sessions
    label: 'Radioplay Sessions'
    type: number
    sql: sum(${TABLE}."radio.play.sessions")
    drill_fields: soc_drill_set_1*

  - measure: radioplay_montly_uvs
    label: 'Radioplay Unique Visitors (Monthly)'
    type: number
    sql: sum(${TABLE}."radioplay.montly.uvs")
    drill_fields: soc_drill_set_1*

  - dimension: yearmonth
    label: 'Year/Month (Monthly)'
    type: string
    sql: ${TABLE}.yearmonth

  - measure: count
    type: count
    drill_fields: []

  sets:
    soc_drill_set_1:                              
      - brand
      - yearmonth
      - monthly_uvs
      - radio_play_sessions
      - likes
      - ga_radio_twitter_data.followers_count
