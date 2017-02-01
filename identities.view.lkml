view: identities {
  sql_table_name: publications.identities ;;

  dimension: created_by {
    hidden: no
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension_group: date_created {
    hidden: no
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_created ;;
  }

  dimension: email {
    hidden: no
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: home_phone {
    hidden: no
    type: string
    sql: ${TABLE}.home_phone ;;
  }

  dimension: idd_id {
    hidden: no
    primary_key: yes
    type: number
    sql: ${TABLE}.idd_id ;;
  }

  dimension_group: last_updated {
    hidden: no
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: mobile_phone {
    hidden: no
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: postcode {
    hidden: no
    type: string
    sql: ${TABLE}.postcode ;;
  }

  dimension: updated_by {
    hidden: no
    type: string
    sql: ${TABLE}.updated_by ;;
  }

  dimension: work_phone {
    hidden: no
    type: string
    sql: ${TABLE}.work_phone ;;
  }

  measure: Unique_ID_Count {
    hidden: no
    type: count_distinct
    sql: ${TABLE}.idd_id ;;
  }
}
