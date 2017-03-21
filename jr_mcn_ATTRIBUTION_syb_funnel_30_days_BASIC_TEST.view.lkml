view: jr_mcn_syb_funnel_30_days_basic_test {
  label: "MCN SYB Customer Journey"

  derived_table: {
    sql:
    SELECT
      ClientID,
      Domain,
      Referral_Source,
      Session_Id,
      pagePath,
      SessionStartDateTime,
      actual_date,
      Hit_Time,
      Hit_Time_Timestamp
    FROM
    ${jr_mcn_syb_test_part1.SQL_TABLE_NAME},
    ${jr_mcn_syb_test_part2.SQL_TABLE_NAME}


    ;;
    }


dimension: ClientID {
  label: "1.1 Master Client Id"
  sql: ${TABLE}.ClientID ;;
#         description: "BFS Domain: Client Id"
}

dimension: DomainId {
  label: "1.2 Domain"
  sql: ${TABLE}.Domain ;;
#         description: "BFS Domain: Client Id"
}

dimension: Referral_Source {
  label: "1.8 Referral Source"
  sql: ${TABLE}.Referral_Source ;;
}

dimension: Session_Id {
  label: "1.9 Session Id"
  type: number
  sql: ${TABLE}.Session_Id ;;
}

dimension: pagePath {
  label: "2.1 page URL"
  sql: ${TABLE}.pagePath ;;
}

dimension: SessionStartDateTime {
  label: "2.3 Session Start Date/Time"
  sql: ${TABLE}.SessionStartDateTime ;;
}

dimension: Actual_Date {
  label: "2.6 Date"
  sql: ${TABLE}.actual_date ;;
}

dimension: Hit_Time {
  label: "2.7 Hit Time"
  type: number
  sql: ${TABLE}.Hit_Time ;;
}

  dimension: Hit_Time_Timestamp {
    label: "2.8 Hit_Time_Timestamp"
    sql: ${TABLE}.Hit_Time_Timestamp ;;
  }


}
