- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: responsy_active
  joins:
    - join: bauer_list
      type: inner
      relationship: one_to_one
      sql_on: ${bauer_list.email_address} = ${responsy_active.email_address}
    
    - join: brand_lookup
      type: inner
      relationship: one_to_one
      sql_on: ${brand_lookup.bra_code} = ${responsy_active.launch_name},
    