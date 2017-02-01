view: gigya_brand_optin {
  label: "2c. Registered Brand Optin"
  sql_table_name: publications.gigya_brand_optin ;;

  dimension: brand_code {
    type: string
    sql: ${TABLE}.brand_code ;;
  }

  dimension_group: ddw_date_updated {
    hidden: no
    label: "Preference Updated"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_date_updated ;;
  }

  dimension: emailoptin {
    label: "Email Optin"
    type: string
    sql: CASE
        WHEN ${TABLE}.emailoptin = ' ' THEN 'false'
        WHEN ${TABLE}.emailoptin IS NULL THEN 'Unknown'
        ELSE ${TABLE}.emailoptin
      END
       ;;
  }

  dimension: gigya_id {
    label: "User ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.gigya_id ;;
  }

  dimension: phoneoptin {
    label: "Phone Optin"
    type: string
    sql: ${TABLE}.phoneoptin ;;
  }

  dimension: phone_optin_null {
    hidden: yes
    type: string
    sql: CASE
        WHEN ${TABLE}.phoneoptin IS NULL THEN 'Null'
        ELSE 'Populated'
      END
       ;;
  }

  dimension: postaloptin {
    label: "Postal Optin"
    type: string
    sql: ${TABLE}.postaloptin ;;
  }

  dimension: smsoptin {
    label: "SMS Optin"
    type: string
    sql: ${TABLE}.smsoptin ;;
  }

  measure: Brand_Optin_Count {
    type: count_distinct
    sql: ${gigya_users.email} ;;

    filters: {
      field: emailoptin
      value: "true"
    }
  }

  measure: Percent_of_Total_Optins {
    type: percent_of_total
    sql: ${Brand_Optin_Count} ;;
  }

  measure: Brand_Unsub_Count {
    type: count_distinct
    sql: ${gigya_users.email} ;;

    filters: {
      field: emailoptin
      value: "false"
    }
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
