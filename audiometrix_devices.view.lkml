view: audiometrix_devices {
  sql_table_name: publications.audiometrix_devices ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  measure: active_sessions {
    type: sum
    sql: ${TABLE}.active_sessions ;;
  }

  measure: avg_active_sessions {
    type: average
    sql: ${TABLE}.avg_active_sessions ;;
  }

  measure: hours_spent_listening_per_session {
    type: number
    sql: ${total_listening_hours}/${active_sessions};;
  }

  measure: bounce_rate {
    type: average
    sql: ${TABLE}.bounce_rate ;;
  }

  dimension_group: date {
    label: "Recorded"
    type: time
    timeframes: [day_of_week, date, week, month]
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  measure: session_requests {
    type: sum
    sql: ${TABLE}.session_requests ;;
  }



  measure: total_listening_hours {
    type: sum
    sql: ${TABLE}.total_listening_hours ;;
  }

  dimension: brand_code {
    type: string
    sql: CASE
        WHEN ${TABLE}.brand = 'Absolute Classic Rock' THEN 'ABR'
        WHEN ${TABLE}.brand = 'Absolute Radio' THEN 'ABR'
        WHEN ${TABLE}.brand = 'Absolute Radio 00s' THEN 'ABR'
        WHEN ${TABLE}.brand = 'Absolute Radio 60s' THEN 'ABR'
        WHEN ${TABLE}.brand = 'Absolute Radio 70s,' THEN 'ABR'
        WHEN ${TABLE}.brand = 'Absolute Radio 80s' THEN 'ABR'
        WHEN ${TABLE}.brand = 'Absolute Radio 90s' THEN 'ABR'
        WHEN ${TABLE}.brand = 'CFM Radio' THEN 'CFM'
        WHEN ${TABLE}.brand = 'City Talk' THEN 'CTK'
        WHEN ${TABLE}.brand = 'Clyde 1' THEN 'CL1'
        WHEN ${TABLE}.brand = 'Clyde 2' THEN 'CL2'
        WHEN ${TABLE}.brand = 'Clyde 3' THEN 'CL3'
        WHEN ${TABLE}.brand = 'Cool FM' THEN 'COO'
        WHEN ${TABLE}.brand = 'Downtown Country' THEN 'DOW'
        WHEN ${TABLE}.brand = 'Downtown Radio' THEN 'DTC'
        WHEN ${TABLE}.brand = 'Forth 1' THEN 'FO1'
        WHEN ${TABLE}.brand = 'Forth 2' THEN 'FO2'
        WHEN ${TABLE}.brand = 'Forth 3' THEN 'FO3'
        WHEN ${TABLE}.brand = 'Hallam 2' THEN 'HA2'
        WHEN ${TABLE}.brand = 'Hallam 3' THEN 'HA3'
        WHEN ${TABLE}.brand = 'Hallam FM' THEN 'HAL'
        WHEN ${TABLE}.brand = 'Kerrang Radio' THEN 'KRR'
        WHEN ${TABLE}.brand = 'Key 103' THEN 'KEY'
        WHEN ${TABLE}.brand = 'Key 2' THEN 'KE2'
        WHEN ${TABLE}.brand = 'Key 3' THEN 'KE3'
        WHEN ${TABLE}.brand = 'KISS' THEN 'KIS'
        WHEN ${TABLE}.brand = 'Kiss Fresh' THEN 'KIS'
        WHEN ${TABLE}.brand = 'Kisstory' THEN 'KIS'
        WHEN ${TABLE}.brand = 'Magic' THEN 'MAG'
        WHEN ${TABLE}.brand = 'Magic Chilled' THEN 'MAG'
        WHEN ${TABLE}.brand = 'Magic Soul' THEN 'MAG'
        WHEN ${TABLE}.brand = 'Mellow Magic' THEN 'MAG'
        WHEN ${TABLE}.brand = 'Metro Radio' THEN 'MET'
        WHEN ${TABLE}.brand = 'Metro Radio 2' THEN 'ME2'
        WHEN ${TABLE}.brand = 'Metro Radio 3' THEN 'ME3'
        WHEN ${TABLE}.brand = 'MFR' THEN 'MFR'
        WHEN ${TABLE}.brand = 'MFR 2' THEN 'MF2'
        WHEN ${TABLE}.brand = 'MFR 3' THEN 'MF3'
        WHEN ${TABLE}.brand = 'North Sound 2' THEN 'NO2'
        WHEN ${TABLE}.brand = 'Northsound 1' THEN 'NO1'
        WHEN ${TABLE}.brand = 'Planet Rock' THEN 'PLR'
        WHEN ${TABLE}.brand = 'Radio Aire' THEN 'AIR'
        WHEN ${TABLE}.brand = 'Radio Aire 2' THEN 'AI2'
        WHEN ${TABLE}.brand = 'Radio Aire 3' THEN 'AI3'
        WHEN ${TABLE}.brand = 'Radio Borders' THEN 'RBO'
        WHEN ${TABLE}.brand = 'Radio City' THEN 'RCT'
        WHEN ${TABLE}.brand = 'Radio City 2' THEN 'RC2'
        WHEN ${TABLE}.brand = 'Radio City 3' THEN 'RC3'
        WHEN ${TABLE}.brand = 'Rock FM 2' THEN 'RO2'
        WHEN ${TABLE}.brand = 'Rock FM 3' THEN 'RO3'
        WHEN ${TABLE}.brand = 'RockFM' THEN 'ROC'
        WHEN ${TABLE}.brand = 'Tay 2' THEN 'TA2'
        WHEN ${TABLE}.brand = 'Tay 3' THEN 'TA3'
        WHEN ${TABLE}.brand = 'Tay FM' THEN 'TAF'
        WHEN ${TABLE}.brand = 'TFM' THEN 'TFM'
        WHEN ${TABLE}.brand = 'TFM 2' THEN 'TF2'
        WHEN ${TABLE}.brand = 'TFM 3' THEN 'TF3'
        WHEN ${TABLE}.brand = 'The Hits Radio' THEN 'HIT'
        WHEN ${TABLE}.brand = 'Viking 2' THEN 'VI2'
        WHEN ${TABLE}.brand = 'Viking 3' THEN 'VI3'
        WHEN ${TABLE}.brand = 'Viking FM' THEN 'VIK'
        WHEN ${TABLE}.brand = 'Wave 105.2 FM' THEN 'WVE'
        WHEN ${TABLE}.brand = 'West FM' THEN 'WES'
        WHEN ${TABLE}.brand = 'West Sound' THEN 'WST'
        WHEN ${TABLE}.brand = 'Westsound FM' THEN 'WSF'
        WHEN ${TABLE}.brand = 'Heat Radio' THEN 'HEA'
        ELSE ${TABLE}.brand
      END
       ;;
  }


  dimension: brand_country {
    type: string
    sql: CASE
        WHEN ${TABLE}.brand LIKE '%(NO)%' THEN 'Norway'
        WHEN ${TABLE}.brand LIKE '%(DK)%' THEN 'Denmark'
        ELSE 'United Kingdom'
      END
       ;;
  }

  dimension: brand_network {
    type: string
    sql: CASE
        WHEN ${TABLE}.brand = 'Absolute Classic Rock' THEN 'Absolute'
        WHEN ${TABLE}.brand = 'Absolute Radio' THEN 'Absolute'
        WHEN ${TABLE}.brand = 'Absolute Radio 00s' THEN 'Absolute'
        WHEN ${TABLE}.brand = 'Absolute Radio 60s' THEN 'Absolute'
        WHEN ${TABLE}.brand = 'Absolute Radio 70s,' THEN 'Absolute'
        WHEN ${TABLE}.brand = 'Absolute Radio 80s' THEN 'Absolute'
        WHEN ${TABLE}.brand = 'Absolute Radio 90s' THEN 'Absolute'
        WHEN ${TABLE}.brand = 'CFM Radio' THEN 'BCN'
        WHEN ${TABLE}.brand = 'City Talk' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Clyde 1' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Clyde 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Clyde 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Cool FM' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Downtown Country' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Downtown Radio' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Forth 1' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Forth 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Forth 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Hallam 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Hallam 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Hallam FM' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Kerrang Radio' THEN 'Kerrang'
        WHEN ${TABLE}.brand = 'Key 103' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Key 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Key 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'KISS' THEN 'Kiss'
        WHEN ${TABLE}.brand = 'Kiss Fresh' THEN 'Kiss'
        WHEN ${TABLE}.brand = 'Kisstory' THEN 'Kiss'
        WHEN ${TABLE}.brand = 'Magic' THEN 'Magic'
        WHEN ${TABLE}.brand = 'Magic Chilled' THEN 'Magic'
        WHEN ${TABLE}.brand = 'Magic Soul' THEN 'Magic'
        WHEN ${TABLE}.brand = 'Mellow Magic' THEN 'Magic'
        WHEN ${TABLE}.brand = 'Metro Radio' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Metro Radio 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Metro Radio 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'MFR' THEN 'BCN'
        WHEN ${TABLE}.brand = 'MFR 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'MFR 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'North Sound 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Northsound 1' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Planet Rock' THEN 'Planet Rock'
        WHEN ${TABLE}.brand = 'Radio Aire' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Radio Aire 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Radio Aire 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Radio Borders' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Radio City' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Radio City 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Radio City 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Rock FM 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Rock FM 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'RockFM' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Tay 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Tay 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Tay FM' THEN 'BCN'
        WHEN ${TABLE}.brand = 'TFM' THEN 'BCN'
        WHEN ${TABLE}.brand = 'TFM 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'TFM 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'The Hits Radio' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Viking 2' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Viking 3' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Viking FM' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Wave 105.2 FM' THEN 'BCN'
        WHEN ${TABLE}.brand = 'West FM' THEN 'BCN'
        WHEN ${TABLE}.brand = 'West Sound' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Westsound FM' THEN 'BCN'
        WHEN ${TABLE}.brand = 'Heat Radio' THEN 'Heat'
        ELSE ${TABLE}.brand
      END
       ;;
  }
}
