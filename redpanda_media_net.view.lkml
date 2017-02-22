view: media_net {
  sql_table_name: ad_platform.media_net ;;

  dimension: adtagid {
    type: string
    sql: ${TABLE}.adtagid ;;
  }

  dimension: adunitname {
    type: string
    sql: ${TABLE}.adunitname ;;
  }

  dimension: channelname {
    type: string
    sql: ${TABLE}.channelname ;;
  }

  dimension: estimatedrevenue {
    type: string
    sql: ${TABLE}.estimatedrevenue ;;
  }

  dimension: impressions {
    type: string
    sql: ${TABLE}.impressions ;;
  }

  dimension: rownum {
    type: string
    sql: ${TABLE}.rownum ;;
  }

  dimension: rpm {
    type: string
    sql: ${TABLE}.rpm ;;
  }

  measure: count {
    type: count
    drill_fields: [channelname, adunitname]
  }
}
