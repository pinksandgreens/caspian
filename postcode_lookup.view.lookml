- view: postcode_lookup
  sql_table_name: publications.postcode_lookup
  fields:

  - dimension: id
    hidden: TRUE
    type: string
    sql: ${TABLE}.id
    
  - dimension: postcode
    hidden: FALSE
    type: string
    sql: ${TABLE}.postcode
    
  - dimension: latitude
    hidden: FALSE
    type: string
    sql: ${TABLE}.latitude
    
  - dimension: longitude
    hidden: FALSE
    type: string
    sql: ${TABLE}.longitude
    
  - dimension: location
    label: 'Latitude/Longitude Location'
    type: location
    sql_latitude: ROUND(${TABLE}.latitude,1)
    sql_longitude: ROUND(${TABLE}.longitude,1)
