- view: brand_lookup
  sql_table_name: publications.brand_lookup
  fields:

  - dimension: bra_business
    type: string
    sql: ${TABLE}.bra_business

  - dimension: bra_code
    type: string
    sql: ${TABLE}.bra_code

  - dimension: bra_comments
    type: string
    sql: ${TABLE}.bra_comments

  - dimension: bra_description
    type: string
    sql: ${TABLE}.bra_description
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/20?Brand%20Name={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
 
  - dimension: bra_description_reg
    type: string
    sql: ${TABLE}.bra_description
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/28?Brand%20name={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
      
  - dimension: bra_market
    type: string
    sql: ${TABLE}.bra_market
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/23?Brand%20Code={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
      
  - dimension: bra_market_reg
    type: string
    sql: ${TABLE}.bra_market
    html: |
      {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/29?Market%20type={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)

  - dimension: bra_obsolete
    type: string
    sql: ${TABLE}.bra_obsolete

  - dimension: bra_parent_code
    type: string
    sql: ${TABLE}.bra_parent_code

  - measure: count
    type: count
    drill_fields: []

