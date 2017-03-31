view: sites {
  sql_table_name: [bauerxcel.com:api-project-792028032348:Mongo_DB.sites]
    ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [id, entries.count, entries_dev.count]
  }
}
