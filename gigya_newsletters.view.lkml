view: gigya_newsletters {
  label: "2d. Newsletter Optin"
  sql_table_name: publications.gigya_newsletters ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: ddw_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.ddw_updated_date ;;
  }

  dimension: gigya_id {
    hidden: yes
    type: string
    sql: ${TABLE}.gigya_id ;;
  }

  dimension: optin {
    type: yesno
    sql: ${TABLE}.optin ;;
  }

  dimension_group: optin_subscribe {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.optin_subscribe_date ;;
  }

  dimension_group: optin_unsubscribe {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.optin_unsubscribe_date ;;
  }

  measure: Newsletter_Optin_Count {
    type: count_distinct
    sql: ${gigya_users.email} ;;

    filters: {
      field: optin
      value: "Yes"
    }
  }

  measure: Newsletter_Unsub_Count {
    type: count_distinct
    sql: ${gigya_users.email} ;;

    filters: {
      field: optin
      value: "No"
    }
  }
}
