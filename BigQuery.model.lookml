- connection: bigquery-connection

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- label: 'BigQuery - Brands'

- explore: ga_sessions # the view to start exploring from
  label: 'BigQuery - Lifestyle'
  always_filter:
    date_filter: 30 days #This will be the default date range.
  joins:
    - join: ga_sessions_lifestyle_crossover
      type: inner
      relationship: one_to_many
      sql_on: ${ga_sessions_lifestyle_crossover.full_Visitor_Id} = ${ga_sessions.full_visitor_id}

# Hidden until we get a data layer change      
#     - join: ga_sessions_lifestyle_articles
#       type: inner
#       relationship: one_to_many
#       sql_on: ${ga_sessions_lifestyle_articles.Unique_ID} = ${ga_sessions.full_visitor_id}
      

- explore: ga_sessions_parkers
  label: 'BigQuery - Parkers'
  always_filter:
    date_filter: 30 days    
  joins:
    - join: ga_sessions_advcompsearch
      type: inner
      relationship: one_to_many
      sql_on: ${ga_sessions_advcompsearch.full_Visitor_Id} = ${ga_sessions_parkers.full_visitor_id}

    - join: ga_sessions_parkers_brandsearch
      type: inner
      relationship: one_to_many
      sql_on: ${ga_sessions_parkers_brandsearch.full_Visitor_Id} = ${ga_sessions_parkers.full_visitor_id}
      
- explore: ga_sessions_mcn_transactions
  hidden: TRUE
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

- explore: parkers_competing_car_view
  hidden: TRUE
  label: 'BigQuery - Parkers - Find Competing Cars'
  always_filter:
    date_filter: 30 days
    
- explore: mcn_competing_bike_view
  hidden: TRUE
  label: 'BigQuery - MCN - Find Competing Bikes'
  always_filter:
    date_filter: 30 days
    
- explore: ccfs_competing_car_views
#   hidden: TRUE
  label: 'BigQuery - CCFS - Find Competing Classic Cars'
  always_filter:
    date_filter: 30 days

- explore: ga_sessions_mcn
  label: 'BigQuery - MCN'
  always_filter:
    date_filter: 30 days 
  joins:
    - join: ga_sessions_mcn_advcompsearch
      type: inner
      relationship: one_to_many
      sql_on: ${ga_sessions_mcn_advcompsearch.full_Visitor_Id} = ${ga_sessions_mcn.full_visitor_id}

    - join: ga_sessions_mcn_brandsearch
      type: inner
      relationship: one_to_many
      sql_on: ${ga_sessions_mcn_brandsearch.full_Visitor_Id} = ${ga_sessions_mcn.full_visitor_id}
    
  
