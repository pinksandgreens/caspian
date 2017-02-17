view: jr_mcn_syb_tx_visitors {
label: "MCN"

  derived_table: {
    sql:
    SELECT
      fullVisitorId AS ClientId,
    FROM
    {% table_date_range jr_mcn_tx_source_attribution.date_filter 111489521.ga_sessions_ %},{% table_date_range jr_mcn_tx_source_attribution.date_filter 111489521.ga_sessions_intraday_ %}
  WHERE hits.type = 'TRANSACTION'
      ;;
  }

  dimension: Client_Id {
    label: "Client Id"
    sql: ${TABLE}.ClientId ;;
    description: "SYB Transaction Visitor Id (Device Id)"
  }
}
