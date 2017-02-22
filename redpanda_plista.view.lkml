view: plista {
  sql_table_name: ad_platform.plista ;;

  dimension: data_advertisements_adblockrate {
    type: string
    sql: ${TABLE}."data.advertisements.adblockrate" ;;
  }

  dimension: data_advertisements_adimpressions {
    type: string
    sql: ${TABLE}."data.advertisements.adimpressions" ;;
  }

  dimension: data_advertisements_clicks {
    type: string
    sql: ${TABLE}."data.advertisements.clicks" ;;
  }

  dimension: data_advertisements_ctr {
    type: string
    sql: ${TABLE}."data.advertisements.ctr" ;;
  }

  dimension: data_advertisements_date {
    type: string
    sql: ${TABLE}."data.advertisements.date" ;;
  }

  dimension: data_advertisements_ecpm {
    type: string
    sql: ${TABLE}."data.advertisements.ecpm" ;;
  }

  dimension: data_advertisements_revenue {
    type: string
    sql: ${TABLE}."data.advertisements.revenue" ;;
  }

  dimension: data_advertisements_vecpm {
    type: string
    sql: ${TABLE}."data.advertisements.vecpm" ;;
  }

  dimension: data_advertisements_visibility {
    type: string
    sql: ${TABLE}."data.advertisements.visibility" ;;
  }

  dimension: data_advertisements_widgetimpressions {
    type: string
    sql: ${TABLE}."data.advertisements.widgetimpressions" ;;
  }

  dimension: data_currency {
    type: string
    sql: ${TABLE}."data.currency" ;;
  }

  dimension: data_groupby {
    type: string
    sql: ${TABLE}."data.groupby" ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.domain_name ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}.result ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  measure: count {
    type: count
    drill_fields: [domain_name]
  }
}
