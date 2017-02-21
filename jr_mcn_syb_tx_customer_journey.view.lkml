view: jr_mcn_syb_tx_customer_journey {
  label: "MCN SYB Customer Journey"

  derived_table: {
    sql:
    SELECT
      Referral_Source,
      ClientID,
      xClientID,
      Session_Id,
      Session_Number,
      pagePath,
      Sequenced_Hit_Number,
      Hit_Type,
      SessionStartDateTime,
      actual_date,
      Hit_Time
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
      label: "Domain"
      sql: ${TABLE}.xClientID ;;
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

    dimension: Sequenced_Hit_Number {
      label: "Session Hit Number Sequence"
      type: number
      sql: ${TABLE}.Sequenced_Hit_Number ;;
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

    dimension: Actual_Date {
    label: "Date"
    sql: ${TABLE}.actual_date ;;
#         description: "BFS Domain: SYB Transaction Referral Source"
  }

    dimension: Hit_Time {
    label: "Hit Time"
    sql: ${TABLE}.Hit_Time ;;
  #         description: "BFS Domain: SYB Transaction Referral Source"
    }

  }
