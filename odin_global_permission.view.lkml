view: odin_global_permission {
  sql_table_name: responsys.odin_global_permission ;;

  dimension: baueremailoptin {
    type: number
    sql: ${TABLE}.baueremailoptin ;;
  }

  dimension_group: baueremailoptinsubscribets {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.baueremailoptinsubscribets ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: thirdemailoptin {
    type: number
    sql: ${TABLE}.thirdemailoptin ;;
  }

  dimension_group: thirdemailoptinsubscribets {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.thirdemailoptinsubscribets ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date ;;
  }

  measure: Brand_Optin_Count {
    type: count_distinct
    sql: ${TABLE}.email_address ;;

    filters: {
      field: baueremailoptin
      value: "1"
    }
  }
}
