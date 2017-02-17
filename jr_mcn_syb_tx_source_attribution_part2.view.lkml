view: jr_mcn_syb_tx_source_attribution_part2 {
  label: "MCN"

  derived_table: {
    sql:
      SELECT
        B.Referral_Source AS Referral_Source,
        A.ClientId AS ClientID,
        B.xClientId AS xClientId,
        B.Session_Id AS Session_Id,
        B.Session_Number AS Session_Number,
        B.pagePath AS pagePath,
        B.Sequenced_Hit_Number AS Sequenced_Hit_Number,
        B.Hit_Time_into_Session AS Hit_Time_into_Session,
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
          CONCAT(trafficSource.source,'|',trafficSource.medium) AS Referral_Source,
          fullVisitorId AS ClientId,
          CONCAT(fullVisitorId,' |Domain 1: MCN') AS xClientId,
          visitId AS Session_Id,
          visitNumber AS Session_Number,
          hits.page.pagePath AS pagePath,
          hits.hitNumber AS Sequenced_Hit_Number,
          hits.time AS Hit_Time_into_Session,
          hits.type AS Hit_Type,
          date AS Session_Date,
          STRING(FORMAT_UTC_USEC((INTEGER(visitStartTime))*1000000)) AS SessionStartDateTime
        FROM
          {% table_date_range jr_mcn_syb_tx_source_attribution_part3.date_filter2 22661559.ga_sessions_ %},{% table_date_range jr_mcn_syb_tx_source_attribution_part3.date_filter2 22661559.ga_sessions_intraday_ %}
        ) AS B
      ON A.ClientId = B.ClientId

        ;;
  }

  #   dimension: Referral_Source {
  #     label: "Referral Source"
  #     sql: ${TABLE}.Referral_Source ;;
  # #         description: "BFS Domain: SYB Transaction Referral Source"
  #   }
  #   dimension: ClientID {
  #     hidden: yes
  #     label: "Client Id"
  #     sql: ${TABLE}.ClientID ;;
  #     #         description: "BFS Domain: SYB Transaction Referral Source"
  #   }

  #   dimension: xClientId {
  #     label: "Client Id"
  #     sql: ${TABLE}.xClientId ;;
  #     #         description: "BFS Domain: SYB Transaction Referral Source"
  #   }
  #   dimension: Session_Id {
  #     label: "Session Id"
  #     type: number
  #     sql: ${TABLE}.Session_Id ;;
  #     #         description: "BFS Domain: SYB Transaction Referral Source"
  #   }
  #   dimension: Session_Number {
  #     label: "Visit Number"
  #     type: number
  #     sql: ${TABLE}.Session_Number ;;
  #     #         description: "BFS Domain: SYB Transaction Referral Source"
  #   }
  #   dimension: pagePath {
  #     label: "pageURL"
  #     sql: ${TABLE}.pagePath ;;
  #     #         description: "BFS Domain: SYB Transaction Referral Source"
  #   }
  #   dimension: Session_Date {
  #     label: "Session Date"
  #     sql: ${TABLE}.Session_Date ;;
  #     #         description: "BFS Domain: SYB Transaction Referral Source"
  #   }
  #   dimension: SessionStartDateTime {
  #     label: "SessionStartDateTime"
  #     sql: ${TABLE}.SessionStartDateTime ;;
  #     #         description: "BFS Domain: SYB Transaction Referral Source"
  #   }
  #   dimension: Sequenced_Hit_Number {
  #     label: "Sequenced_Hit_Number"
  #     type: number
  #     sql: ${TABLE}.Sequenced_Hit_Number ;;
  #     #         description: "BFS Domain: SYB Transaction Referral Source"
  #   }
  #   dimension: Hit_Time_into_Session {
  #     label: "Hit_Time_into_Session"
  #     type: number
  #     sql: ${TABLE}.Hit_Time_into_Session ;;
  #     #         description: "BFS Domain: SYB Transaction Referral Source"
  #   }
  #   dimension: Hit_Type {
  #     label: "Hit_Type"
  #     sql: ${TABLE}.Hit_Type ;;
  #     #         description: "BFS Domain: SYB Transaction Referral Source"
  #   }
}
