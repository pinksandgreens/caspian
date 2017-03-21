view: admarvel_site {
  sql_table_name: ad_platform.admarvel_site ;;

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  measure: ctr {
    type: average
    value_format: "0.0000"
    sql: ${TABLE}.ctr::float ;;
  }

  dimension_group: date {
    label: ""
    type: time
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'MM-DD-YYYY') ;;
  }

  measure: ecpm {
    type: average
    value_format: "0.0000"
    sql: ${TABLE}.ecpm::float ;;
  }

  measure: fill_rate {
    type: average
    value_format: "0.0000\%"
    sql: ${TABLE}."fill.rate"::float ;;
  }

  measure: impressions {
    type: sum
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

  measure: requests {
    type: sum
    sql: ${TABLE}.requests ;;
  }

  measure: revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.revenue::float ;;
  }

  dimension: rownum {
    hidden: yes
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
    hidden: yes
    type: count
    drill_fields: [publisher_name, site_name]
  }
}
