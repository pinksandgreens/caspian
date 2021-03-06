view: responsys_brand_permissions {
  sql_table_name: responsys.responsys_brand_permissions_temp ;;

  dimension: brandcode {
    type: string
    sql: CASE
        WHEN ${TABLE}.brandcode LIKE '%campaign_brand%' THEN NULL
        WHEN ${TABLE}.brandcode LIKE '%BRANDCODE%' THEN NULL
        WHEN ${TABLE}.brandcode LIKE '%ABR%' THEN NULL
        ELSE ${TABLE}.brandcode
      END
       ;;
  }

  # HIDING ABR HERE ^
  dimension_group: created_date {
    label: "Created"
    type: time
    timeframes: [day_of_week, date, week, month]
    convert_tz: no
    sql: TO_DATE(${TABLE}.created_date,'YYYY-MM-DD') ;;
  }

  dimension: email_address {
    type: string
    hidden: yes
    sql: ${TABLE}.email_address ;;
  }

  dimension_group: modified_date {
    label: "Updated"
    type: time
    timeframes: [day_of_week, date, week, month]
    convert_tz: no
    sql: TO_DATE(${TABLE}.modified_date,'YYYY-MM-DD') ;;
  }

  dimension: optin_date3223 {
    hidden: yes
    label: "OPTINSDNSDL"
    type: string
    sql: ${TABLE}.optin_date ;;
  }

  dimension: optin_date23233 {
    hidden: yes
    label: "UNSUBSDHSDS"
    type: string
    sql: ${TABLE}.unsub_date ;;
  }

  dimension: optin {
    type: string
    sql: CASE
        WHEN ${TABLE}.optin = '6' THEN '0'
        ELSE ${TABLE}.optin
      END
       ;;
  }

  dimension_group: optin_date {
    label: "Optin"
    type: time
    timeframes: [day_of_week, date, week, month]
    convert_tz: no
    sql: TO_DATE(${TABLE}.optin_date,'YYYY-MM-DD') ;;
  }

  dimension_group: unsub_date {
    label: "Unsub"
    type: time
    timeframes: [day_of_week, date, week, month]
    convert_tz: no
    sql: TO_DATE(${TABLE}.unsub_date,'YYYY-MM-DD') ;;
  }

  dimension: uukey123 {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  #   - dimension: uukey123
  #     type: string
  #     sql: ${TABLE}.email_address || ${TABLE}.brandcode


  measure: brand_optins {
    label: "Commercial/Marketing Optins"
    type: count_distinct
    sql: ${uukey123} ;;

    filters: {
      field: optin
      value: "1"
    }
  }

  dimension: optin_count1 {
    label: "Optins sddsaasddsa"
    hidden: yes
    type: string
    sql: CASE
       WHEN ${TABLE}.optin_date IS NULL THEN '0'
       WHEN ${TABLE}.optin_date = ' ' THEN '0'
       WHEN ((${TABLE}.optin_date IS NOT NULL) AND (${optin} = 1)) THEN '1'
      END
       ;;
  }

  #   - measure: optin_count
  #     label: 'Optin Count'
  #     type: number
  #     sql: |
  #       CASE
  #         WHEN sum(${optin_count1}) >0 THEN sum(${optin_count1})
  #         ELSE 0
  #       END

  measure: optin_count {
    label: "Optin Count"
    type: sum_distinct
    sql_distinct_key: ${email_address} || ${brandcode} ;;
    sql: CASE
        WHEN ${optin_count1}::smallint >0 THEN ${optin_count1}::smallint
        ELSE 0
      END
       ;;
  }

  dimension: unsub_count1 {
    label: "Unsubs sddsaasddsa"
    hidden: yes
    type: string
    sql: CASE
       WHEN ${TABLE}.unsub_date IS NULL THEN '0'
       WHEN ${TABLE}.unsub_date = ' ' THEN '0'
       WHEN (((${TABLE}.unsub_date IS NOT NULL) AND (${optin} = 0)) AND (${TABLE}.optin_date != ' ')) THEN '1'
      END
       ;;
  }

  #   - measure: unsub_count
  #     label: 'Unsubscribe Count'
  #     type: number
  #     sql: |
  #       CASE
  #         WHEN sum(${unsub_count1}) >0 THEN sum(${unsub_count1})
  #         ELSE 0
  #       END


  measure: unsub_count {
    label: "Unsubscribe Count"
    type: sum_distinct
    sql_distinct_key: ${email_address} || ${brandcode} ;;
    sql: CASE
        WHEN ${unsub_count1}::smallint >0 THEN ${unsub_count1}::smallint
        ELSE 0
      END
       ;;
  }
}

#   - measure: unsub_count
#     type: count_distinct
#     sql: ${TABLE}.email_address
#     filters:
#       unsub_count1: '1'
