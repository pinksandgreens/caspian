view: jr_mcn_syb_tx_source_attribution_part1 {
  label: "MCN"

  derived_table: {
    sql:
      SELECT
      B.Referral_Source AS Referral_Source,
      A.ClientId AS ClientID,
      CONCAT(A.ClientId,' |Domain 2: BFS') AS xClientId,
      B.Session_Id AS Session_Id,
      B.Session_Number AS Session_Number,
      B.pagePath AS pagePath,
      B.hits.hitNumber AS Sequenced_Hit_Number,
      B.hits.time AS Hit_Time_into_Session,
      B.Hit_Type AS Hit_Type,
      B.Session_Date AS Session_Date,
      B.SessionStartDateTime AS SessionStartDateTime
    FROM
      (SELECT
          fullVisitorId AS ClientId
      FROM
        {% table_date_range jr_mcn_syb_tx_source_attribution_part3.date_filter 111489521.ga_sessions_ %},{% table_date_range jr_mcn_syb_tx_source_attribution_part3.date_filter 111489521.ga_sessions_intraday_ %}
        WHERE hits.type = 'TRANSACTION'
        ) AS A
      LEFT OUTER JOIN
        (SELECT
          CASE
            WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'motorcyclenews|button' THEN 'SYB Place Ad Button'
            WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'motorcyclenews.com|referral' THEN 'Place Ad Button'
            WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'bfssavead|email' THEN 'Complete Booking Email'
            WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = '(direct)|(none)' THEN 'Direct (Unknown)'
            WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'google|organic' THEN 'Organic'
            WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'motorcyclenews.com|referral' THEN 'General Awareness Email'
            WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'hotukdeals.com|referral' THEN 'HotUKDeals Voucher'
            WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'MCN|Sell your bike page' THEN 'SYB / Prices Place Ad Button'
            WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'couponfollow.com|referral' THEN 'couponfollow.com|referral'
            WHEN CONCAT(trafficSource.source,'|',trafficSource.medium) = 'motorcyclenews|Email' THEN 'MCN Newsletter'
            ELSE CONCAT(trafficSource.source,'|',trafficSource.medium)
          END AS Referral_Source,
          fullVisitorId AS ClientId,
          visitId AS Session_Id,
          visitNumber AS Session_Number,
          hits.page.pagePath AS pagePath,
          date AS Session_Date,
          STRING(FORMAT_UTC_USEC((INTEGER(visitStartTime))*1000000)) AS SessionStartDateTime,
          hits.hitNumber,
          hits.time,
          hits.type AS Hit_Type
        FROM
          {% table_date_range jr_mcn_syb_tx_source_attribution_part3.date_filter2 111489521.ga_sessions_ %},{% table_date_range jr_mcn_syb_tx_source_attribution_part3.date_filter2 111489521.ga_sessions_intraday_ %}
        ) AS B
        ON A.ClientId = B.ClientId

      ;;
  }

  # filter: date_filter {
  #   label: "Last Month"
  #   hidden: yes
  #   type: date
  # }

  # filter: date_filter2 {
  #   label: "Last 2 Months"
  #   hidden: yes
  #   type: date
  # }

#   dimension: Referral_Source {
#     label: "Referral Source"
#     sql: ${TABLE}.Referral_Source ;;
# #         description: "BFS Domain: SYB Transaction Referral Source"
#   }

#   dimension: ClientID {
#     hidden: yes
#     label: "Client Id"
#     sql: ${TABLE}.ClientID ;;
# #         description: "BFS Domain: Client Id"
#   }

#   dimension: xClientId {
#     label: "Client Id"
#     sql: ${TABLE}.xClientId ;;
# #         description: "BFS Domain: Client Id"
#   }

#   dimension: Session_Id {
#     label: "Session Id"
#     type:  number
#     sql: ${TABLE}.Session_Id ;;
# #         description: "BFS Domain: SYB Transaction Referral Source"
#   }
#   dimension: Session_Number {
#     label: "Visit Number"
#     type:  number
#     sql: ${TABLE}.Session_Number ;;
# #         description: "BFS Domain: SYB Transaction Referral Source"
#   }
#   dimension: pagePath {
#     label: "page URL"
#     sql: ${TABLE}.pagePath ;;
# #         description: "BFS Domain: SYB Transaction Referral Source"
#   }

#   dimension: Session_Date {
#     label: "Date of Session"
#     sql: ${TABLE}.Session_Date ;;
# #         description: "BFS Domain: SYB Transaction Referral Source"
#   }

#   dimension: Sequenced_Hit_Number {
#     label: "Session Hit Number Sequence"
#     type: number
#     sql: ${TABLE}.Sequenced_Hit_Number ;;
# #         description: "BFS Domain: SYB Transaction Referral Source"
#   }
#   dimension: Hit_Time_into_Session {
#     label: "Hit Time into Session"
#     type:  number
#     sql: ${TABLE}.Hit_Time_into_Session ;;
# #         description: "BFS Domain: SYB Transaction Referral Source"
#   }
#   dimension: Hit_Type {
#     label: "Hit Type"
#     sql: ${TABLE}.Hit_Type ;;
# #         description: "BFS Domain: SYB Transaction Referral Source"
#   }

#   dimension: SessionStartDateTime {
#     label: "Session Start Date/Time"
#     sql: ${TABLE}.SessionStartDateTime ;;
# #         description: "BFS Domain: SYB Transaction Referral Source"
#   }


}
