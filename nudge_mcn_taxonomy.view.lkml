view: nudge_mcn_taxonomy {
  sql_table_name: publications.nudge_mcn_taxonomy ;;

  dimension: id {
    type: string
    sql: ${TABLE}.Manufacturer || '-' || ${TABLE}.Model ;;
  }

  dimension: Manufacturer {
    type: string
    sql: ${TABLE}.Manufacturer ;;
  }

  dimension: Model {
    type: string
    sql: ${TABLE}.Model ;;
  }

  dimension: BikeType {
    type: string
    sql: ${TABLE}.BikeType ;;
  }
}
