- view: es_competitions
  sql_table_name: publications.es_competitions
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date

  - dimension: name
    type: string
    sql: ${TABLE}.name
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/14?Competition={{ value }}" target="_new">
      <img src="http://dreamatico.com/data_images/kitten/kitten-1.jpg" height=20 width=20></a)
    

  - dimension: ref_brand
    type: string
    sql: ${TABLE}.ref_brand

  - dimension: ref_campaign_aim
    type: string
    sql: ${TABLE}.ref_campaign_aim

  - dimension: ref_campaign_description
    type: string
    sql: ${TABLE}.ref_campaign_description

  - dimension: ref_campaign_stakeholder
    type: string
    sql: |
      CASE ${TABLE}.ref_campaign_stakeholder
        WHEN 'C' THEN 'Commercial'
        WHEN 'S' THEN 'Service'
        WHEN 'B' THEN 'Brand'
        WHEN 'M' THEN 'Marketing'
      END

  - dimension: ref_campaign_type
    type: string
    sql: ${TABLE}.ref_campaign_type

  - dimension: ref_channel
    type: string
    sql: ${TABLE}.ref_channel

  - dimension: ref_target_date
    type: string
    sql: ${TABLE}.ref_target_date

  - dimension: ref_taxonomy_1
    type: string
    sql: ${TABLE}.ref_taxonomy_1

  - dimension: ref_taxonomy_2
    type: string
    sql: ${TABLE}.ref_taxonomy_2

  - dimension: source
    type: string
    sql: ${TABLE}.source
  
  - dimension: external_ref
    type: string
    sql: |
      COALESCE (ref_brand,'')  || '-' || COALESCE (ref_channel, '')|| '-' || COALESCE (ref_campaign_stakeholder, '') || '-' || COALESCE (ref_campaign_description,'' ) || '-' || COALESCE (ref_target_date, '') || '-' || COALESCE (ref_campaign_aim, '') || '-' || COALESCE (ref_campaign_type, '') || '-' || COALESCE (ref_taxonomy_1, '') || COALESCE (ref_taxonomy_2, '')

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date

  - measure: count
    type: count
    drill_fields: [id, name]

