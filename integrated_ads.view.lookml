- view: integrated_ads
  sql_table_name: publications.integrated_ads
  fields:

  - dimension: campaign_id
    type: string
    sql: ${TABLE}.campaign_id

  - dimension: campaign_name
    type: string
    sql: ${TABLE}.campaign_name

  - dimension: channel_id
    type: string
    sql: ${TABLE}.channel_id

  - dimension: channel_name
    type: string
    sql: ${TABLE}.channel_name

  - measure: gross_impressions
    type: sum
    sql: ${TABLE}.gross_impressions

  - measure: gross_invalid_impressions
    type: sum
    sql: ${TABLE}.gross_invalid_impressions

  - measure: gross_measured_impressions
    type: sum
    sql: ${TABLE}.gross_measured_impressions

  - measure: in_view_impressions
    type: sum
    sql: ${TABLE}.in_view_impressions

  - measure: in_view_percent
    type: avg
    sql: ${TABLE}.in_view_percent

  - measure: measured_impressions
    type: sum
    sql: ${TABLE}.measured_impressions

  - measure: measured_rate
    type: avg
    sql: ${TABLE}.measured_rate

  - measure: net_eligible_impressions
    type: sum
    sql: ${TABLE}.net_eligible_impressions

  - measure: net_measured_impressions
    type: sum
    sql: ${TABLE}.net_measured_impressions

  - measure: net_non_viewable_impressions
    type: sum
    sql: ${TABLE}.net_non_viewable_impressions

  - measure: net_unmeasured_impressions
    type: sum
    sql: ${TABLE}.net_unmeasured_impressions

  - measure: net_viewable_impressions
    type: sum
    sql: ${TABLE}.net_viewable_impressions

  - measure: net_viewable_rate
    type: avg
    sql: ${TABLE}.net_viewable_rate

  - measure: out_of_view_impressions
    type: sum
    sql: ${TABLE}.out_of_view_impressions

  - measure: out_of_view_percent
    type: avg
    sql: ${TABLE}.out_of_view_percent

  - dimension: placement_id
    type: string
    sql: ${TABLE}.placement_id

  - dimension: placement_name
    type: string
    sql: ${TABLE}.placement_name

  - dimension: publisher_id
    type: string
    sql: ${TABLE}.publisher_id

  - dimension: publisher_name
    type: string
    sql: ${TABLE}.publisher_name

  - measure: suspicious_impressions
    type: sum
    sql: ${TABLE}.suspicious_impressions

  - measure: total_impressions
    type: sum
    sql: ${TABLE}.total_impressions

  - measure: total_net_eligible_impressions
    type: sum
    sql: ${TABLE}.total_net_eligible_impressions

  - measure: total_net_in_view_percent
    type: avg
    sql: ${TABLE}.total_net_in_view_percent

  - measure: total_net_measured_impressions
    type: sum
    sql: ${TABLE}.total_net_measured_impressions

  - measure: total_net_measured_rate
    type: avg
    sql: ${TABLE}.total_net_measured_rate

  - measure: total_net_out_of_view_percent
    type: avg
    sql: ${TABLE}.total_net_out_of_view_percent

  - measure: total_net_unmeasured_impressions
    type: sum
    sql: ${TABLE}.total_net_unmeasured_impressions

  - measure: total_net_unmeasured_percent
    type: avg
    sql: ${TABLE}.total_net_unmeasured_percent

  - measure: total_net_viewable_rate
    type: avg
    sql: ${TABLE}.total_net_viewable_rate

  - measure: total_out_of_view_impressions
    type: sum
    sql: ${TABLE}.total_out_of_view_impressions

  - measure: unmeasured_impressions
    type: sum
    sql: ${TABLE}.unmeasured_impressions

  - measure: unmeasured_percent
    type: avg
    sql: ${TABLE}.unmeasured_percent

  - measure: viewable_rate
    type: avg
    sql: ${TABLE}.viewable_rate

