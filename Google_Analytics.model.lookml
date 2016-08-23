- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: google_analytics_top_line
  label: 'Google Analytics'
  sql_table_name: publications.google_analytics_top_line
  persist_for: 20 hour