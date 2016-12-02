- connection: bigquery-connection

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- label: 'BigQuery - Projects'

- explore: ga_sessions_header_bidding
  label: 'BigQuery - Header Bidding Platform'
  always_filter:
    date_filter: 30 days #This will be the default date range.

  