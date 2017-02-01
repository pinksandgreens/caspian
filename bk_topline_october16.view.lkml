view: bk_topline_october16 {
  sql_table_name: publications.bk_topline_october16 ;;

  dimension: category_id {
    type: number
    sql: ${TABLE}."category id" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: full_path {
    type: string
    sql: ${TABLE}."full path" ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.reach ;;
  }

  measure: UK_Reach {
    label: "BlueKai UK Audience Size"
    type: number
    sql: ${TABLE}.reach ;;
  }
}
