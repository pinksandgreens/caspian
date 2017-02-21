view: jr_mcn_syb_tx_source_attribution_part2 {
  label: "MCN"

  derived_table: {
    sql:
      SELECT
        B.Referral_Source AS Referral_Source,
        A.ClientId AS ClientID,
        'MCN' AS xClientID,
        B.Session_Id AS Session_Id,
        B.Session_Number AS Session_Number,
        B.pagePath AS pagePath,
        B.hits.hitNumber AS Sequenced_Hit_Number,
        B.Hit_Type AS Hit_Type,
        B.SessionStartDateTime AS SessionStartDateTime,
        B.actual_date AS Actual_Date,
        B.Hit_Time AS Hit_Time
      FROM
        (SELECT
            fullVisitorId AS ClientId
        FROM
          (TABLE_DATE_RANGE([uplifted-light-89310:111489521.ga_sessions_], DATE_ADD(USEC_TO_TIMESTAMP(UTC_USEC_TO_MONTH(now())), -1, 'MONTH'), DATE_ADD(USEC_TO_TIMESTAMP(UTC_USEC_TO_MONTH(now())), -1, 'DAY')))
        WHERE hits.type = 'TRANSACTION'
        GROUP BY ClientID
          ) AS A
      LEFT OUTER JOIN
        (SELECT
          CONCAT(trafficSource.source,' | ',trafficSource.medium) AS Referral_Source,
          fullVisitorId AS ClientId,
          visitId AS Session_Id,
          visitNumber AS Session_Number,
          hits.page.pagePath AS pagePath,
          FORMAT_UTC_USEC(visitStartTime*1000000) AS SessionStartDateTime,
          hits.hitNumber,
          hits.type AS Hit_Type,
          DATE(USEC_TO_TIMESTAMP(visitStartTime*1000000)) AS actual_date,
          TIME(DATE_ADD(USEC_TO_TIMESTAMP(visitStartTime*1000000), (hits.time/1000), "SECOND")) AS Hit_Time
        FROM
          (TABLE_DATE_RANGE([uplifted-light-89310:22661559.ga_sessions_], DATE_ADD(USEC_TO_TIMESTAMP(UTC_USEC_TO_MONTH(now())), -2, 'MONTH'), DATE_ADD(USEC_TO_TIMESTAMP(UTC_USEC_TO_MONTH(now())), -1, 'DAY')))
        WHERE hits.type IS NOT NULL AND hits.type != ""
        ) AS B
      ON A.ClientId = B.ClientId

        ;;
  }

  dimension: Referral_Source {
    label: "Referral Source"
    sql: ${TABLE}.Referral_Source ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
  }

}
