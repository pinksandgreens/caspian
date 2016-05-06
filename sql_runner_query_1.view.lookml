
- view: sql_runner_query_1
  derived_table:
    sql: |
      WITH sql_runner_query AS (SELECT
             domain_userid, 
             domain_sessionidx,
             user_id,
             event_id,
             app_id,
             event,
             geo_country,
             geo_latitude,
             geo_longitude,
             collector_tstamp,
             dvce_created_tstamp,
             dvce_type
           FROM snowplow.events
           WHERE domain_userid IS NOT NULL
      )
      SELECT 
        sql_runner_query.domain_userid AS "sql_runner_query.domain_userid",
        geo_latitude,
        geo_longitude
      FROM sql_runner_query
      
      GROUP BY 1,2,3
      ORDER BY 1
      
  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: sql_runner_query_domain_userid
    type: string
    sql: ${TABLE}."sql_runner_query.domain_userid"

  - dimension: geo_latitude
    type: number
    sql: ${TABLE}.geo_latitude

  - dimension: geo_longitude
    type: number
    sql: ${TABLE}.geo_longitude


  - dimension: geo_location
    type: location
    sql_latitude:  ${geo_latitude}
    sql_longitude: ${geo_longitude}

  sets:
    detail:
      - sql_runner_query_domain_userid
      - geo_latitude
      - geo_longitude

