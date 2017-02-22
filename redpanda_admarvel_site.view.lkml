view: admarvel_site {
  sql_table_name: ad_platform.admarvel_site ;;

  dimension: clicks {
    type: string
    sql: ${TABLE}.clicks ;;
  }

  dimension: ctr {
    type: string
    sql: ${TABLE}.ctr ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: ecpm {
    type: string
    sql: ${TABLE}.ecpm ;;
  }

  dimension: fill_rate {
    type: string
    sql: ${TABLE}."fill.rate" ;;
  }

  dimension: impressions {
    type: string
    sql: ${TABLE}.impressions ;;
  }

  dimension: publisher_id {
    type: string
    sql: ${TABLE}."publisher.id" ;;
  }

  dimension: publisher_name {
    type: string
    sql: ${TABLE}."publisher.name" ;;
  }

  dimension: requests {
    type: string
    sql: ${TABLE}.requests ;;
  }

  dimension: revenue {
    type: string
    sql: ${TABLE}.revenue ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: site_id {
    type: string
    sql: ${TABLE}."site.id" ;;
  }

  dimension: site_name {
    type: string
    sql: ${TABLE}."site.name" ;;
  }

  measure: count {
    type: count
    drill_fields: [publisher_name, site_name]
  }
}
