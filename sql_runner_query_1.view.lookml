
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
             dvce_type,
             page_title,
             page_urlscheme,
             page_urlhost,
             page_urlpath,
             page_urlport,
             page_urlquery,
             page_urlfragment,
             refr_medium,
             refr_source,
             refr_term,
             refr_urlhost,
             refr_urlpath,
             pp_xoffset_max,
             pp_xoffset_min,
             pp_yoffset_max,
             pp_yoffset_min,
             se_category,
             se_action,
             se_label,
             se_property,
             se_value,
             doc_height,
             doc_width,
             tr_orderid,
             tr_affiliation,
             tr_total,
             tr_tax,
             tr_city,
             tr_state,
             tr_country,
             ti_orderid,
             ti_category,
             ti_sku,
             ti_name,
             ti_price,
             ti_quantity
           FROM snowplow.events
           WHERE domain_userid IS NOT NULL
           AND collector_tstamp > current_date - 35
      )
      SELECT 
        sql_runner_query.domain_userid AS "sql_runner_query.domain_userid",
        geo_latitude,
        geo_longitude
      FROM sql_runner_query
      
      GROUP BY 1,2,3
      ORDER BY 1
      limit 20

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

  sets:
    detail:
      - sql_runner_query_domain_userid
      - geo_latitude
      - geo_longitude

