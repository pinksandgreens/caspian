view: brand_lookup {
  label: "Brand Lookup"
  sql_table_name: publications.brand_lookup ;;

  dimension: bra_business {
    label: "Brand Business"
    type: string
    sql: ${TABLE}.bra_business ;;
  }

  dimension: bra_code {
    label: "Brand Code"
    type: string
    sql: ${TABLE}.bra_code ;;
  }

  dimension: bra_comments {
    hidden: yes
    type: string
    sql: ${TABLE}.bra_comments ;;
  }

  dimension: bra_description {
    label: "Brand Name"
    type: string
    sql: ${TABLE}.bra_description ;;
  }

  dimension: bra_description_comp {
    label: "Brand Name - Competitions"
    hidden: yes
    type: string
    sql: ${TABLE}.bra_description ;;
    html: {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/20?Brand%20Name={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
      ;;
  }

  dimension: bra_description_reg {
    label: "Brand Name - Registrations"
    hidden: yes
    type: string
    sql: ${TABLE}.bra_description ;;
    html: {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/28?Brand%20name={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
      ;;
  }

  dimension: bra_description_ema {
    label: "Brand Name - Email"
    hidden: yes
    type: string
    sql: ${TABLE}.bra_description ;;
    html: {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/55?Timeframe=21%20weeks&Brand:={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a>
      ;;
  }

  dimension: bra_market {
    label: "Brand Market"
    type: string
    sql: ${TABLE}.bra_market ;;
  }

  dimension: bra_market_comp {
    label: "Brand Market - Competitions"
    hidden: yes
    type: string
    sql: ${TABLE}.bra_market ;;
    html: {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/23?Brand%20Code={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
      ;;
  }

  dimension: bra_market_reg {
    label: "Brand Market - Registrations"
    hidden: yes
    type: string
    sql: ${TABLE}.bra_market ;;
    html: {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/29?Market%20type={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
      ;;
  }

  dimension: bra_market_ema {
    label: "Brand Market - Email"
    hidden: yes
    type: string
    sql: ${TABLE}.bra_market ;;
    html: {{ linked_value }}
      <a href="https://bauerxcel.looker.com/dashboards/56?Timeframe=21%20weeks&Market:={{ value }}" target="_new">
      <img src="http://i.imgur.com/aJnF2oW.jpg" height=10 width=10></a)
      ;;
  }

  dimension: bra_obsolete {
    hidden: yes
    type: string
    sql: ${TABLE}.bra_obsolete ;;
  }

  dimension: bra_parent_code {
    hidden: yes
    type: string
    sql: ${TABLE}.bra_parent_code ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
