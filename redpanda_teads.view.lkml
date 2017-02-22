view: teads {
  sql_table_name: ad_platform.teads ;;

  dimension: ad {
    type: string
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_start {
    type: string
    sql: ${TABLE}.ad_start ;;
  }

  dimension: click {
    type: string
    sql: ${TABLE}.click ;;
  }

  dimension: clickrate {
    type: string
    sql: ${TABLE}."click-rate" ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: impression {
    type: string
    sql: ${TABLE}.impression ;;
  }

  dimension: income_converted_gbp {
    type: string
    sql: ${TABLE}.income_converted_gbp ;;
  }

  dimension: income_value {
    type: string
    sql: ${TABLE}.income_value ;;
  }

  dimension: placement {
    type: string
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    type: string
    sql: ${TABLE}.placement_id ;;
  }

  dimension: revenue {
    type: string
    sql: ${TABLE}.revenue ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: start {
    type: string
    sql: ${TABLE}.start ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
