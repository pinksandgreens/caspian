- connection: bigquery-connection

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: ga_sessions
  label: 'BigQuery - Deep Dive'
  always_filter:
    date_filter: 15 days #This will be the default date range.
#   joins:
#   
#     - join: brand_lookup
#       type: inner
#       relationship: one_to_one
#       sql_table_name: publications.brand_lookup
#       sql_on: ${brand_lookup.bra_code} = ${ga_sessions.hits_page_hostname_pp1}
# - explore: ga_sessions
#   label: 'Testing123'
#   sql_table_name: 114668488
#   persist_for: 20 hour
# 
