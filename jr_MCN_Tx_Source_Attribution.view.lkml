view: jr_mcn_tx_source_attribution {
  label: "MCN"

  derived_table: {
    sql:
    SELECT
      CASE
        WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'motorcyclenews|button' THEN 'SYB Place Ad Button'
        WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'motorcyclenews.com|referral' THEN 'BFS Place Ad Button'
        WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'bfssavead|email' THEN 'Complete Booking Email'
        WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = '(direct)|(none)' THEN 'Direct (Unknown)'
        WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'google|organic' THEN 'Organic'
        WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'motorcyclenews.com|referral' THEN 'General Awareness Email'
        WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'hotukdeals.com|referral' THEN 'HotUKDeals Voucher'
        WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'MCN|Sell your bike page' THEN 'SYB / Prices Place Ad Button'
        WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'couponfollow.com|referral' THEN 'couponfollow.com|referral'
        WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'motorcyclenews|Email' THEN 'MCN Newsletter'
      END AS Referral_Source,
      COUNT(hits.page.pagePath) AS Total_Tx
    FROM
    {% table_date_range jr_mcn_tx_source_attribution.date_filter 111489521.ga_sessions_ %},{% table_date_range jr_mcn_tx_source_attribution.date_filter 111489521.ga_sessions_intraday_ %}
  WHERE hits.type = 'TRANSACTION'
  GROUP BY Referral_Source
  ORDER BY Total_Tx DESC
       ;;
  }

  filter: date_filter {
    label: "1. Last Month"
    hidden: yes
    type: date
  }

  dimension: Referral_Source {
  label: "Referral Source"
  sql: ${TABLE}.Referral_Source ;;
  description: "SYB Transaction Referral Source"
  }

  dimension: Total_Tx {
    label: "Transaction Source"
    type:  number
    sql: ${TABLE}.Total_Tx ;;
    description: "Referral Source for Transacting Visitor"
  }
}
