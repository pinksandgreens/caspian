connection: "bigquery-connection"

# include all views in this project
include: "*.view"

# include all dashboards in this project
include: "*.dashboard"

label: "x: BigQuery - Projects"

explore: ga_sessions_header_bidding {
  label: "BigQuery - Header Bidding Platform"

  always_filter: {
    #This will be the default date range.
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}

explore: ga_sessions_quarterly_reports {
  hidden: yes
  label: "BigQuery - Quarterly Reports"

  always_filter: {
    #This will be the default date range.
    filters: {
      field: date_filter
      value: "30 days"
    }
  }
}



explore: ga_sessions_tentacle {
    hidden: no
    label: "BigQuery - Lifestyle"
    persist_for: "30 minutes"

    always_filter: {
      #This will be the default date range.
      filters: {
        field: date_filter
        value: "30 days"
      }

      filters: {
        field: intraday_date_filter
        value: "1 days"
      }
    }

  }


explore: ga_sessions_radio {
  hidden: no
  label: "BigQuery - Radio"
  persist_for: "30 minutes"

  always_filter: {
    #This will be the default date range.
    filters: {
      field: date_filter
      value: "30 days"
    }
  }

  join: ga_sessions_radiosearch {
    type: inner
    relationship: one_to_many
    sql_on: ${ga_sessions_radiosearch.full_Visitor_Id} = ${ga_sessions_radio.full_visitor_id} ;;
  }

}
