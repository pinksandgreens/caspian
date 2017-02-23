view: rubicon {
  sql_table_name: ad_platform.rubicon ;;

  dimension: advertiser {
    type: string
    sql: ${TABLE}.advertiser ;;
  }

  dimension: auction_revenue {
    type: string
    sql: ${TABLE}.auction_revenue ;;
  }

  dimension: auctions {
    type: string
    sql: ${TABLE}.auctions ;;
  }

  dimension: auctions_won {
    type: string
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

  dimension: paid_impression {
    type: string
    sql: ${TABLE}.paid_impression ;;
  }

  dimension: partner {
    type: string
    sql: ${TABLE}.partner ;;
  }

  dimension: revenue {
    type: string
    sql: ${TABLE}.revenue ;;
  }

  dimension: revenue_source {
    type: string
    sql: ${TABLE}.revenue_source ;;
  }

  dimension: rownum {
    type: string
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
    type: count
    drill_fields: []
  }
}
