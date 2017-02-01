#X# Note: failed to preserve comments during New LookML conversion
view: responsy_active {
  label: "2a. Email Data"
  sql_table_name: responsys.lm_ced_replacement_24h ;;

  dimension: marketing_strategy {
    type: string
    sql: CASE
        WHEN ${TABLE}.marketing_strategy = ' ' THEN NULL
        WHEN ${TABLE}.marketing_strategy = 'Car Magazine' THEN NULL
        WHEN ${TABLE}.marketing_strategy = 'LandScape' THEN NULL
        WHEN ${TABLE}.marketing_strategy = 'Motorcycle News' THEN NULL
        WHEN ${TABLE}.marketing_strategy = 'Parkers' THEN NULL
        WHEN ${TABLE}.marketing_strategy = 'Todays Golfer' THEN NULL
        ELSE ${TABLE}.marketing_strategy
      END
       ;;
  }

  dimension: marketing_program {
    type: string
    sql: CASE
        WHEN ${TABLE}.marketing_program = ' ' THEN NULL
        ELSE ${TABLE}.marketing_program
      END
       ;;
  }

  dimension: bounce_type {
    type: string
    sql: ${TABLE}.bounce_type ;;
  }

  dimension: unsub_type {
    type: string
    sql: CASE
        WHEN ${TABLE}.unsub_type = 'LEGA' THEN 'Brand'
        WHEN ${TABLE}.unsub_type = 'BRAN' THEN 'Brand'
        WHEN ${TABLE}.unsub_type = 'NEWS' THEN 'Newsletter'
        WHEN ${TABLE}.unsub_type = 'BAUR' THEN 'Bauer'
        WHEN ${TABLE}.unsub_type = 'THRD' THEN 'Third Party'
        ELSE ${TABLE}.unsub_type
      END
       ;;
  }

  dimension_group: launch_date {
    label: "Sent"
    type: time
    timeframes: [date, week, month, month_num]
    sql: ${TABLE}.launch_date ;;
  }

  dimension_group: open_date {
    label: "Open"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.open_date ;;
  }

  dimension_group: click_date {
    label: "Click"
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.click_date ;;
  }

  dimension: open_date_not_null {
    label: "Unique Opens"
    hidden: yes
    type: string
    sql: CASE
       WHEN ${TABLE}.open_date IS NULL THEN '0'
       ELSE '1'
      END
       ;;
  }

  dimension: launch_id {
    type: string
    label: "Launch ID"
    sql: ${TABLE}.launch_id ;;
  }

  dimension: launch_name {
    label: "Campaign Name"
    type: string
    sql: ${TABLE}.launch_name ;;
    html: {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/54?Timeframe=21%20weeks&Campaign%20code:={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
      ;;
  }

  dimension: email_type {
    type: string
    sql: CASE
        WHEN ${TABLE}.launch_name LIKE '%-E-B-%' THEN 'Newsletter'
        WHEN ${TABLE}.launch_name LIKE '%-E-M-%' THEN 'Marketing'
        WHEN ${TABLE}.launch_name LIKE '%-E-C-%' THEN 'Commercial'
      END
       ;;
  }

  dimension: Launch_Brand {
    label: "Brand Sent"
    type: string
    sql: substring(UPPER(${TABLE}.launch_name),1,3) ;;
  }

  dimension: concatid {
    type: string
    hidden: no
    description: "Non-Unique Indentifier"
    sql: ${TABLE}.concat_id ;;
  }

  dimension: open_date_not_null2 {
    label: "Unique Clicks"
    hidden: yes
    type: string
    sql: CASE
       WHEN to_char(${TABLE}.open_date, 'YYYY-MM-DD') IS NULL THEN 'Null'
       ELSE to_char(${TABLE}.open_date, 'YYYY-MM-DD')
      END
       ;;
  }

  dimension: click_date_not_null2 {
    label: "Unique Clicks"
    hidden: yes
    type: string
    sql: CASE
       WHEN to_char(${TABLE}.click_date, 'YYYY-MM-DD') IS NULL THEN 'Null'
       ELSE to_char(${TABLE}.click_date, 'YYYY-MM-DD')
      END
       ;;
  }

  dimension: unique_id {
    type: string
    hidden: no
    primary_key: yes
    description: "Unique Indentifier"
    sql: ${TABLE}.concat_id || '-' || ${TABLE}.launch_date || ${open_date_not_null2} || ${click_date_not_null2} ;;
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

  measure: Uniqe_Send_Count {
    label: "Unique Sends"
    type: count_distinct
    sql: ${TABLE}.concat_id ;;
  }

  measure: Delivered_Rate {
    label: "Delivered Count"
    type: number
    sql: ${Uniqe_Send_Count}-${Bounce_Count} ;;
  }

  measure: Uniqe_Send_Count_Without_Bounces {
    hidden: yes
    label: "Not for human eyes"
    type: count_distinct
    sql: ${TABLE}.concat_id ;;

    filters: {
      field: bounce_type
      value: "-'H',-'S'"
    }
  }

  measure: Open_Count {
    type: sum
    sql: CASE
        WHEN ${TABLE}.open_count >0 THEN ${TABLE}.open_count
      END
       ;;
  }

  measure: Click_Count {
    type: sum
    sql: CASE
        WHEN ${TABLE}.click_count >0 THEN ${TABLE}.click_count
      END
       ;;
  }

  dimension: responder_clicks {
    label: "Unique Clicks"
    hidden: yes
    type: string
    sql: CASE
       WHEN ${TABLE}.click_date IS NULL THEN 0
       ELSE 1
      END
       ;;
  }

  measure: Responders {
    type: sum_distinct
    sql_distinct_key: ${unique_id} ;;
    sql: ${responder_clicks} ;;
  }

  dimension: responder_opens {
    label: "Unique Opens"
    hidden: yes
    type: string
    sql: CASE
       WHEN ${TABLE}.open_count >0 THEN 1
       WHEN ${TABLE}.open_count IS NULL THEN 0
       ELSE 0
      END
       ;;
  }

  measure: Open_Count_Unique {
    label: "Unique Opens"
    type: sum_distinct
    sql_distinct_key: ${unique_id} ;;
    sql: ${responder_opens} ;;
  }

  dimension: click_date_not_null {
    label: "Unique Clicks"
    hidden: yes
    type: string
    sql: CASE
       WHEN ${TABLE}.click_date IS NULL THEN '0'
       ELSE '1'
      END
       ;;
  }

  measure: Click_Count_Unique {
    label: "Unique Clicks"
    type: number
    sql: CASE
        WHEN sum(${click_date_not_null}) >0 THEN sum(${click_date_not_null})
        ELSE 0
      END
       ;;
  }

  measure: Click_to_Open_Rate {
    label: "Responder-to-Open Rate"
    type: number
    value_format: "0.00\%"
    sql: (${Click_Count_Unique}/${Open_Count_Unique})*100 ;;
  }

  measure: Send_to_Open_Rate {
    label: "Open Rate"
    type: number
    value_format: "0.00\%"
    sql: (${Open_Count_Unique}/${Delivered_Rate})*100 ;;
  }

  measure: Click_Through_Rate {
    label: "Click Rate"
    type: number
    value_format: "0.00\%"
    sql: (${Click_Count_Unique}/${Delivered_Rate})*100 ;;
  }

  measure: Clicks_Per_Responder {
    type: number
    value_format: "0.00"
    sql: (${Click_Count_Unique}/${Responders}) ;;
  }

  measure: Unsubscribe_Count {
    type: sum
    sql: ${TABLE}.unsub_count ;;
  }

  measure: Bounce_Count {
    type: sum
    sql: ${TABLE}.bounce_count ;;
  }

  measure: Unique_Send_Count_Commercial {
    hidden: yes
    label: "Not for human eyes"
    type: count_distinct
    sql: ${TABLE}.concat_id ;;

    filters: {
      field: marketing_program
      value: "Commercial, Marketing"
    }
  }

  measure: Conservative_Revenue_Estimate {
    type: number
    value_format: "\"£\"#,###"
    sql: ((${Unique_Send_Count_Commercial})*(0.0722727272727273)) ;;
  }
}
