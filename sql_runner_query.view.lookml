
- view: sql_runner_query
  derived_table:
    sql: |
       SELECT
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
            limit 100;

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: domain_userid
    type: string
    sql: ${TABLE}.domain_userid

  - dimension: domain_sessionidx
    type: number
    sql: ${TABLE}.domain_sessionidx

  - dimension: user_id
    type: string
    sql: ${TABLE}.user_id

  - dimension: event_id
    type: string
    sql: ${TABLE}.event_id

  - dimension: app_id
    type: string
    sql: ${TABLE}.app_id

  - dimension: event
    type: string
    sql: ${TABLE}.event

  - dimension: geo_country
    type: string
    sql: ${TABLE}.geo_country

  - dimension: geo_latitude
    type: number
    sql: ${TABLE}.geo_latitude

  - dimension: geo_longitude
    type: number
    sql: ${TABLE}.geo_longitude

  - dimension_group: collector_tstamp
    type: time
    sql: ${TABLE}.collector_tstamp

  - dimension_group: dvce_created_tstamp
    type: time
    sql: ${TABLE}.dvce_created_tstamp

  - dimension: dvce_type
    type: string
    sql: ${TABLE}.dvce_type

  - dimension: page_title
    type: string
    sql: ${TABLE}.page_title

  - dimension: page_urlscheme
    type: string
    sql: ${TABLE}.page_urlscheme

  - dimension: page_urlhost
    type: string
    sql: ${TABLE}.page_urlhost

  - dimension: page_urlpath
    type: string
    sql: ${TABLE}.page_urlpath

  - dimension: page_urlport
    type: number
    sql: ${TABLE}.page_urlport

  - dimension: page_urlquery
    type: string
    sql: ${TABLE}.page_urlquery

  - dimension: page_urlfragment
    type: string
    sql: ${TABLE}.page_urlfragment

  - dimension: refr_medium
    type: string
    sql: ${TABLE}.refr_medium

  - dimension: refr_source
    type: string
    sql: ${TABLE}.refr_source

  - dimension: refr_term
    type: string
    sql: ${TABLE}.refr_term

  - dimension: refr_urlhost
    type: string
    sql: ${TABLE}.refr_urlhost

  - dimension: refr_urlpath
    type: string
    sql: ${TABLE}.refr_urlpath

  - dimension: pp_xoffset_max
    type: number
    sql: ${TABLE}.pp_xoffset_max

  - dimension: pp_xoffset_min
    type: number
    sql: ${TABLE}.pp_xoffset_min

  - dimension: pp_yoffset_max
    type: number
    sql: ${TABLE}.pp_yoffset_max

  - dimension: pp_yoffset_min
    type: number
    sql: ${TABLE}.pp_yoffset_min

  - dimension: se_category
    type: string
    sql: ${TABLE}.se_category

  - dimension: se_action
    type: string
    sql: ${TABLE}.se_action

  - dimension: se_label
    type: string
    sql: ${TABLE}.se_label

  - dimension: se_property
    type: string
    sql: ${TABLE}.se_property

  - dimension: se_value
    type: number
    sql: ${TABLE}.se_value

  - dimension: doc_height
    type: number
    sql: ${TABLE}.doc_height

  - dimension: doc_width
    type: number
    sql: ${TABLE}.doc_width

  - dimension: tr_orderid
    type: string
    sql: ${TABLE}.tr_orderid

  - dimension: tr_affiliation
    type: string
    sql: ${TABLE}.tr_affiliation

  - dimension: tr_total
    type: number
    sql: ${TABLE}.tr_total

  - dimension: tr_tax
    type: number
    sql: ${TABLE}.tr_tax

  - dimension: tr_city
    type: string
    sql: ${TABLE}.tr_city

  - dimension: tr_state
    type: string
    sql: ${TABLE}.tr_state

  - dimension: tr_country
    type: string
    sql: ${TABLE}.tr_country

  - dimension: ti_orderid
    type: string
    sql: ${TABLE}.ti_orderid

  - dimension: ti_category
    type: string
    sql: ${TABLE}.ti_category

  - dimension: ti_sku
    type: string
    sql: ${TABLE}.ti_sku

  - dimension: ti_name
    type: string
    sql: ${TABLE}.ti_name

  - dimension: ti_price
    type: number
    sql: ${TABLE}.ti_price

  - dimension: ti_quantity
    type: number
    sql: ${TABLE}.ti_quantity

  sets:
    detail:
      - domain_userid
      - domain_sessionidx
      - user_id
      - event_id
      - app_id
      - event
      - geo_country
      - geo_latitude
      - geo_longitude
      - collector_tstamp_time
      - dvce_created_tstamp_time
      - dvce_type
      - page_title
      - page_urlscheme
      - page_urlhost
      - page_urlpath
      - page_urlport
      - page_urlquery
      - page_urlfragment
      - refr_medium
      - refr_source
      - refr_term
      - refr_urlhost
      - refr_urlpath
      - pp_xoffset_max
      - pp_xoffset_min
      - pp_yoffset_max
      - pp_yoffset_min
      - se_category
      - se_action
      - se_label
      - se_property
      - se_value
      - doc_height
      - doc_width
      - tr_orderid
      - tr_affiliation
      - tr_total
      - tr_tax
      - tr_city
      - tr_state
      - tr_country
      - ti_orderid
      - ti_category
      - ti_sku
      - ti_name
      - ti_price
      - ti_quantity

