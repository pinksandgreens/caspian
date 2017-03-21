view: jr_mcn_syb_funnel_test2 {
label: "MCN SYB Customer Journey"

  derived_table: {
    sql:
    SELECT
      Master_ClientID,
        Referral_Source,
        Session_Id,
        Visit_Number,
        PageURL,
        Site_Category,
        Actual_Date,
        Hit_Time,
        SYB_LP_Flag
    FROM

    (SELECT
        Master_ClientID,
        Referral_Source,
        Session_Id,
        Visit_Number,
        PageURL,
        Site_Category,
        Actual_Date,
        Hit_Time,
        SYB_LP_Flag
      FROM
        (SELECT
          Master_ClientID,
          Domain,
          Hostname,
          Medium,
          ChannelGrouping,
          Referral_Source,
          LAG(Referral_Source,1) OVER (PARTITION BY Master_ClientID ORDER BY Actual_Date ASC, Hit_Time ASC) AS Lag_Referral_Source,
          Session_Id,
          Visit_Number,
          PageURL,
          Site_Category,
          SessionStartDateTime,
          Hit_Sequence_Number,
          Hit_Type,
          Actual_Date,
          Hit_Time,
          Referral_Path,
          Campaign,
          Device,
          Browser,
          CityID,
          GA_Date,
          SYB_LP_Flag,
          LandingPage,
          LandingPageFlag
        FROM
          ${jr_mcn_syb_tx_source_test2.SQL_TABLE_NAME}
        WHERE LandingPageFlag = 1
        )
      WHERE SYB_LP_Flag = 1)
    ,
    (SELECT
      Master_ClientID,
      IF(Lag_Referral_Source IS NULL, 'NULL', IF(Lag_Referral_Source = Referral_Source,'NULL',Lag_Referral_Source)) AS Referral_Source,
      Session_Id,
      Visit_Number,
      PageURL,
      Site_Category,
      Actual_Date,
      Hit_Time,
      SYB_LP_Flag
    FROM
      (SELECT
        Master_ClientID,
        Domain,
        Hostname,
        Medium,
        ChannelGrouping,
        Referral_Source,
        LAG(Referral_Source,1) OVER (PARTITION BY Master_ClientID ORDER BY Actual_Date ASC, Hit_Time ASC) AS Lag_Referral_Source,
        Session_Id,
        Visit_Number,
        PageURL,
        Site_Category,
        SessionStartDateTime,
        Hit_Sequence_Number,
        Hit_Type,
        Actual_Date,
        Hit_Time,
        Referral_Path,
        Campaign,
        Device,
        Browser,
        CityID,
        GA_Date,
        SYB_LP_Flag,
        LandingPage,
        LandingPageFlag
      FROM
        ${jr_mcn_syb_tx_source_test2.SQL_TABLE_NAME}
      WHERE LandingPageFlag = 1
      )
    WHERE SYB_LP_Flag = 1)
    WHERE Referral_Source != 'NULL'





    ;;

    }

    dimension: Master_ClientID {
      label: "1.1 Master Client Id"
      sql: ${TABLE}.Master_ClientID ;;
#         description: "BFS Domain: Client Id"
    }

  dimension: SYB_LP_Flag {
    label: "1.15 SYB_LP_Flag"
    type: number
    sql: ${TABLE}.SYB_LP_Flag ;;
#         description: "BFS Domain: Client Id"
  }


    dimension: Referral_Source {
      label: "1.8 Referral Source"
      sql: ${TABLE}.Referral_Source ;;
    }

  dimension: Consolidated_Referral_Source {
    label: "1.85 Con Referral Source"
    sql: ${TABLE}.test ;;
  }

  dimension: Lag_Referral_Source {
    label: "1.85 Lag_Referral_Source"
    sql: ${TABLE}.Lag_Referral_Source ;;
  }

  dimension: Session_Id {
      label: "1.9 Session Id"
      type: number
      sql: ${TABLE}.Session_Id ;;
    }

    dimension: Visit_Number {
      label: "2.0 Visit Number"
      type: number
      sql: ${TABLE}.Visit_Number ;;
    }

    dimension: pagePath {
      label: "2.1 page URL"
      sql: ${TABLE}.pageURL ;;
    }

    dimension: Site_Category {
      label: "2.2 Site Category"
      sql: ${TABLE}.Site_Category ;;
    }

    dimension: Actual_Date {
      label: "2.6 Date"
      sql: ${TABLE}.actual_date ;;
    }

    dimension: Hit_Time {
      label: "2.7 Hit Time"
      sql: ${TABLE}.Hit_Time ;;
    }

    dimension:  LandingPage {
      label: "3.3 Landing Page"
      sql: ${TABLE}.LandingPage ;;

    }

    dimension: LandingPageFlag {
      label: "3.4 Landing Page Flag"
      type: number
      sql: ${TABLE}.LandingPageFlag ;;
      #         description: "BFS Domain: SYB Transaction Referral Source"
    }

    measure: count {
      label: "Referral Source Count"
      type: count


    }


  }
