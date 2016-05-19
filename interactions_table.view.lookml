- view: interactions
  derived_table:
    sql: |
      SELECT DISTINCT
        identities.idd_id,
        identities.email,
        identities.created_by,
        identities.date_created,
        identities.last_updated,
        identities_keys.type,
        DATEDIFF('day', identities_keys.last_updated, CURRENT_DATE) last_updated_diff,
        CASE WHEN type = 'gigya' THEN 1 ELSE 0 END AS seen_gigya,
        CASE WHEN type = 'es' THEN 1 ELSE 0 END AS seen_es,
        CASE WHEN type = 'nudge' THEN 1 ELSE 0 END AS seen_nudge,
        CASE WHEN type = 'dmp' THEN 1 ELSE 0 END AS seen_dmp
        FROM publications.identities
      INNER JOIN publications.identities_keys ON identities_keys.idd_key_id = identities.idd_id
      
    sql_trigger_value: SELECT CURRENT_DATE
    sortkeys: [idd_id]

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: idd_id
    type: number
    sql: ${TABLE}.idd_id

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: created_by
    type: string
    sql: ${TABLE}.created_by

  - dimension_group: date_created
    type: time
    sql: ${TABLE}.date_created

  - dimension_group: last_updated
    type: time
    sql: ${TABLE}.last_updated

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension: last_updated_diff
    type: number
    sql: ${TABLE}.last_updated_diff
    
  - dimension: active_today
    type: yesno
    sql: ${last_updated_diff} = 0
    
  - dimension: active_last_7_days
    type: yesno
    sql: ${last_updated_diff} <= 7
    
  - dimension: active_last_30_days
    type: yesno
    sql: ${last_updated_diff} <= 30
    
  - dimension: active_last_3_months
    type: yesno
    sql: ${last_updated_diff} <= 90
    
  - dimension: active_last_6_months
    type: yesno
    sql: ${last_updated_diff} <= 180
    
  - dimension: active_last_12_months
    type: yesno
    sql: ${last_updated_diff} <= 365
  
  - dimension: interact_recency
    sql: |
      CASE
      WHEN ${last_updated_diff} = 0 THEN 'Today'
      WHEN ${last_updated_diff} <= 7 THEN 'Last 7 days'
      WHEN ${last_updated_diff} <= 30 THEN 'Last 30 days'
      WHEN ${last_updated_diff} <= 90 THEN 'Last 3 months'
      WHEN ${last_updated_diff} <= 180 THEN 'Last 6 months'
      WHEN ${last_updated_diff} <= 365 THEN 'Last 12 months'
      END
  
#   - dimension: active_last_7_days
#     sql: |
#       CASE
#       WHEN ${last_updated_diff} <= 7 THEN 'Y'
#       ELSE 'N'
#       END 

  - dimension: seen_gigya_num
    hidden: true
    sql: ${TABLE}.seen_gigya

  - measure: seen_gigya
    sql: |
      CASE
      WHEN sum(${seen_gigya_num})>0 THEN 'Y' ELSE 'N'
      END
      
  - dimension: seen_es_num
    hidden: true
    sql: ${TABLE}.seen_es

  - measure: seen_es
    sql: |
      CASE
      WHEN sum(${seen_es_num})>0 THEN 'Y' ELSE 'N'
      END
      
  - dimension: seen_nudge_num
    hidden: true
    sql: ${TABLE}.seen_nudge

  - measure: seen_nudge
    sql: |
      CASE
      WHEN sum(${seen_nudge_num})>0 THEN 'Y' ELSE 'N'
      END      
      
  - dimension: seen_dmp_num
    hidden: true
    sql: ${TABLE}.seen_dmp

  - measure: seen_dmp
    sql: |
      CASE
      WHEN sum(${seen_dmp_num})>0 THEN 'Y' ELSE 'N'
      END
  
  - measure: users_count
    type: count_distinct
    sql: ${TABLE}.idd_id

      
  sets:
    detail:
      - idd_id
      - email
      - created_by
      - date_created_time
      - last_updated_time
      - type
      - last_updated_diff

