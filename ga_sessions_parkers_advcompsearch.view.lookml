- view: ga_sessions_advcompsearch
  label: 'x: Competitior Search'
  derived_table:
    sql: |
      SELECT
        fullVisitorId AS ga_sessions_full_visitor_id,
        group_concat(UNIQUE(hits.page.pagePath)) AS hits__page__page_path_level1
      FROM
        ( SELECT * FROM {% table_date_range ga_sessions_parkers.date_filter 24089672.ga_sessions_ %})
      GROUP BY 1
      ORDER BY 1 

  fields:
  - filter: date_filter
    type: date
  # TABLE_DATE_RANGE([uplifted-light-89310:114668488.ga_sessions_],DATE_ADD(CURRENT_TIMESTAMP(), -1, 'YEAR'),CURRENT_TIMESTAMP())
  
  - dimension: ConcatID_PPath
    type: string
    sql: CONCAT(${TABLE}.ga_sessions_full_visitor_id,${TABLE}.hits__page__page_path_level1)

  - dimension: full_Visitor_Id
    type: string
    primary_key: true
    sql: ${TABLE}.ga_sessions_full_visitor_id
    
  - dimension: Brands_Visited
    type: string
    sql: ${TABLE}.hits__page__page_path_level1
 
  - dimension: Make
    type: string
    sql: |
      CASE 
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Abarth%' THEN 'Abarth'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Alfa-Romeo%' THEN 'Alfa-Romeo'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Aston-Martin%' THEN 'Aston-Martin'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Audi%' THEN 'Audi'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Bentley%' THEN 'Bentley'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%BMW%' THEN 'BMW'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Bugatti%' THEN 'Bugatti'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Caterham%' THEN 'Caterham'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Citroën%' THEN 'Citroën'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Dacia%' THEN 'Dacia'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%DS%' THEN 'DS'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Ferrari%' THEN 'Ferrari'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Fiat%' THEN 'Fiat'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Ford%' THEN 'Ford'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Honda%' THEN 'Honda'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Hyundai%' THEN 'Hyundai'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Infiniti%' THEN 'Infiniti'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Jaguar%' THEN 'Jaguar'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Jeep%' THEN 'Jeep'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Kia%' THEN 'Kia'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Lamborghini%' THEN 'Lamborghini'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Land-Rover%' THEN 'Land-Rover'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Lexus%' THEN 'Lexus'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Lotus%' THEN 'Lotus'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Maserati%' THEN 'Maserati'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Mazda%' THEN 'Mazda'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%McLaren%' THEN 'McLaren'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Mercedes-Benz%' THEN 'Mercedes-Benz'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%MG%' THEN 'MG'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%MG-Motor-UK%' THEN 'MG-Motor-UK'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%MINI%' THEN 'MINI'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Mitsubishi%' THEN 'Mitsubishi'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Nissan%' THEN 'Nissan'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Peugeot%' THEN 'Peugeot'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Porsche%' THEN 'Porsche'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Renault%' THEN 'Renault'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Rolls-Royce%' THEN 'Rolls-Royce'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%SEAT%' THEN 'SEAT'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Skoda%' THEN 'Skoda'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Smart%' THEN 'Smart'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%SsangYong%' THEN 'SsangYong'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Subaru%' THEN 'Subaru'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Suzuki%' THEN 'Suzuki'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Tesla%' THEN 'Tesla'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Toyota%' THEN 'Toyota'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Vauxhall%' THEN 'Vauxhall'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Volkswagen%' THEN 'Volkswagen'
        WHEN ${TABLE}.hits__page__page_path_level1 ilike '%Volvo%' THEN 'Volvo'
        ELSE 'No-Make'
      END

  - measure: Unique_Users
    label: 'Unique Users'
    type: count_distinct
    sql: ${TABLE}.ga_sessions_full_visitor_id
    
    
  