- connection: bigquery-connection

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: ga_sessions
  label: 'BigQuery - Lifestyle/Empire'
  always_filter:
    date_filter: 15 days #This will be the default date range.
  joins:
    - join: ga_sessions_lifestyle_crossover
      type: inner
      relationship: one_to_many
      sql_on: ${ga_sessions_lifestyle_crossover.full_Visitor_Id} = ${ga_sessions.full_visitor_id}
    
# - explore: ga_sessions_lifestyle_crossover
#   label: 'BigQuery - Lifestyle-Crossover'
#   always_filter:
#     date_filter: 200 days #This will be the default date range.
    
- explore: ga_sessions_parkers
  label: 'BigQuery - Parkers'
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
