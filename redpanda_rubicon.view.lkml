view: rubicon {
  sql_table_name: ad_platform.rubicon ;;

  dimension: advertiser {
    type: string
    sql: ${TABLE}.advertiser ;;
  }

  measure: auction_revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.auction_revenue::float ;;
  }

  measure: auctions {
    type: sum
    sql: ${TABLE}.auctions ;;
  }

  measure: auctions_won {
    type: sum
    sql: ${TABLE}.auctions_won ;;
  }

  dimension: buyer {
    type: string
    sql: ${TABLE}.buyer ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: date {
    type: time
    label: ""
    timeframes: []
    convert_tz: no
    sql: TO_DATE(${TABLE}.date,'YYYY-MM-DD') ;;
  }


  dimension: deal {
    type: string
    sql: ${TABLE}.deal ;;
  }

  measure: paid_impression {
    type: sum
    sql: ${TABLE}.paid_impression ;;
  }

  dimension: partner {
    type: string
    sql: ${TABLE}.partner ;;
  }

  measure: revenue {
    type: sum
    value_format: "\£0.0000"
    sql: ${TABLE}.revenue::float ;;
  }

  dimension: revenue_source {
    type: string
    sql: ${TABLE}.revenue_source ;;
  }

  dimension: rownum {
    type: string
    hidden: yes
    sql: ${TABLE}.rownum ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.size ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  measure: count {
    hidden: no
    type: count
    drill_fields: []
  }
}
