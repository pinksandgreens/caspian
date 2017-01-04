- view: social_pinterest
  sql_table_name: publications.social_pinterest
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: bio
    type: string
    sql: ${TABLE}.bio

  - dimension: created_at
    type: string
    sql: ${TABLE}.created_at


  - dimension: brand
    type: string
    sql: |
      CASE ${TABLE}.names
        WHEN 'vikingfm' THEN '96.9 Viking FM'
        WHEN 'AbsoluteRadio' THEN 'Absolute Radio'
        WHEN 'CARmagazine' THEN 'Car Magazine'
        WHEN 'cfmradio' THEN 'CFM Radio'
        WHEN 'closermag' THEN 'Closer'
        WHEN 'clyde1' THEN 'Clyde 1'
        WHEN 'officialcoolfm' THEN 'Cool FM'
        WHEN 'empiremagazine' THEN 'Empire'
        WHEN 'forthone' THEN 'Forth 1'
        WHEN 'GraziaUK' THEN 'Grazia UK'
        WHEN 'hallamfm' THEN 'Hallam FM'
        WHEN 'heatworld' THEN 'Heat'
        WHEN 'key103' THEN 'Key 103'
        WHEN 'KissFMUK' THEN 'Kiss'
        WHEN 'Kiss FM (UK) ??????' THEN 'Kiss'
        WHEN 'magicradio' THEN 'Magic'
        WHEN 'Magic ??????' THEN 'Magic'
        WHEN 'metroradiouk' THEN 'Metro Radio'
        WHEN 'MorayFirthRadio' THEN 'MFR'
        WHEN 'MotorcycleNews' THEN 'Motorcycle News'
        WHEN 'northsound1' THEN 'Northsound 1'
        WHEN 'ParkersCarBuying' THEN 'Parkers'
        WHEN 'radioaire' THEN 'Radio Aire'
        WHEN 'radioborders' THEN 'Radio Borders'
        WHEN 'radiocity' THEN 'Radio City'
        WHEN '974rockfm' THEN 'Rock FM'
        WHEN 'tayfm' THEN 'Tay FM'
        WHEN 'tfmradio' THEN 'TFM Radio'
        WHEN 'thedebrief' THEN 'The Debrief'
        WHEN 'Top Sante' THEN 'Top Sante'
        WHEN 'Kerrang' THEN 'Kerrang'
        WHEN 'Q' THEN 'Q'
        WHEN 'Match' THEN 'Match'
        WHEN 'Mother & Baby' THEN 'Mother & Baby'
      ELSE ${TABLE}.names
      END


  - dimension: url
    type: string
    sql: ${TABLE}.url


  - measure: pins
    type: sum
    sql: ${TABLE}.pins

  - measure: followers
    type: sum
    sql: ${TABLE}.followers

#   - measure: following
#     type: sum
#     sql: ${TABLE}.following

#   - measure: likes
#     type: sum
#     sql: ${TABLE}.likes
    
  - measure: boards
    type: sum
    sql: ${TABLE}.boards

