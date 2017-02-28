view: jr_mcn_syb_tx_customer_journey_source_rollup {
  label: "MCN SYB Tx Rollup View"

  derived_table: {
    sql:
    SELECT
      Referral_Source,
      ClientID,
      xClientId,
      Session_Id,
      Session_Number,
      pagePath,
      Sequenced_Hit_Number,
      Hit_Time_into_Session,
      Hit_Type,
      Session_Date,
      SessionStartDateTime,
      CASE
        WHEN Hit_Type = 'TRANSACTION' THEN COUNT(Hit_Type)
      END AS Total_Tx,
      REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') AS Referral_Source_All,
      SUM(CASE
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = '(direct)|(none)' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'aol|organic' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = '(direct)|(none)' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'BFS in-site alerts|widget' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'bikes-for-sale-enquiries|email' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'bing|organic' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'Complete Booking Email' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'couponfollow.com|referral' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'Direct (Unknown)' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'edzlayering.com|referral' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'facebook.com|referral' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'google|cpc' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'google|organic' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'haslemeremotorcycles.co.uk|referral' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'HotUKDeals Voucher' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'hotukdeals.com|referral' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'MCN Newsletter' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'mcn|email' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'MCNClassifiedRebook|Rebooknewsletter' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'motorcyclenews|doublempu' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'Organic' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'outlook.live.com|referral' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'performancebikes.co.uk|link' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'Place Ad Button' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'search.bt.com|referral' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'SYB / Prices Place Ad Button' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'SYB Place Ad Button' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 't.co|referral' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'uk.search.yahoo.com|referral' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'www2.inbox.com|referral' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'yahoo|organic' THEN 1
        WHEN Sequenced_Hit_Number = 1 AND REGEXP_EXTRACT(Referral_Source, r'^(.+?)(?: \|Domain 1: MCN| \|Domain 2: BFS)') = 'tpc.googlesyndication.com|referral' THEN 1
        ELSE 0
      END) AS Referral_Source_Flag
    FROM
      ${jr_mcn_syb_tx_source_attribution_MCNClassifieds_part1.SQL_TABLE_NAME},
      ${jr_mcn_syb_tx_source_attribution_MCN_part1.SQL_TABLE_NAME}
    GROUP BY  Referral_Source,
              ClientID,
              xClientId,
              Session_Id,
              Session_Number,
              pagePath,
              Sequenced_Hit_Number,
              Hit_Time_into_Session,
              Hit_Type,
              Session_Date,
              SessionStartDateTime,
              Referral_Source_All


    ;;

    }

    dimension: Total_Tx {
      label: "Total Transactions"
      type: number
      sql: ${TABLE}.Total_Tx ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }

    dimension: Referral_Source {
      label: "Referral Source"
      sql: ${TABLE}.Referral_Source ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }

    dimension: Referral_Source_All {
      label: "Referral Source: X Domain"
      sql: ${TABLE}.Referral_Source_All ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }


    measure: Referral_Source_Flag {
      label: "Referral Source: X Domain - Count"
      type: sum
      sql: ${TABLE}.Referral_Source_Flag ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }

    dimension: ClientID {
      label: "Original Client Id"
      sql: ${TABLE}.ClientID ;;
#         description: "BFS Domain: Client Id"
    }

    dimension: xClientId {
      label: "Client Id by Domain"
      sql: ${TABLE}.xClientId ;;
#         description: "BFS Domain: Client Id"
    }

    dimension: Session_Id {
      label: "Session Id"
      type: number
      sql: ${TABLE}.Session_Id ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }
    dimension: Session_Number {
      label: "Visit Number"
      type: number
      sql: ${TABLE}.Session_Number ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }
    dimension: pagePath {
      label: "page URL"
      sql: ${TABLE}.pagePath ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }

    dimension: Session_Date {
      label: "Date of Session"
      sql: ${TABLE}.Session_Date ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }

    dimension: Sequenced_Hit_Number {
      label: "Session Hit Number Sequence"
      type: number
      sql: ${TABLE}.Sequenced_Hit_Number ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }
    dimension: Hit_Time_into_Session {
      label: "Hit Time into Session"
      type: number
      sql: ${TABLE}.Hit_Time_into_Session ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }
    dimension: Hit_Type {
      label: "Hit Type"
      sql: ${TABLE}.Hit_Type ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }

    dimension: SessionStartDateTime {
      label: "Session Start Date/Time"
      sql: ${TABLE}.SessionStartDateTime ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
    }

  }
