- connection: caspian-live

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

- explore: gigya_users

  joins:
  - join: bauer_list
    type: inner
    relationship: one_to_many
    sql_on: ${bauer_list.customer_id} = ${gigya_users.email}
  
  - join: identities
    type: inner
    relationship: one_to_one
    sql_on: ${identities.email} = ${bauer_list.customer_id}
    
  - join: brand_preferences
    type: inner
    relationship: one_to_many
    sql_on: ${brand_preferences.idd_id} = ${identities.idd_id}

