- view: ga_sessions_mcn_brandsearch
  label: 'x: Make & Model Search'
  derived_table:
    sql: |
      SELECT
        fullVisitorId AS ga_sessions_full_visitor_id,
        REGEXP_EXTRACT(hits.page.pagePath, r'^.*\/(ajp|ajs|aprilia|baotian|benelli|beta|bimota|bmw|bourget|bridgestone|bsa|buell|bullit|cagiva|can\-am|ccm|cpi|daelim|derbi|ducati|ebr|enfield|francis\-barnett|gas\-gas|gilera|hanway|harley\-davidson|herald|honda|honley|husaberg|husqvarna|hyosung|indian|jianshe|kawasaki|keeway|ktm|kymco|lambretta|laverda|lexmoto|lifan|lml|mash|montesa|morini|moto\-guzzi|moto\-roma|mv\-agusta|mz|new\-imperial|nippi|nipponia|norton|peugeot|piaggio|pulse|rickman|rieju|sachs|scorpa|sfm|sherco|sinnis|skyteam|stomp|superbyke|suzuki|swm|sym|tgb|triumph|ural|victory|vincent|vulcan|wk\-bikes|yamaha|zero|zongshen|zontes)\/.+?\/.*') + ' ' + REGEXP_EXTRACT(hits.page.pagePath, r'^.*\/(?:ajp|ajs|aprilia|baotian|benelli|beta|bimota|bmw|bourget|bridgestone|bsa|buell|bullit|cagiva|can\-am|ccm|cpi|daelim|derbi|ducati|ebr|enfield|francis\-barnett|gas\-gas|gilera|hanway|harley\-davidson|herald|honda|honley|husaberg|husqvarna|hyosung|indian|jianshe|kawasaki|keeway|ktm|kymco|lambretta|laverda|lexmoto|lifan|lml|mash|montesa|morini|moto\-guzzi|moto\-roma|mv\-agusta|mz|new\-imperial|nippi|nipponia|norton|peugeot|piaggio|pulse|rickman|rieju|sachs|scorpa|sfm|sherco|sinnis|skyteam|stomp|superbyke|suzuki|swm|sym|tgb|triumph|ural|victory|vincent|vulcan|wk\-bikes|yamaha|zero|zongshen|zontes)\/(.+?)\/.*') AS CAR
      FROM
        ( SELECT * FROM {% table_date_range ga_sessions_mcn.date_filter 22661559.ga_sessions_ %})
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
    
  - dimension: Pages_Count1
    label: 'Pageview Count'
    hidden: TRUE
    type: string
    sql: |
      CASE
        WHEN ${TABLE}.CAR IS NOT NULL THEN 1
      END
      
  - measure: Pages_Count
    label: 'Pageview Count'
    type: sum
    sql: ${Pages_Count1}
 
  - dimension: Make
    type: string
    sql: REGEXP_EXTRACT(${TABLE}.CAR,'^(.*) ') 
    
  - dimension: Model
    type: string
    sql: REGEXP_EXTRACT(${TABLE}.CAR,' (.*)')
    
    
  