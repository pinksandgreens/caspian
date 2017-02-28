view: jr_mcn_syb_tx_source_attribution_MCNClassifieds_part1 {
  label: "MCN"

  derived_table: {
    sql:
      SELECT
        Visitor_SYB_Cohort.ClientID AS Master_ClientID,
        'SYB' AS Domain,
        Visitor_SYB_Cohort.Start_Investigation_Date AS From_Date,
        Visitor_SYB_Cohort.Last_SYB_Booking_Page_Visit AS To_Date,
        Core_Stats.hostname AS Hostname,
        Core_Stats.medium AS Medium,
        Core_Stats.channelGrouping AS ChannelGrouping,
        Core_Stats.Referral_Source AS Referral_Source,
        Core_Stats.Session_Id AS Session_Id,
        Core_Stats.Session_Number AS Visit_Number,
        Core_Stats.pagePath AS PageURL,
        Core_Stats.Category AS Site_Category,
        Core_Stats.SessionStartDateTime AS SessionStartDateTime,
        Core_Stats.hits.hitNumber AS Hit_Sequence_Number,
        Core_Stats.Hit_Type AS Hit_Type,
        Core_Stats.actual_date AS Actual_Date,
        Core_Stats.Hit_Time AS Hit_Time,
        Core_Stats.trafficSource_referralPath AS Referral_Path,
        Core_Stats.trafficSource_campaign AS Campaign,
        Core_Stats.devicetype AS Device,
        Core_Stats.devicebrowser AS Browser,
        Core_Stats.geoNetwork_cityId AS CityID,
        Core_Stats.date AS GA_Date,
        IF(Core_Stats.hits.hitNumber = 1,Core_Stats.pagePath,NULL) AS LandingPage,
        IF(Core_Stats.hits.hitNumber = 1,1,0) AS LandingPageFlag
      FROM
        (SELECT
          A.ClientID AS ClientID,
          FORMAT_UTC_USEC(TIMESTAMP_TO_USEC(DATE_ADD(TIMESTAMP(A.First_SYB_Booking_Page_Visit_in_last_4_weeks), -30, 'DAY'))) AS Start_Investigation_Date,
          B.Last_SYB_Booking_Page_Visit AS Last_SYB_Booking_Page_Visit
        FROM
          (SELECT
            FIRST_VALUE(ClientID) OVER (PARTITION BY ClientID ORDER BY SessionStartDateTime ASC) AS ClientID,
            FIRST_VALUE(SessionStartDateTime) OVER (PARTITION BY ClientID ORDER BY SessionStartDateTime ASC) AS First_SYB_Booking_Page_Visit_in_last_4_weeks
          FROM
            (SELECT
              fullVisitorId AS ClientID,
              FORMAT_UTC_USEC(visitStartTime*1000000) AS SessionStartDateTime
            FROM
              (TABLE_DATE_RANGE([uplifted-light-89310:111489521.ga_sessions_], DATE_ADD(USEC_TO_TIMESTAMP(UTC_USEC_TO_WEEK(now(), 0)), -27, 'DAY'), USEC_TO_TIMESTAMP(UTC_USEC_TO_WEEK(now(), 0))))
            WHERE hits.page.pagePath = 'mcnclassifieds.bauersecure.com/'
            )
          ) AS A
        LEFT OUTER JOIN
          (SELECT
            FIRST_VALUE(ClientID) OVER (PARTITION BY ClientID ORDER BY SessionStartDateTime DESC) AS ClientID,
            FIRST_VALUE(SessionStartDateTime) OVER (PARTITION BY ClientID ORDER BY SessionStartDateTime DESC) AS Last_SYB_Booking_Page_Visit
          FROM
            (SELECT
              fullVisitorId AS ClientID,
              FORMAT_UTC_USEC(visitStartTime*1000000) AS SessionStartDateTime
            FROM
              (TABLE_DATE_RANGE([uplifted-light-89310:111489521.ga_sessions_], DATE_ADD(USEC_TO_TIMESTAMP(UTC_USEC_TO_WEEK(now(), 0)), -27, 'DAY'), USEC_TO_TIMESTAMP(UTC_USEC_TO_WEEK(now(), 0))))
            WHERE hits.page.pagePath = 'mcnclassifieds.bauersecure.com/'
            )
          ) AS B
          ON A.ClientID = B.ClientID
          GROUP BY ClientID, Start_Investigation_Date, Last_SYB_Booking_Page_Visit
        ) AS Visitor_SYB_Cohort
        LEFT OUTER JOIN
        (SELECT
          trafficSource.source AS hostname,
          trafficSource.medium AS medium,
          trafficSource.keyword AS keyword,
          channelGrouping,
          CONCAT(trafficSource.source,' | ',trafficSource.medium) AS Referral_Source,
          fullVisitorId AS ClientID,
          visitId AS Session_Id,
          visitNumber AS Session_Number,
          hits.page.pagePath AS pagePath,
          IF(REGEXP_MATCH(hits.page.pagePath, r'^.+?\/(.+?)\/.*$'),REGEXP_EXTRACT(hits.page.pagePath, r'^.+?\/(.+?)\/.*$'),'SYB') AS Category,
          FORMAT_UTC_USEC(visitStartTime*1000000) AS SessionStartDateTime,
          hits.hitNumber,
          hits.type AS Hit_Type,
          DATE(USEC_TO_TIMESTAMP(visitStartTime*1000000)) AS actual_date,
          TIME(DATE_ADD(USEC_TO_TIMESTAMP(visitStartTime*1000000), (hits.time/1000), "SECOND")) AS Hit_Time,
          trafficSource.referralPath AS trafficSource_referralPath,
          trafficSource.campaign AS trafficSource_campaign,
          device.deviceCategory AS devicetype,
          device.browser AS devicebrowser,
          geoNetwork.cityId AS geoNetwork_cityId,
          FORMAT_UTC_USEC(PARSE_UTC_USEC(Concat(LEFT(date,4),'-',SUBSTRING(date,5,2),'-',RIGHT(date,2)))) AS date
        FROM
          (TABLE_DATE_RANGE([uplifted-light-89310:111489521.ga_sessions_], DATE_ADD(USEC_TO_TIMESTAMP(now()), -62, 'DAY'), USEC_TO_TIMESTAMP(now())))
        WHERE hits.type != 'EVENT'
        ) AS Core_Stats
        ON Visitor_SYB_Cohort.ClientID = Core_Stats.ClientID
        WHERE Core_Stats.SessionStartDateTime BETWEEN Visitor_SYB_Cohort.Start_Investigation_Date AND Visitor_SYB_Cohort.Last_SYB_Booking_Page_Visit

      ;;
  }

  dimension: Master_ClientID {
    label: "Master_ClientID"
    sql: ${TABLE}.Master_ClientID ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
  }

  dimension: Actual_Date {
    label: "Actual Date"
    sql: ${TABLE}.Actual_Date ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
  }

  dimension: Hit_Time {
    label: "Hit Time"
    sql: ${TABLE}.Hit_Type ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
  }

}
