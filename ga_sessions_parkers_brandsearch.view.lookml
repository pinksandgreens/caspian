- view: ga_sessions_parkers_brandsearch
  label: 'x: Make & Model Search'
  derived_table:
    sql: |
      SELECT
        fullVisitorId AS ga_sessions_full_visitor_id,
        REGEXP_EXTRACT(hits.page.pagePath, r'^.*\/(abarth|alfa-romeo|aston\-martin|audi|bentley|bmw|bugatti|caterham|citroën|dacia|ds|ferrari|fiat|ford|honda|hyundai|infiniti|jaguar|jeep|kia|lamborghini|land-rover|lexus|lotus|maserati|mazda|mclaren|mercedes\-benz|mg|mg-motor-uk|mini|mitsubishi|nissan|peugeot|porsche|renault|rolls\-royce|seat|skoda|smart|ssangyong|subaru|suzuki|tesla|toyota|vauxhall|volkswagen|volvo)\/(?:.+?)\/(?:.*)?') + ' ' + REGEXP_EXTRACT(hits.page.pagePath, r'^.*\/(?:abarth|alfa-romeo|aston\-martin|audi|bentley|bmw|bugatti|caterham|citroën|dacia|ds|ferrari|fiat|ford|honda|hyundai|infiniti|jaguar|jeep|kia|lamborghini|land-rover|lexus|lotus|maserati|mazda|mclaren|mercedes\-benz|mg|mg-motor-uk|mini|mitsubishi|nissan|peugeot|porsche|renault|rolls\-royce|seat|skoda|smart|ssangyong|subaru|suzuki|tesla|toyota|vauxhall|volkswagen|volvo)\/(.+?)\/(?:.*)?') AS CAR,
      FROM
        ( SELECT * FROM {% table_date_range ga_sessions_parkers.date_filter 24089672.ga_sessions_ %})
      GROUP BY 1,2
      ORDER BY 1 

  fields:
  - filter: date_filter
    type: date
  # TABLE_DATE_RANGE([uplifted-light-89310:114668488.ga_sessions_],DATE_ADD(CURRENT_TIMESTAMP(), -1, 'YEAR'),CURRENT_TIMESTAMP())
  
#   - dimension: ConcatID_PPath
#     label: 'ID-Page'
#     type: string
#     sql: CONCAT(${TABLE}.ga_sessions_full_visitor_id,${TABLE}.CAR)

  - dimension: full_Visitor_Id
    hidden: TRUE
    label: 'FullVisitorID'
    type: string
    primary_key: true
    sql: ${TABLE}.ga_sessions_full_visitor_id
    
  - dimension: Make_Model
    label: 'Make & Model'
    type: string
    sql: ${TABLE}.CAR
 
  - dimension: Make
    type: string
    sql: REGEXP_EXTRACT(${TABLE}.CAR,'^(.*) ') 
    
  - dimension: Model
    type: string
    sql: REGEXP_EXTRACT(${TABLE}.CAR,' (.*)')
    
    
  