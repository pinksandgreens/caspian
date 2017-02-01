view: es_source_no_tickets {
  label: "Engaged Sciences Source"

  derived_table: {
    sql: SELECT *
      FROM implementation.es_source
      WHERE source NOT LIKE '%tickets'
       ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: source {
    hidden: yes
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: brand {
    hidden: yes
    label: "Brand Name"
    type: string
    sql: ${TABLE}.brand ;;
  }

  set: detail {
    fields: [source, brand]
  }
}
