- view: integrated_ads
  sql_table_name: publications.integrated_ads
  fields:

  - dimension: campaign_id
    type: string
    sql: ${TABLE}.campaign_id

  - dimension: campaign_name
    type: string
    sql: ${TABLE}.campaign_name
    
  - dimension: Brand
    type: string
    sql: |
     CASE
        WHEN ${channel_name} LIKE '%Parkers%' THEN 'Parkers'
        WHEN ${channel_name} LIKE '%Heatworld%' THEN 'Heat'
        WHEN ${channel_name} LIKE '%Classic-Cars-for-Sale%' THEN 'Classic Cars For Sale'
        WHEN ${channel_name} LIKE '%Empire%' THEN 'Empire'
        WHEN ${channel_name} LIKE '%Car%' THEN 'Car Magazine'
        WHEN ${channel_name} LIKE '%Closer%' THEN 'Closer'
        WHEN ${channel_name} LIKE '%Grazia%' THEN 'Grazia'
        WHEN ${channel_name} = 'SMODAUTOMOTIVE' THEN 'General Automotive'
        WHEN ${channel_name} = 'LWOMENS' THEN 'General Womens Lifestyle'
        WHEN ${channel_name} = 'SMOTORCYCLING' THEN 'General Motor Cycling'
        WHEN ${channel_name} LIKE '%LWLN_lifestyle.one%' THEN 'General Womens Lifestyle'
        WHEN ${channel_name} LIKE '%Ride%' THEN 'Ride'
        WHEN ${channel_name} LIKE '%Practical-Classics%' THEN 'Practical Classics'
        WHEN ${channel_name} LIKE '%Bike-Magazine%' THEN 'Bike Magazine'
        WHEN ${channel_name} LIKE '%Bird-Watching%' THEN 'Bird Watching'
        WHEN ${channel_name} LIKE '%RNAT_kiss%' THEN 'Kiss'
        WHEN ${channel_name} LIKE '%Trail-Running%' THEN 'Trail Running'
        WHEN ${channel_name} LIKE '%Modern-Gardens%' THEN 'Modern Gardens'
        WHEN ${channel_name} LIKE '%Steam-Railway%' THEN 'Steam Railway'
        WHEN ${channel_name} LIKE '%Classic-Bike%' THEN 'Classic Bike'
        WHEN ${channel_name} LIKE '%Match%' THEN 'Match'
        WHEN ${channel_name} LIKE '%Performance-Bikes%' THEN 'Performance Bikes'
        WHEN ${channel_name} LIKE '%LandScape%' THEN 'LandScape'
        WHEN ${channel_name} LIKE '%Top-Sante%' THEN 'Top Sante'
        WHEN ${channel_name} LIKE '%Garden-News%' THEN 'Garden News'
        WHEN ${channel_name} LIKE '%Practical-Sportsbikes%' THEN 'Practical Sportsbikes'
        WHEN ${channel_name} LIKE '%Model-Rail%' THEN 'Model Rail'
        WHEN ${channel_name} LIKE '%Garden-Answers%' THEN 'Garden Answers'
        WHEN ${channel_name} LIKE '%magic%' THEN 'Magic'
        WHEN ${channel_name} LIKE '%hallam%' THEN 'Hallam'
        WHEN ${channel_name} LIKE '%MCN%' THEN 'MCN'
        WHEN ${channel_name} LIKE '%_key%' THEN 'Key'
        WHEN ${channel_name} LIKE '%cool-fm%' THEN 'Cool FM'
        WHEN ${channel_name} LIKE '%_tay%' THEN 'Tay FM'
        WHEN ${channel_name} LIKE '%_metro%' THEN 'Metro'
        WHEN ${channel_name} LIKE '%planet-rock%' THEN 'Planet Rock'
        WHEN ${channel_name} LIKE '%northsound%' THEN 'Northsound'
        WHEN ${channel_name} LIKE '%clyde%' THEN 'Clyde'
        WHEN ${channel_name} LIKE '%viking%' THEN 'Viking'
        WHEN ${channel_name} LIKE '%downtown%' THEN 'Downtown'
        WHEN ${channel_name} LIKE '%Kerrang%' THEN 'Kerrang'
        WHEN ${channel_name} LIKE '%_tfm%' THEN 'TFM'
        WHEN ${channel_name} LIKE '%_mfr%' THEN 'MFR'
        WHEN ${channel_name} LIKE '%_forth%' THEN 'Forth'
        WHEN ${channel_name} LIKE '%_rock-fm%' THEN 'Rock FM'
        WHEN ${channel_name} LIKE '%_cfm%' THEN 'CFM'
        WHEN ${channel_name} LIKE '%_wave%' THEN 'Wave'

        
     ELSE 'Unknown'
     END
    
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

