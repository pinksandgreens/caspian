view: jr_mcn_syb_tx_source_attribution_part3 {
  label: "MCN"

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
      SessionStartDateTime
    FROM
      ${jr_mcn_syb_tx_source_attribution_part1.SQL_TABLE_NAME},
      ${jr_mcn_syb_tx_source_attribution_part2.SQL_TABLE_NAME}
    ;;

    }

    filter: date_filter {
      label: "Last Month"
      hidden: yes
      type: date
    }

    filter: date_filter2 {
      label: "Last 2 Months"
      hidden: yes
      type: date
    }

    dimension: Referral_Source {
      label: "Referral Source"
      sql: ${TABLE}.Referral_Source ;;
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
