view: responsys_engaged_list_overlap {
  sql_table_name: responsys.responsys_engaged_list_temp ;;

  dimension: email_address {
    hidden: yes
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: riid {
    type: string
    sql: ${TABLE}.riid ;;
  }

  measure: unique_users {
    type: count_distinct
    sql: ${TABLE}.email_address ;;
  }
}
