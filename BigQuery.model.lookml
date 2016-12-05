- connection: bigquery-connection

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- label: 'BigQuery - Brands'

- explore: ga_sessions
  label: 'BigQuery - Lifestyle'
  always_filter:
    date_filter: 30 days #This will be the default date range.
  joins:
    - join: ga_sessions_lifestyle_crossover
      type: inner
      relationship: one_to_many
      sql_on: ${ga_sessions_lifestyle_crossover.full_Visitor_Id} = ${ga_sessions.full_visitor_id}

- explore: ga_sessions_parkers
  label: 'BigQuery - Parkers'
  always_filter:
    date_filter: 30 days    
  joins:
    - join: ga_sessions_advcompsearch
      view_label: 'JR_TEST'
      type: inner
      relationship: one_to_many
      sql_on: ${ga_sessions_advcompsearch.full_Visitor_Id} = ${ga_sessions_parkers.full_visitor_id}
    
- explore: ga_sessions_mcn_transactions
  label: 'BigQuery - MCN Transaction (BFS)'
  always_filter:
    date_filter: 30 days #This will be the default date range.  

- explore: ga_sessions_empire
  label: 'BigQuery - Empire'
  always_filter:
    date_filter: 30 days
    
- explore: ga_sessions_debrief
  label: 'BigQuery - The Debrief'
  always_filter:
    date_filter: 30 days

  
