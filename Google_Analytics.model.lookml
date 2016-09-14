- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: google_analytics_top_line
  label: 'Google Analytics - Top Line'
  sql_table_name: publications.google_analytics_top_line
  persist_for: 20 hour
  
- explore: google_analytics_pages
  label: 'Google Analytics - Pages'
  sql_table_name: publications.google_analytics_pages
  persist_for: 20 hour
  
- explore: google_analytics_channels
  label: 'Google Analytics - Channels'
  sql_table_name: publications.google_analytics_channels
  persist_for: 20 hour
  
- explore: integrated_ads
  label: 'Advertisement Data'
  sql_table_name: publications.integrated_ads
  persist_for: 20 hour
  
- explore: google_analytics_dfp
  label: 'Google Analytics - DFP'
  sql_table_name: publications.google_analytics_dfp
  persist_for: 20 hour
 
- explore: audiometrix_countries
  label: 'Audiometrix - by Countries'
  sql_table_name: publications.audiometrix_countries
  persist_for: 20 hour 

- explore: audiometrix_devices
  label: 'Audiometrix - by Device'
  sql_table_name: publications.audiometrix_devices
  persist_for: 20 hour 
