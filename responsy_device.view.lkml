view: responsy_device {
  label: "2b. Email Device Data"
  sql_table_name: responsys.lm_device_data_24h ;;
  ################################

  dimension: concat_id {
    type: string
    hidden: yes
    sql: ${TABLE}.concat_id ;;
  }

  dimension: email_address {
    type: string
    hidden: yes
    sql: ${TABLE}.email_address ;;
  }

  dimension: riid {
    type: string
    hidden: yes
    sql: ${TABLE}.riid ;;
  }

  ################################

  dimension: operating_system {
    type: string
    sql: CASE
        WHEN ${TABLE}.operating_system LIKE '%IOS%' THEN 'iOS'
        WHEN ${TABLE}.operating_system LIKE '%iOS%' THEN 'iOS'
        WHEN ${TABLE}.operating_system LIKE '%Android%' THEN 'Android'
        WHEN ${TABLE}.operating_system LIKE '%Windows%' THEN 'Windows'
        WHEN ${TABLE}.operating_system LIKE '%Linux%' THEN 'Linux'
        ELSE 'Unknown'
      END
       ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.form_factor ;;
  }
}
