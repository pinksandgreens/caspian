view: es_competitions {
  label: "2c. Competition Information"
  sql_table_name: publications.es_competitions ;;

  dimension: id {
    label: "Competition ID"
    hidden: no
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    label: "Brand Code"
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension_group: created {
    label: "Created"
    type: time
    timeframes: [time, date, week, month, month_num]
    sql: ${TABLE}.created_date ;;
  }

  dimension_group: created_week {
    label: " "
    hidden: yes
    type: time
    timeframes: [week_of_year]
    sql: ${TABLE}.created_date ;;
  }

  dimension_group: created_month {
    label: " "
    hidden: yes
    type: time
    timeframes: [month_name]
    sql: ${TABLE}.created_date ;;
  }

  dimension: name {
    label: "Competition Name"
    type: string
    sql: ${TABLE}.name ;;
    html: {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/14?Competition={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
      ;;
  }

  dimension: ref_brand {
    hidden: no
    type: string
    sql: ${TABLE}.ref_brand ;;
  }

  dimension: ref_campaign_aim {
    label: "Campaign Aim"
    type: string
    sql: CASE ${TABLE}.ref_campaign_aim
        WHEN '' THEN 'Other'
        WHEN 'ACQ' THEN 'Acquisition'
        WHEN 'ENG' THEN 'Engagement'
        WHEN 'RET' THEN 'Retention'
      END
       ;;
  }

  dimension: ref_campaign_description {
    hidden: yes
    type: string
    sql: ${TABLE}.ref_campaign_description ;;
  }

  dimension: ref_campaign_stakeholder {
    label: "Campaign Stakeholder"
    type: string
    sql: CASE ${TABLE}.ref_campaign_stakeholder
        WHEN 'C' THEN 'Commercial'
        WHEN 'B' THEN 'Brand'
        WHEN 'M' THEN 'Marketing'
        WHEN 'E' THEN 'Event Registration'
        WHEN '' THEN 'Other'
      END
       ;;
  }

  dimension: ref_campaign_type {
    label: "Campaign Type"
    type: string
    sql: CASE ${TABLE}.ref_campaign_type
        WHEN 'CMP' THEN 'Competition'
        WHEN 'CON' THEN 'Contest'
        WHEN 'OTH' THEN 'Other'
        WHEN 'POL' THEN 'Poll'
        WHEN 'PRM' THEN 'Promotion'
        WHEN 'QIZ' THEN 'Quiz'
        WHEN 'REG' THEN 'Registration'
        WHEN 'SOW' THEN 'Social Wall'
        WHEN '' THEN 'Unknown'
      END
       ;;
  }

  dimension: ref_channel {
    label: "Entry Channel"
    hidden: no
    type: string
    sql: CASE ${TABLE}.ref_channel
        WHEN 'W' THEN 'Web'
        WHEN 'M' THEN 'Microsite'
        WHEN 'F' THEN 'Facebook'
        WHEN 'T' THEN 'Twitter'
        WHEN 'I' THEN 'Instagram'
        WHEN '' THEN 'Unknown'
      END
       ;;
  }

  dimension: ref_target_date {
    hidden: yes
    type: string
    sql: ${TABLE}.ref_target_date ;;
  }

  dimension: ref_taxonomy_1 {
    label: "Campaign Taxonomy"
    type: string
    sql: ${TABLE}.ref_taxonomy_1 ;;
    html: {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/21?Category%2FTaxonomy={{ value }}&Timeframe=" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
      ;;
  }

  dimension: ref_taxonomy_2 {
    hidden: yes
    type: string
    sql: ${TABLE}.ref_taxonomy_2 ;;
  }

  dimension: source {
    hidden: yes
    type: string
    sql: ${TABLE}.source ;;
  }

  #      COALESCE (ref_brand,'')  || '-' || COALESCE (ref_channel, '')|| '-' || COALESCE (ref_campaign_stakeholder, '') || '-' || COALESCE (ref_campaign_description,'' ) || '-' || COALESCE (ref_target_date, '') || '-' || COALESCE (ref_campaign_aim, '') || '-' || COALESCE (ref_campaign_type, '') || '-' || COALESCE (ref_taxonomy_1, '') || COALESCE (ref_taxonomy_2, '')

  dimension: external_ref {
    hidden: yes
    type: string
    sql: COALESCE (${TABLE}.ref_brand,'')  || '-' || COALESCE (${TABLE}.ref_channel, '')|| '-' || COALESCE (${TABLE}.ref_campaign_stakeholder, '') || '-' || COALESCE (${TABLE}.ref_campaign_description,'' ) || '-' || COALESCE (${TABLE}.ref_target_date, '') || '-' || COALESCE (${TABLE}.ref_campaign_aim, '') || '-' || COALESCE (${TABLE}.ref_campaign_type, '') || '-' || COALESCE (${TABLE}.ref_taxonomy_1, '') || COALESCE (ref_taxonomy_2, '')
      ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_date ;;
  }

  measure: competitions_count {
    label: "Competitions Count"
    type: count_distinct
    sql: ${TABLE}.id ;;
drill_fields: [
      id,
      name,
      created_date,
      ref_brand,
      ref_campaign_aim,
      ref_campaign_description,
      ref_campaign_stakeholder,
      ref_taxonomy_1,
      source
    ]
    }

}
