view: gigya_nl_lookup {
  sql_table_name: publications.gigya_nl_lookup ;;

  dimension: created_date_ {
    type: string
    sql: ${TABLE}.created_date_ ;;
  }

  dimension: modified_date_ {
    type: string
    sql: ${TABLE}.modified_date_ ;;
  }

  dimension: nwlbrandcode {
    type: string
    sql: ${TABLE}.nwlbrandcode ;;
  }

  dimension: nwlcatagory {
    type: string
    sql: ${TABLE}.nwlcatagory ;;
  }

  dimension: nwlgenre {
    type: string
    sql: ${TABLE}.nwlgenre ;;
  }

  dimension: nwlid {
    type: string
    sql: ${TABLE}.nwlid ;;
  }

  dimension: nwlname {
    type: string
    sql: ${TABLE}.nwlname ;;
  }

  measure: count {
    type: count
    drill_fields: [nwlname]
  }
}
