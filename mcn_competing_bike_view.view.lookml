- view: mcn_competing_bike_view
  sql_table_name: |
      ( SELECT
          COMPETITORBIKEOUTPUT.BIKE,
          COUNT(COMPETITORBIKEOUTPUT.BIKE) AS VIEWS
        FROM
          (SELECT 
            REGEXP_EXTRACT(FULLBIGQUERYTABLERESULTS.pagePath, r'^.*\/(ajp|ajs|aprilia|baotian|benelli|beta|bimota|bmw|bourget|bridgestone|bsa|buell|bullit|cagiva|can\-am|ccm|cpi|daelim|derbi|ducati|ebr|enfield|francis\-barnett|gas\-gas|gilera|hanway|harley\-davidson|herald|honda|honley|husaberg|husqvarna|hyosung|indian|jianshe|kawasaki|keeway|ktm|kymco|lambretta|laverda|lexmoto|lifan|lml|mash|montesa|morini|moto\-guzzi|moto\-roma|mv\-agusta|mz|new\-imperial|nippi|nipponia|norton|peugeot|piaggio|pulse|rickman|rieju|sachs|scorpa|sfm|sherco|sinnis|skyteam|stomp|superbyke|suzuki|swm|sym|tgb|triumph|ural|victory|vincent|vulcan|wk\-bikes|yamaha|zero|zongshen|zontes)\/.+?\/.*') + ' ' + REGEXP_EXTRACT(FULLBIGQUERYTABLERESULTS.pagePath, r'^.*\/(?:ajp|ajs|aprilia|baotian|benelli|beta|bimota|bmw|bourget|bridgestone|bsa|buell|bullit|cagiva|can\-am|ccm|cpi|daelim|derbi|ducati|ebr|enfield|francis\-barnett|gas\-gas|gilera|hanway|harley\-davidson|herald|honda|honley|husaberg|husqvarna|hyosung|indian|jianshe|kawasaki|keeway|ktm|kymco|lambretta|laverda|lexmoto|lifan|lml|mash|montesa|morini|moto\-guzzi|moto\-roma|mv\-agusta|mz|new\-imperial|nippi|nipponia|norton|peugeot|piaggio|pulse|rickman|rieju|sachs|scorpa|sfm|sherco|sinnis|skyteam|stomp|superbyke|suzuki|swm|sym|tgb|triumph|ural|victory|vincent|vulcan|wk\-bikes|yamaha|zero|zongshen|zontes)\/(.+?)\/.*') AS BIKE
          FROM
            (SELECT
              fullVisitorId AS VisitorId, 
            FROM
              FLATTEN(
                (SELECT
                  *
                FROM
                  (SELECT * FROM {% table_date_range date_filter 111489521.ga_sessions_ %},{% table_date_range date_filter 111489521.ga_sessions_intraday_ %})
                )
              , hits)
            WHERE {% condition bike_filter %} hits.page.pagePath {% endcondition %} AND geoNetwork.country = 'United Kingdom' AND hits.type = 'PAGE'
            GROUP BY VisitorId
            ) AS BIGQUERYVISITORRESULTS
            JOIN
            (SELECT
              fullVisitorId AS VisitorId, 
              hits.page.pagePath AS pagePath 
            FROM
              FLATTEN(
                (SELECT
                  *
                FROM
                  (SELECT * FROM {% table_date_range date_filter 111489521.ga_sessions_ %},{% table_date_range date_filter 111489521.ga_sessions_intraday_ %})
                )
              , hits)
            WHERE (hits.page.pagePath LIKE '%ajp%' OR hits.page.pagePath LIKE '%ajs%' OR hits.page.pagePath LIKE '%aprilia%' OR hits.page.pagePath LIKE '%baotian%' OR hits.page.pagePath LIKE '%benelli%' OR hits.page.pagePath LIKE '%beta%' OR hits.page.pagePath LIKE '%bimota%' OR hits.page.pagePath LIKE '%bmw%' OR hits.page.pagePath LIKE '%bourget%' OR hits.page.pagePath LIKE '%bridgestone%' OR hits.page.pagePath LIKE '%bsa%' OR hits.page.pagePath LIKE '%buell%' OR hits.page.pagePath LIKE '%bullit%' OR hits.page.pagePath LIKE '%cagiva%' OR hits.page.pagePath LIKE '%can-am%' OR hits.page.pagePath LIKE '%ccm%' OR hits.page.pagePath LIKE '%cpi%' OR hits.page.pagePath LIKE '%daelim%' OR hits.page.pagePath LIKE '%derbi%' OR hits.page.pagePath LIKE '%ducati%' OR hits.page.pagePath LIKE '%ebr%' OR hits.page.pagePath LIKE '%enfield%' OR hits.page.pagePath LIKE '%francis-barnett%' OR hits.page.pagePath LIKE '%gas-gas%' OR hits.page.pagePath LIKE '%gilera%' OR hits.page.pagePath LIKE '%hanway%' OR hits.page.pagePath LIKE '%harley-davidson%' OR hits.page.pagePath LIKE '%herald%' OR hits.page.pagePath LIKE '%honda%' OR hits.page.pagePath LIKE '%honley%' OR hits.page.pagePath LIKE '%husaberg%' OR hits.page.pagePath LIKE '%husqvarna%' OR hits.page.pagePath LIKE '%hyosung%' OR hits.page.pagePath LIKE '%indian%' OR hits.page.pagePath LIKE '%jianshe%' OR hits.page.pagePath LIKE '%kawasaki%' OR hits.page.pagePath LIKE '%keeway%' OR hits.page.pagePath LIKE '%ktm%' OR hits.page.pagePath LIKE '%kymco%' OR hits.page.pagePath LIKE '%lambretta%' OR hits.page.pagePath LIKE '%laverda%' OR hits.page.pagePath LIKE '%lexmoto%' OR hits.page.pagePath LIKE '%lifan%' OR hits.page.pagePath LIKE '%lml%' OR hits.page.pagePath LIKE '%mash%' OR hits.page.pagePath LIKE '%montesa%' OR hits.page.pagePath LIKE '%morini%' OR hits.page.pagePath LIKE '%moto-guzzi%' OR hits.page.pagePath LIKE '%moto-roma%' OR hits.page.pagePath LIKE '%mv-agusta%' OR hits.page.pagePath LIKE '%mz%' OR hits.page.pagePath LIKE '%new-imperial%' OR hits.page.pagePath LIKE '%nippi%' OR hits.page.pagePath LIKE '%nipponia%' OR hits.page.pagePath LIKE '%norton%' OR hits.page.pagePath LIKE '%peugeot%' OR hits.page.pagePath LIKE '%piaggio%' OR hits.page.pagePath LIKE '%pulse%' OR hits.page.pagePath LIKE '%rickman%' OR hits.page.pagePath LIKE '%rieju%' OR hits.page.pagePath LIKE '%sachs%' OR hits.page.pagePath LIKE '%scorpa%' OR hits.page.pagePath LIKE '%sfm%' OR hits.page.pagePath LIKE '%sherco%' OR hits.page.pagePath LIKE '%sinnis%' OR hits.page.pagePath LIKE '%skyteam%' OR hits.page.pagePath LIKE '%stomp%' OR hits.page.pagePath LIKE '%superbyke%' OR hits.page.pagePath LIKE '%suzuki%' OR hits.page.pagePath LIKE '%swm%' OR hits.page.pagePath LIKE '%sym%' OR hits.page.pagePath LIKE '%tgb%' OR hits.page.pagePath LIKE '%triumph%' OR hits.page.pagePath LIKE '%ural%' OR hits.page.pagePath LIKE '%victory%' OR hits.page.pagePath LIKE '%vincent%' OR hits.page.pagePath LIKE '%vulcan%' OR hits.page.pagePath LIKE '%wk-bikes%' OR hits.page.pagePath LIKE '%yamaha%' OR hits.page.pagePath LIKE '%zero%' OR hits.page.pagePath LIKE '%zongshen%' OR hits.page.pagePath LIKE '%zontes%')
            AND geoNetwork.country = 'United Kingdom' AND hits.type = 'PAGE'
            ) AS FULLBIGQUERYTABLERESULTS
          ON BIGQUERYVISITORRESULTS.VisitorId = FULLBIGQUERYTABLERESULTS.VisitorId
          ) AS COMPETITORBIKEOUTPUT
          GROUP BY COMPETITORBIKEOUTPUT.BIKE
          ORDER BY VIEWS DESC
          LIMIT 50)

  fields:
  - filter: date_filter
    type: date
  # TABLE_DATE_RANGE([uplifted-light-89310:114668488.ga_sessions_],DATE_ADD(CURRENT_TIMESTAMP(), -1, 'YEAR'),CURRENT_TIMESTAMP())
  - filter: bike_filter 
    label: 'FILTER by BIKE'
    
  - measure: VIEWS
    type: sum
    sql: ${TABLE}.VIEWS
    
  - dimension: BIKE
    primary_key: true
    sql: ${TABLE}.COMPETITORBIKEOUTPUT.BIKE


