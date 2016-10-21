- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: google_analytics_top_line
  label: 'Google Analytics'
  sql_table_name: publications.google_analytics_top_line
  persist_for: 20 hour
  
  joins:
    - join: brand_lookup
      type: inner
      relationship: one_to_one
      sql_on: ${brand_lookup.bra_code} = ${google_analytics_top_line.brand_code}
  
- explore: google_analytics_pages
  hidden: TRUE
  label: 'Google Analytics - Pages'
  sql_table_name: publications.google_analytics_pages
  persist_for: 20 hour
  
- explore: google_analytics_channels
  hidden: TRUE
  label: 'Google Analytics - Channels'
  sql_table_name: publications.google_analytics_channels
  persist_for: 20 hour
  
- explore: integrated_ads
  hidden: TRUE
  label: 'Advertisement Data'
  sql_table_name: publications.integrated_ads
  persist_for: 20 hour
  
- explore: google_analytics_dfp
  hidden: TRUE
  label: 'Google Analytics - DFP'
  sql_table_name: publications.google_analytics_dfp
  persist_for: 20 hour
 
- explore: audiometrix_countries
  label: 'Audiometrix Historical - by Countries'
  sql_table_name: publications.audiometrix_countries
  persist_for: 20 hour 
  joins:
  
    - join: brand_lookup
      type: inner
      relationship: one_to_one
      sql_on: ${audiometrix_countries.brand_code}=${brand_lookup.bra_code}
      
- explore: audiometrix_devices
  label: 'Audiometrix Historical - by Device'
  sql_table_name: publications.audiometrix_devices
  persist_for: 20 hour 
  joins:
  
    - join: brand_lookup
      type: inner
      relationship: one_to_one
      sql_on: ${audiometrix_devices.brand_code}=${brand_lookup.bra_code}

- explore: audiometrix_realtime
  hidden: TRUE
  label: 'Audiometrix - Realtime'
  sql_table_name: publications.audiometrix_realtime
  
- explore: audiometrix_realtime_devices
  hidden: TRUE
  label: 'Audiometrix - Realtime Devices'
  sql_table_name: publications.audiometrix_realtime_devices
  
- explore: google_analytics_devices
  hidden: TRUE
  label: 'Google Analytics - Devices'
  sql_table_name: publications.google_analytics_devices
  persist_for: 20 hour

- explore: barnacletopline
  hidden: TRUE
  label: 'Barnacle - Top Line'
  sql_table_name: publications.barnacletopline
  persist_for: 20 hour

- explore: barnaclepages
  hidden: TRUE
  label: 'Barnacle - Pages'
  sql_table_name: publications.barnaclepages
  persist_for: 20 hour

  