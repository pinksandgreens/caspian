view: revenue_by_site {
  sql_table_name: [bauerxcel.com:api-project-792028032348:Email_Data.RevenueBySite]
    ;;

  dimension: ad_unit1 {
    type: string
    sql: ${TABLE}.AdUnit1 ;;
  }

  dimension: ad_unit2 {
    type: string
    sql: ${TABLE}.AdUnit2 ;;
  }

  dimension: ad_unit3 {
    type: string
    sql: ${TABLE}.AdUnit3 ;;
  }

  dimension: ad_unit4 {
    type: string
    sql: ${TABLE}.AdUnit4 ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Date ;;
  }

  dimension: partner_revenue {
    type: number
    sql: ${TABLE}.PartnerRevenue ;;
  }

  dimension: total_impressions {
    type: number
    sql: ${TABLE}.TotalImpressions ;;
  }

  dimension: unfilled_impressions {
    type: number
    sql: ${TABLE}.UnfilledImpressions ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: []
  }
}
