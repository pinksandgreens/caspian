view: jr_mcn_syb_test_part1 {
  label: "MCN"

  derived_table: {
    sql:
      SELECT
        ClientID,
        Domain,
        Referral_Source,
        Session_Id,
        pagePath,
        Session_Number,
        SessionStartDateTime,
        actual_date,
        Hit_Time,
        Hit_Time_Timestamp
      FROM
        (SELECT
          A.ClientID AS ClientID,
          A.Domain AS Domain,
          A.Referral_Source AS Referral_Source,
          A.Session_Id AS Session_Id,
          A.pagePath AS pagePath,
          A.Session_Number AS Session_Number,
          A.SessionStartDateTime AS SessionStartDateTime,
          A.actual_date AS actual_date,
          A.Hit_Time AS Hit_Time,
          A.Hit_Time_Timestamp AS Hit_Time_Timestamp,
          RANK() OVER (PARTITION BY A.ClientID, A.Session_Id ORDER BY A.actual_date, A.Hit_Time) AS rank
        FROM
          (SELECT
            fullVisitorId AS ClientID,
            'SYB' AS Domain,
            CONCAT(trafficSource.source,' | ',trafficSource.medium) AS Referral_Source,
            visitId AS Session_Id,
            hits.page.pagePath AS pagePath,
            visitNumber AS Session_Number,
            FORMAT_UTC_USEC(visitStartTime*1000000) AS SessionStartDateTime,
            DATE(USEC_TO_TIMESTAMP(visitStartTime*1000000)) AS actual_date,
            TIME(DATE_ADD(USEC_TO_TIMESTAMP(visitStartTime*1000000), (hits.time/1000), "SECOND")) AS Hit_Time,
            USEC_TO_TIMESTAMP(visitStartTime*1000000) AS Hit_Time_Timestamp
          FROM
            (TABLE_DATE_RANGE([uplifted-light-89310:111489521.ga_sessions_], DATE_ADD(USEC_TO_TIMESTAMP(UTC_USEC_TO_WEEK(now(), 0)), -27, 'DAY'), USEC_TO_TIMESTAMP(UTC_USEC_TO_WEEK(now(), 0))))
          WHERE hits.page.pagePath = 'mcnclassifieds.bauersecure.com/' and hits.type = 'PAGE'
          ) AS A)
        WHERE rank = 1

    ;;

  }
    dimension: ClientID {
    label: "ClientID"
    sql: ${TABLE}.ClientID ;;

  }
  }
