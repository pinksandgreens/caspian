- view: es_competitions
  sql_table_name: publications.es_competitions
  fields:

  - dimension: id
    hidden: TRUE
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: brand
    label: 'Brand Code'
    type: string
    sql: ${TABLE}.brand

  - dimension_group: created
    label: 'Date Created'
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date

  - dimension: name
    label: 'Brand Name'
    type: string
    sql: ${TABLE}.name
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/14?Competition={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
    

  - dimension: ref_brand
    hidden: TRUE
    type: string
    sql: ${TABLE}.ref_brand

  - dimension: ref_campaign_aim
    label: 'Campaign Aim'
    type: string
    sql: ${TABLE}.ref_campaign_aim
    sql: |
      CASE ${TABLE}.ref_campaign_aim
        WHEN '' THEN 'Other'
        WHEN 'ACQ' THEN 'Acquisition'
        WHEN 'ENG' THEN 'Engagement'
        WHEN 'RET' THEN 'Retention'
      END

  - dimension: ref_campaign_description
    hidden: TRUE
    type: string
    sql: ${TABLE}.ref_campaign_description

  - dimension: ref_campaign_stakeholder
    label: 'Campaign Stakeholder'
    type: string
    sql: |
      CASE ${TABLE}.ref_campaign_stakeholder
        WHEN 'C' THEN 'Commercial'
        WHEN 'B' THEN 'Brand'
        WHEN 'M' THEN 'Marketing'
        WHEN 'E' THEN 'Event Registration'
        WHEN '' THEN 'Other'
      END

  - dimension: ref_campaign_type
    label: 'Campaign Type'
    type: string
    sql: ${TABLE}.ref_campaign_type

  - dimension: ref_channel
    hidden: FALSE
    type: string
    sql: ${TABLE}.ref_channel

  - dimension: ref_target_date
    hidden: TRUE
    type: string
    sql: ${TABLE}.ref_target_date

  - dimension: ref_taxonomy_1
    label: 'Campaign Taxonomy'
    type: string
    sql: ${TABLE}.ref_taxonomy_1
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/21?Category%2FTaxonomy={{ value }}&Timeframe=" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
    
  - dimension: ref_taxonomy_2
    hidden: TRUE
    type: string
    sql: ${TABLE}.ref_taxonomy_2

  - dimension: source
    hidden: TRUE
    type: string
    sql: ${TABLE}.source
  
  - dimension: external_ref
    hidden: TRUE
    type: string
    sql: |
      COALESCE (ref_brand,'')  || '-' || COALESCE (ref_channel, '')|| '-' || COALESCE (ref_campaign_stakeholder, '') || '-' || COALESCE (ref_campaign_description,'' ) || '-' || COALESCE (ref_target_date, '') || '-' || COALESCE (ref_campaign_aim, '') || '-' || COALESCE (ref_campaign_type, '') || '-' || COALESCE (ref_taxonomy_1, '') || COALESCE (ref_taxonomy_2, '')

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date

  - measure: count
    type: count
    drill_fields: [id, name, created, ref_brand, ref_campaign_aim, ref_campaign_description,ref_campaign_stakeholder, ref_taxonomy_1, source]

