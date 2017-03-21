view: jr_mcn_syb_test_part2 {

  label: "MCN"

  derived_table: {
    sql:
      SELECT
        A.ClientID AS ClientID,
        B.Domain AS Domain,
        B.Referral_Source AS Referral_Source,
        B.Session_Id AS Session_Id,
        B.pagePath AS pagePath,
        B.SessionStartDateTime AS SessionStartDateTime,
        B.actual_date AS actual_date,
        B.Hit_Time AS Hit_Time,
        B.Hit_Time_Timestamp AS Hit_Time_Timestamp
      FROM
        (SELECT
          fullVisitorId AS ClientID
        FROM
          (TABLE_DATE_RANGE([uplifted-light-89310:111489521.ga_sessions_], DATE_ADD(USEC_TO_TIMESTAMP(UTC_USEC_TO_WEEK(now(), 0)), -27, 'DAY'), USEC_TO_TIMESTAMP(UTC_USEC_TO_WEEK(now(), 0))))
        WHERE hits.page.pagePath = 'mcnclassifieds.bauersecure.com/' and hits.type = 'PAGE'
        GROUP BY ClientID
        ) AS A
      LEFT OUTER JOIN
        (SELECT
          fullVisitorId AS ClientID,
          'MCN' AS Domain,
          CONCAT(trafficSource.source,' | ',trafficSource.medium) AS Referral_Source,
          visitId AS Session_Id,
          hits.page.pagePath AS pagePath,
          FORMAT_UTC_USEC(visitStartTime*1000000) AS SessionStartDateTime,
          DATE(USEC_TO_TIMESTAMP(visitStartTime*1000000)) AS actual_date,
          TIME(DATE_ADD(USEC_TO_TIMESTAMP(visitStartTime*1000000), (hits.time/1000), "SECOND")) AS Hit_Time,
          USEC_TO_TIMESTAMP(visitStartTime*1000000) AS Hit_Time_Timestamp
        FROM
          (TABLE_DATE_RANGE([uplifted-light-89310:22661559.ga_sessions_], DATE_ADD(USEC_TO_TIMESTAMP(UTC_USEC_TO_WEEK(now(), 0)), -27, 'DAY'), USEC_TO_TIMESTAMP(UTC_USEC_TO_WEEK(now(), 0))))
        WHERE hits.type = 'PAGE' AND hits.hitNumber = 1
        ) AS B
      ON A.ClientID = B.ClientID

      ) AS test2

  ;;
  }

  dimension: ClientID {
    label: "ClientID"
    sql: ${TABLE}.ClientID ;;

  }


}
