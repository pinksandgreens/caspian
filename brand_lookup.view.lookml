- view: brand_lookup
  label: '1b. Brand Lookup'
  sql_table_name: publications.brand_lookup
  fields:

  - dimension: bra_business
    label: 'Brand Business'
    type: string
    sql: ${TABLE}.bra_business

  - dimension: bra_code
    label: 'Brand Code'
    type: string
    sql: ${TABLE}.bra_code

  - dimension: bra_comments
    hidden: TRUE
    type: string
    sql: ${TABLE}.bra_comments

  - dimension: bra_description
    label: 'Brand Name'
    type: string
    sql: ${TABLE}.bra_description
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/20?Brand%20Name={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
 
  - dimension: bra_description_reg
    label: 'Brand Name - Registrations'
    hidden: TRUE
    type: string
    sql: ${TABLE}.bra_description
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/28?Brand%20name={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
      
  - dimension: bra_description_ema
    label: 'Brand Name - Email'
    hidden: TRUE
    type: string
    sql: ${TABLE}.bra_description
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/55?Timeframe=21%20weeks&Brand:={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>

  - dimension: bra_market
    label: 'Brand Market'
    type: string
    sql: ${TABLE}.bra_market
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/23?Brand%20Code={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
      
  - dimension: bra_market_reg
    label: 'Brand Market - Registrations'
    hidden: TRUE
    type: string
    sql: ${TABLE}.bra_market
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/29?Market%20type={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)

  - dimension: bra_market_ema
    label: 'Brand Market - Email'
    hidden: TRUE
    type: string
    sql: ${TABLE}.bra_market
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/56?Timeframe=21%20weeks&Market:={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
      
  - dimension: bra_obsolete
    hidden: TRUE
    type: string
    sql: ${TABLE}.bra_obsolete

  - dimension: bra_parent_code
    hidden: TRUE
    type: string
    sql: ${TABLE}.bra_parent_code

  - measure: count
    hidden: TRUE
    type: count
    drill_fields: []

