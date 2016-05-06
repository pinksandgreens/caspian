# Copyright (c) 2013-2015 Snowplow Analytics Ltd. All rights reserved.
#
# This program is licensed to you under the Apache License Version 2.0,
# and you may not use this file except in compliance with the Apache License Version 2.0.
# You may obtain a copy of the Apache License Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0.
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the Apache License Version 2.0 is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the Apache License Version 2.0 for the specific language governing permissions and limitations there under.
#
# Version: 3-0-0
#
# Authors: Yali Sassoon, Christophe Bogaert
# Copyright: Copyright (c) 2013-2015 Snowplow Analytics Ltd
# License: Apache License Version 2.0

- connection: caspian-live

- view: events
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
    
    sql_trigger_value: SELECT DATE(CURRENT_TIMESTAMP - interval '4 hour')
    distkey: domain_userid
    sortkeys: [domain_userid, domain_sessionidx, collector_tstamp]
  
  fields:

  # DIMENSIONS #
  
  - dimension: event_id
    primary_key: true
    sql: ${TABLE}.event_id
  
  - dimension: event_type
    sql: ${TABLE}.event
      
  - dimension: dvce_type
    sql: ${TABLE}.dvce_type
    
  - dimension: app_id
    sql: ${TABLE}.app_id
    
  - dimension: brand
    sql: |
      case
      when ${app_id} like '%ABR%' then 'Absolute Radio'
      when ${app_id} like '%MCN%' then 'Motorcycle News'
      when ${app_id} like '%DBF%' then 'Debrief'
      when ${app_id} like '%CAR%' then 'Car Magazine'
      when ${app_id} like '%PAR%' then 'Parkers'
      when ${app_id} like '%YRS%' then 'Yours'
      when ${app_id} like '%EMP%' then 'Empire'
      when ${app_id} like '%PLR%' then 'Planet Rock'
      when ${app_id} like '%TDG%' then 'Todays Golfer'
      when ${app_id} like '%KIS%' then 'Kiss'
      when ${app_id} like '%HEA%' then 'Heat'
      when ${app_id} like '%GRA%' then 'Grazia'
      when ${app_id} like '%CLO%' then 'Closer'
      when ${app_id} like '%LIF%' then 'Lifestyle.one Homepage'
      when ${app_id} like '%MAB%' then 'Mother & Baby'
      when ${app_id} like '%ABR%' then 'Absolute Radio'
      when ${app_id} like '%KER%' then 'Kerrang'
      else 'other' end
      
  - dimension: uk_only
    sql: |
      case when events.geo_country = 'GB' then 'UK Only' else 'Non UK' end
      
  - dimension: page_views_tier
    type: tier
    tiers: [0,1000,5000,10000,20000,50000,100000,500000]
    sql: ${page_views_count}
    style: integer
      
  - dimension: Country
    sql: ${TABLE}.geo_country
    
  - dimension: geo_latitude
    sql: ${TABLE}.geo_latitude
    
  - dimension: geo_longitude
    sql: ${TABLE}.geo_longitude
  
  - dimension: timestamp
    sql: ${TABLE}.collector_tstamp

  - dimension_group: timestamp
    type: time
    timeframes: [time, hour, date, week, month, day_of_week]
    sql: ${TABLE}.collector_tstamp

  - dimension: session_index
    type: number
    sql: ${TABLE}.domain_sessionidx

  - dimension: domain_userid
    sql: ${TABLE}.domain_userid
    
  - dimension: user_id
    sql: ${TABLE}.user_id

  - dimension: session_id
    sql: ${TABLE}.domain_userid || '-' || ${TABLE}.domain_sessionidx

  - dimension_group: device_timestamp
    type: time
    timeframes: [time, hour, date, week, month]
    sql: ${TABLE}.dvce_created_tstamp
    hidden: true

  - dimension: page_title
    sql: ${TABLE}.page_title

  - dimension: page_url_scheme
    sql: ${TABLE}.page_urlscheme

  - dimension: page_url_host
    sql: ${TABLE}.page_urlhost
      
  - dimension: page_url_path
    sql: ${TABLE}.page_urlpath

  - dimension: page_url_port
    type: number
    sql: ${TABLE}.page_urlport
    hidden: true

  - dimension: page_url_query
    sql: ${TABLE}.page_urlquery
    hidden: true

  - dimension: page_url_fragment
    sql: ${TABLE}.page_urlfragment
    hidden: true
    
  - dimension: refr_medium
    sql: ${TABLE}.refr_medium
    
  - dimension: first_event_in_session
    type: yesno
    sql: ${TABLE}.refr_medium != 'internal'
    
  - dimension: first_event_for_visitor
    type: yesno
    sql: ${TABLE}.refr_medium != 'internal' AND ${TABLE}.domain_sessionidx = 1
    
  - dimension: refr_source
    sql: ${TABLE}.refr_source
    
  - dimension: refr_term
    sql: ${TABLE}.refr_term
    
  - dimension: refr_url_host
    sql: ${TABLE}.refr_urlhost
    
  - dimension: refr_url_path
    sql: ${TABLE}.refr_urlpath

  - dimension: x_offset
    type: number
    sql: ${TABLE}.pp_xoffset_max

  - dimension: pp_xoffset_min
    type: number
    sql: ${TABLE}.pp_xoffset_min
    hidden: true

  - dimension: y_offset
    type: number
    sql: ${TABLE}.pp_yoffset_max

  - dimension: pp_yoffset_min
    type: number
    sql: ${TABLE}.pp_yoffset_min
    hidden: true

  - dimension: structured_event_action
    sql: ${TABLE}.se_action

  - dimension: structured_event_category
    sql: ${TABLE}.se_category

  - dimension: structured_event_label
    sql: ${TABLE}.se_label

  - dimension: structured_event_property
    sql: ${TABLE}.se_property

  - dimension: structured_event_value
    type: number
    sql: ${TABLE}.se_value
    
  - dimension: user_agent
    sql: ${TABLE}.useragent
    hidden: true
  
  # MEASURES #

  - measure: count
    type: count
    drill_fields: event_detail*

  - measure: page_pings_count
    type: count
    drill_fields: event_detail*
    filters:
      event_type: page_ping
      
  - measure: page_views_count
    type: count
    drill_fields: page_views_detail*
    filters:
      event_type: page_view

  - measure: distinct_pages_viewed_count
    type: count_distinct
    drill_fields: page_views_detail*
    sql: ${page_url_path}
    
  - measure: sessions_count
    type: count_distinct
    sql: ${session_id}
    drill_fields: detail*
    

  - measure: sessions_count_last_7days
    type: count_distinct
    sql: ${session_id}
    drill_fields: detail*
    filters:
      timestamp_date: 7 days
      
  - measure: sessions_count_last_30days
    type: count_distinct
    sql: ${session_id}
    drill_fields: detail*    
    filters: 
      timestamp_date: 30 days
    
  - measure: sessions_count_7to14_days_ago
    type: count_distinct
    sql: ${session_id}
    drill_fields: detail*    
    filters: 
      timestamp_date: 14 days ago for 7 days
      
  - measure: sessions_count_14to21_days_ago
    type: count_distinct
    sql: ${session_id}
    drill_fields: detail*    
    filters: 
      timestamp_date: 21 days ago for 7 days
      
  - measure: sessions_count_21to28_days_ago
    type: count_distinct
    sql: ${session_id}
    drill_fields: detail*    
    filters: 
      timestamp_date: 28 days ago for 7 days
      
  - measure: sessions_count_yesterday
    type: count_distinct
    sql: ${session_id}
    drill_fields: detail*    
    filters: 
      timestamp_date: yesterday
      
  - measure: sessions_count_yesterday_prior_week
    type: count_distinct
    sql: ${session_id}
    drill_fields: detail*    
    filters: 
      timestamp_date: 8 days ago for 1 day
      
  - measure: sessions_avg_last_30days
    type: number
    sql: ${sessions_count_last_30days}/30
    drill_fields: detail*    
    
  - measure: sessions_avg_last_7days
    type: number
    sql: ${sessions_count_last_7days}/7
    drill_fields: detail*   
    
  - measure: page_pings_per_session
    type: number
    value_format_name: decimal_2
    sql: NULLIF(${page_pings_count},0)/NULLIF(${sessions_count},0)::REAL

  - measure: page_pings_per_visitor
    type: number
    value_format_name: decimal_2
    sql: NULLIF(${page_pings_count},0)/NULLIF(${visitors_count},0)::REAL

  - measure: visitors_count
    type: count_distinct
    sql: ${domain_userid}
    drill_fields: visitors_detail
    #hidden: true  # Not to be shown in the UI (in UI only show visitors count for visitors table)
    
  - measure: events_per_session
    type: number
    value_format_name: decimal_2
    sql: ${count}/NULLIF(${sessions_count},0)::REAL
    
  - measure: events_per_visitor
    type: number
    value_format_name: decimal_2
    sql: ${count}/NULLIF(${visitors_count},0)::REAL

  - measure: page_views_per_sessions
    type: number
    value_format_name: decimal_2
    sql: ${page_views_count}/NULLIF(${sessions_count},0)::REAL
    
  - measure: page_views_per_visitor
    type: number
    value_format_name: decimal_2
    sql: ${page_views_count}/NULLIF(${visitors_count},0)::REAL
  
  - measure: landing_page_views_count
    type: count
    filters:
      event_type: page_view
      first_event_in_session: yes
    
  - measure: internal_page_views_count
    type: count
    filters: 
      event_type: page_view
      first_event_in_session: no
      
  - measure: approx_user_usage_in_minutes
    type: number
    value_format_name: decimal_2
    sql: APPROXIMATE COUNT( DISTINCT CONCAT(FLOOR(EXTRACT (EPOCH FROM ${TABLE}.collector_tstamp)/10), ${TABLE}.domain_userid) ) /6
    
  - measure: approx_usage_per_visitor_in_seconds
    type: number
    value_format_name: decimal_2
    sql: ${approx_user_usage_in_minutes}/NULLIF(${visitors_count}, 0)::REAL
    
  - measure: approx_usage_per_visit_in_seconds
    type: number
    value_format_name: decimal_2
    sql: ${approx_user_usage_in_minutes}/NULLIF(${sessions_count}, 0)::REAL
  
  # DRILL FIELDS#

  sets:
    event_detail:
      - session_index
      - event_type
      - device_timestamp
      - page_url_host
      - page_url_path
    
    page_views_detail:
      - page_url_host
      - page_url_path
      - device_timestamp
    
    session_detail:
      - user_id
      - session_index
      - sessions.referer_url_host
      - sessions.referer_url_path
      - sessions.landing_page
      - sessions.session_duration_seconds
      - count
    
    visitor_detail:
      - user_id
      - visitors.first_touch
      - visitor.referer_url_host
      - visitors.referer_url_path
      - visitors.last_touch
      - visitors.number_of_sessions
      - visitors.event_stream


